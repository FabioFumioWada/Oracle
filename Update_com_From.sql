Exemplo:

-- ATUALIZA CAMPO DE HORARIO (LEGADO)
 UPDATE ZIMPFUNC_DEPARA_MATER A SET A.CODHORARIOLEG = ( SELECT  COD_HORARIO_061
                                                        FROM ZIMPFUNCIONARIOS_MATER B
                                                        WHERE B.CHAPA_001 = A.CODFUNC);
                                                                                                               
-- ATUALIZA CAMPO DE HORARIO (RM)
 UPDATE ZIMPFUNC_DEPARA_MATER A SET CODHORARIORM = ( SELECT  CODLABORE
                                                     FROM ZIMPFUNC_HORARIOS B
                                                     WHERE upper(substr(descr_dominio,2,length(descr_dominio))) = upper(a.codhorarioleg));   


==============================================================================

How to do cross table update in Oracle



Cross table update (also known as correlated update, or multiple table update) in Oracle uses non-standard SQL syntax format (non ANSI standard) to update rows in another table. The differences in syntax are quite dramatic compared to other database systems like MS SQL Server or MySQL. 
In this article, we are going to look at four scenarios for Oracle cross table update. 
Suppose we have two tables Categories and Categories_Test. See screenshots below. 
The common column in the two tables is CATEGORY_ID. We are going to update column DESCRIPTION and PICTURE in table Categories_Test by using data in table Categories, based on data in the common column CATEGORY_ID. 
Table: Categories

Table: Categories_Test

1. Update data in a column in table A based on a common column in table B. 
The update query below shows that the PICTURE column is updated by looking up the same ID value in CATEGORY_ID column in table Categories_Test and Categories. 

update Categories_Test a
set a.Picture = (select b.Picture from Categories b where b.Category_ID = a.Category_ID)
PICTURE column was updated.

2. Update data in two columns in table A based on a common column in table B. 
If you need to update multiple columns simultaneously, use comma to separate each column after the SET keyword. 

update Categories_Test a
set (a.Description, a.Picture) = (select b.Description, b.Picture 
                                  from Categories b 
                                  where b.Category_ID = a.Category_ID)
Both DESCRIPTION and PICTURE column were updated.

3. Conditionally update data in table A based on a common column in table B. 
Here we only want to update PICTURE column in Categories_Test table where the data in Category_Name column is Seafood in table Categories. 

update Categories_Test a
set a.Picture = (select b.Picture from Categories b where b.Category_ID = a.Category_ID)
where exists 
(
    select * from Categories b
    where b.Category_ID = a.Category_ID
        and b.Category_Name = 'Seafood'
)
PICTURE column was updated where Category_Name is Seafood.

The query below does NOT work for this conditional update. It always updates all rows in PICTURE column in table Categories_Test. 

update Categories_Test a
set a.Picture = (select b.Picture 
                 from Categories b 
                 where b.Category_ID = a.Category_ID 
                   and b.Category_Name = 'Seafood')
4. Update data in table A based on two or more common columns in table B. 
Updates based on two or more common columns are normally used for tables where multiple columns work together as a primary key (known as composite primary key). These columns uniquely identify a record in a table. Please note that query below is used for illustration purpose because Category_ID alone is primary key. 

update Categories_Test a
set (a.Description, a.Picture) = (select b.Description, b.Picture 
                                  from Categories b 
                                  where b.Category_ID = a.Category_ID 
                                    and b.Category_Name = a.Category_Name)
Data in DESCRIPTION and PICTURE column in table Categories_Test were updated.

Happy updating!

Colado de <http://www.geeksengine.com/article/oracle-cross-table-update.html> 
