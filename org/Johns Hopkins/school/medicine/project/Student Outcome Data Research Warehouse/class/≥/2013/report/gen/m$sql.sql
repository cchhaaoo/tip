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
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Gynecology/Obstetrics')
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

	-- Move to sibling
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

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society II')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Brain, Mind, & Behavior')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	SET @ParentID = @CurrentID
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Nervous System and Special Senses')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroanatomy')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('NSS: Exam 2')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroscience')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Recurse
	SET @ParentID = ( SELECT competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society III')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cardiovascular')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Respiratory')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Renal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

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

	SET @ParentID = ( SELECT competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Comprehensive Basic Science Exam')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Comprehensive Basic Science')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	--
	-- Add scores for section leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score )
		SELECT c.id, course_section_grade
			FROM [dbo].[rpt_competency_ge2013] c INNER JOIN [dbo].[student_section_grade] g
				ON c.name = g.section_title
	--
	-- Add scores for shelf exam leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score )
		SELECT c.id, shlf_exm_std_a_grd
			FROM [dbo].[rpt_competency_ge2013] c INNER JOIN [dbo].[student_shlf_exm_a] e
				ON c.name = e.shlf_exm_dsc

	--
	-- Calculate metrics for combinations of scores
	--

	DECLARE @CompetencyID INT
	DECLARE @avg REAL
	DECLARE @stddev REAL
	DECLARE @count REAL
	DECLARE c CURSOR FOR
		-- Add metrics for leaves
		SELECT c.id as competency_id, AVG(score) as avg, STDEV(score) as stddev, COUNT(score) as count
			FROM [dbo].[rpt_competency_ge2013] c
				INNER JOIN [dbo].[rpt_competency_ge2013_score] s
				ON c.id = s.competency_id
				GROUP BY c.id
		UNION
		-- Add metrics for first-level parents
		SELECT c1.id, AVG(score) as avg, STDEV(score) as stddev, COUNT(score) as count
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t on c1.id = t.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t.child_id = c2.id
				INNER JOIN [dbo].[rpt_competency_ge2013_score] s
				ON c2.id = s.competency_id
				GROUP BY c1.id
		UNION
		-- Add metrics for second-level parents
		SELECT c1.id, AVG(score) as avg, STDEV(score) as stddev, COUNT(score) as count
			FROM [dbo].[rpt_competency_ge2013] c1
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t1 on c1.id = t1.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c2 on t1.child_id = c2.id
				INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t2 on c2.id = t2.competency_id
				INNER JOIN [dbo].[rpt_competency_ge2013] c3 on t2.child_id = c3.id
				INNER JOIN [dbo].[rpt_competency_ge2013_score] s
				ON c3.id = s.competency_id
				GROUP BY c1.id
	OPEN c
		FETCH next FROM c INTO @CompetencyID, @avg, @stddev, @count
		WHILE @@Fetch_Status = 0 BEGIN
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, [order] )
													  VALUES ( @CompetencyID, 'Average', @avg, 1 )
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, [order] )
													  VALUES ( @CompetencyID, 'Standard Deviation', @stddev, 2 )
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, [order] )
													  VALUES ( @CompetencyID, '# of Scores', @count, 3 )
			FETCH next FROM c INTO @CompetencyID, @avg, @stddev, @count
		END

	CLOSE c
	DEALLOCATE c
END