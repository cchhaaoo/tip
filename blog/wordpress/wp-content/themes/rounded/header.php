<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="text/html; charset=<?php bloginfo('charset'); ?>" />
	<title><?php wp_title(); ?> <?php bloginfo('name'); ?></title>

	<style type="text/css" media="screen">
		@import url( <?php bloginfo('stylesheet_url'); ?> );
	</style>

	<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
	<?php 
	if ( is_singular() ) wp_enqueue_script( 'comment-reply' );
	wp_head(); 
	?>

<!--[if lt IE 7.]>
<script defer type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/pngfix.js"></script>
<![endif]-->

</head>

<body>
<div id="rap">

<div id="masthead">
		<div id="pagetab">
			<div class="ltab">&nbsp;</div>
			<?php wp_nav_menu( array( 'container' => false, 'theme_location' => 'primary', 'fallback_cb' => 'rounded_page_menu' ) ); ?>
			<div class="rtab">&nbsp;</div>
		</div><!-- end PAGETAB -->
		<h1><a href="<?php bloginfo( 'url' ); ?>"><?php bloginfo( 'name' ); ?></a></h1>
							
				<h2><?php bloginfo( 'description' ); ?></h2>
				
</div><!-- end MASTHEAD -->

<div id="main">

<div id="content">
<!-- end header -->