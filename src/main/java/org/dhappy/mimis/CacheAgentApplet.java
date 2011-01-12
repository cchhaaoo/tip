package org.dhappy.mimis;

import netscape.javascript.JSObject;
import netscape.javascript.JSException;
import java.io.File;
import java.io.IOException;
import javax.swing.JApplet;
import javax.swing.SwingUtilities;

import java.util.logging.Logger;

public class CacheAgentApplet extends JApplet {
    private static Logger log =
	Logger.getLogger( CacheAgentApplet.class.getName() );

    //Called when this applet is loaded into the browser.
    public void init() {
        final JApplet container = this;

        try {
            SwingUtilities.invokeAndWait( new Runnable() {
		    public void run() {
			//container.setContentPane(newContentPane);        
			log.info( "Applet Started" );

                        JSObject win = JSObject.getWindow( container );
                        JSObject doc = (JSObject)win.getMember( "document" );
                        JSObject loc = (JSObject)doc.getMember( "location" );

                        String href = (String)loc.getMember( "href" );
                        log.info( "document.location.href = " + href );

                        try {
                            win.call( "tip_mimis_applet_load",
                                      new Object[]{ new String[] { "test" } } );
                        } catch( JSException e ) {
                            log.warning( "Callback Failed: " + e.getMessage() );
                        }

			for( File root : File.listRoots() ) {
			    try {
				log.info( root.getCanonicalPath() );
			    } catch( IOException ioe ) {
				log.warning( "File Error: " + ioe.getMessage() );
			    }
			}
		    }
		} );
        } catch( Exception e ) {
            log.warning( "Failed to Load: " + e.getMessage() );
        }
    }

    public Object get( String key ) {
        return retrieve( key );
    }

    public Object retrieve( String key ) {
        log.info( "retrieve:" + key );
        return key;
    }
}
