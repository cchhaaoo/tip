set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


ALTER PROCEDURE [dbo].[rpt_competency_ge2013_proc] 
	@start_year int,
	@end_year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[rpt_competency_ge2013]
	DELETE FROM [dbo].[rpt_competency_ge2013_tree_map]
	DELETE FROM [dbo].[rpt_competency_ge2013_metric]

	--
	-- Generate the tree of metrics
	--

	DECLARE @CurrentID INT
	DECLARE @ParentID INT

	-- Root
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('All Stats')
	SET @ParentID = SCOPE_IDENTITY()

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Core Clerkship Shelf Exam Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neurology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Psychiatry')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Gynechology/Obsetrics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Surgery')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Medicine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pediatrics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Descend
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pre-Clinical Course Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

	SET @ParentID = @CurrentID
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Scientific Foundations of Medicine')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

	-- Leaf
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Macromolecules')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cell Physiology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Metabolism')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genetics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pharmacology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

 	-- Recurse
	SELECT @ParentID = competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID

	-- Descend
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society I')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Immunology I')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Microbiology/Infectious Disease')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Immunology II')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Hematology/Oncology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	SELECT @ParentID = competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society II')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Brain, Mind, & Behavior')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	SET @ParentID = @CurrentID

	-- Descend
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Nervous System and Special Senses')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroanatomy')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('NSS: Exam 2')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroscience')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Recurse × 2
	SELECT @ParentID = competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID
	SELECT @ParentID = competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society III')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cardiovascular')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Respiratory')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Renal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Recurse
	SELECT @ParentID = competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society IV')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('GI Liver')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Endocrine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Reproductive')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Musculoskeletal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	--
	-- Add metrics for leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c.id, 'Average', AVG(course_section_grade), 1
			FROM [dbo].[rpt_competency_ge2013] c INNER JOIN [dbo].[student_section_grade] g
				ON c.name = g.section_title
				GROUP BY c.name, c.id

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c.id, 'Standard Deviation', STDEV(course_section_grade), 2
			FROM [dbo].[rpt_competency_ge2013] c INNER JOIN [dbo].[student_section_grade] g
				ON c.name = g.section_title
				GROUP BY c.name, c.id

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c.id, '# of Scores', COUNT(course_section_grade), 3
			FROM [dbo].[rpt_competency_ge2013] c INNER JOIN [dbo].[student_section_grade] g
				ON c.name = g.section_title
				GROUP BY c.name, c.id

	--
	-- Add metrics for first-level parents
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c1.id, 'Average', AVG(course_section_grade), 1
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t on c1.id = t.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t.child_id = c2.id
				INNER JOIN [dbo].[student_section_grade] g on c2.name = g.section_title
				GROUP BY c1.id

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c1.id, 'Standard Deviation', STDEV(course_section_grade), 2
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t on c1.id = t.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t.child_id = c2.id
				INNER JOIN [dbo].[student_section_grade] g on c2.name = g.section_title
				GROUP BY c1.id

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c1.id, '# of Scores', COUNT(course_section_grade), 3
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t on c1.id = t.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t.child_id = c2.id
				INNER JOIN [dbo].[student_section_grade] g on c2.name = g.section_title
				GROUP BY c1.id

	--
	-- Add metrics for second-level parents
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c1.id, 'Average', AVG(course_section_grade), 1
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t1 on c1.id = t1.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t1.child_id = c2.id
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t2 on c2.id = t2.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c3 on t2.child_id = c3.id
				INNER JOIN [dbo].[student_section_grade] g on c3.name = g.section_title
				GROUP BY c1.id

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c1.id, 'Standard Deviation', STDEV(course_section_grade), 2
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t1 on c1.id = t1.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t1.child_id = c2.id
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t2 on c2.id = t2.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c3 on t2.child_id = c3.id
				INNER JOIN [dbo].[student_section_grade] g on c3.name = g.section_title
				GROUP BY c1.id

	INSERT INTO [dbo].[rpt_competency_ge2013_metric]
		( competency_id, name, score, [order] )
		SELECT c1.id, '# of Scores', COUNT(course_section_grade), 3
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t1 on c1.id = t1.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t1.child_id = c2.id
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t2 on c2.id = t2.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c3 on t2.child_id = c3.id
				INNER JOIN [dbo].[student_section_grade] g on c3.name = g.section_title
				GROUP BY c1.id

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
END