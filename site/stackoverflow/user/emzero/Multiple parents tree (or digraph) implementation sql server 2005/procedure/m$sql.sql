CREATE TABLE IF NOT EXISTS #ObjectRelations ( Id varchar(20), NextId varchar(20) )

/* Cycle */
/*
insert into #ObjectRelations values ('A', 'B')
insert into #ObjectRelations values ('B', 'C') 
insert into #ObjectRelations values ('C', 'A')
*/

/* Multi root */
insert into #ObjectRelations values ('G', 'B')
insert into #ObjectRelations values ('A', 'B') 
insert into #ObjectRelations values ('B', 'C')
insert into #ObjectRelations values ('B', 'X')
insert into #ObjectRelations values ('C', 'E') 
insert into #ObjectRelations values ('C', 'D') 
insert into #ObjectRelations values ('E', 'F') 
insert into #ObjectRelations values ('D', 'F') 

declare @startIds table ( Id varchar(20) primary key )

;WITH 
    Ids (Id) AS ( SELECT Id FROM #ObjectRelations ),
    NextIds (Id) AS ( SELECT NextId FROM #ObjectRelations )
INSERT INTO @startIds
  /* This select will not return anything since there are not objects without predecessor, because it's a cyclic of course */
  SELECT DISTINCT Ids.Id FROM Ids
    LEFT JOIN NextIds on Ids.Id = NextIds.Id
    WHERE NextIds.Id IS NULL
  UNION
    /* So let's just pick anyone. (the way I will be getting the starting object for a cyclic doesn't matter for the regarding problem)*/
    SELECT TOP 1 Id FROM Ids

;WITH Objects (Id, NextId, [Level], Path) AS
( -- This is the 'Anchor' or starting point of the recursive query
  SELECT rel.Id, rel.NextId, 1, CAST(rel.Id as VARCHAR(MAX))
    FROM #ObjectRelations rel
    WHERE rel.Id IN ( SELECT Id FROM @startIds )
  UNION ALL
  SELECT rel.Id, rel.NextId, [Level] + 1, RecObjects.Path + ', ' + rel.Id
    FROM #ObjectRelations rel
   INNER JOIN Objects RecObjects -- recursive join
      ON rel.Id = RecObjects.NextId
   WHERE RecObjects.Path NOT LIKE '%' + rel.Id + '%'

)
SELECT DISTINCT Id, NextId, [Level], Path
FROM    Objects
ORDER BY [Level]

drop table #ObjectRelations