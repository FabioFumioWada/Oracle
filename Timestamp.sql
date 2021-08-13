#timestamp
#oracle
#data
   

SELECT  LOCALTIMESTAMP DATAHORA
FROM DUAL;

Na query do TOTVS devemos transformar em varchar:

SELECT  TO_CHAR(LOCALTIMESTAMP) DATAHORA
FROM DUAL