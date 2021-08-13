Erro de SQL: ORA-01502: índice 'RM.PKTTMVEXT' ou a sua partição está em estado não utilizável
01502. 00000 -  "index '%s.%s' or partition of such index is in unusable state"
*Cause:    An attempt has been made to access an index or index partition
           that has been marked unusable by a direct load or by a DDL
           operation
*Action:   DROP the specified index, or REBUILD the specified index, or
           REBUILD the unusable index partition



Solução:

Quando apresentar o erro acima, devemos verificar se o índice está com algum erro, com a seguinte query:

select index_name,status from user_indexes where status='UNUSABLE'

Sendo ela listada na query acima, devemos então recompilar a mesma:

ALTER INDEX PKTTMVEXT REBUILD; 

Após a recompilação, execute novamente a query e verifique se ela continua com problema:

select index_name,status from user_indexes where status='UNUSABLE'
 
