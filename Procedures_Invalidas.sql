SELECT OBJECT_NAME, STATUS
FROM DBA_OBJECTS
WHERE OBJECT_TYPE = ’PROCEDURE’
AND STATUS = ‘INVALID’

Colado de <https://lilianbarroso.wordpress.com/2014/03/11/encontrando-a-data-de-criacao-de-uma-tabela-no-oracle/> 
