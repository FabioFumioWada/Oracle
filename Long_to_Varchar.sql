Long
Varchar
Conversão

A function abaixo, foi adaptada em "29/08/2018", para utilizar os dados de Ocorrências do Aluno (campo Long), para que pudesse ser lido no integrador da Escola em Movimento.


CREATE OR REPLACE FUNCTION RM.FNC_LONG_TO_VARCHAR(  V_IN_ROWID ROWID, 
                                                    V_IN_TABLE_NAME VARCHAR, 
                                                    V_IN_COLUMN VARCHAR2) 
RETURN VARCHAR AS

    /* ADAPTADO POR FÁBIO FUMIO WADA EM 29/08/2018 */

    V_RESULTADO_TEXTO VARCHAR2(32767);

    V_COMANDO_SQL VARCHAR2(2000);

BEGIN

    V_COMANDO_SQL := 'SELECT '||V_IN_TABLE_NAME||'.'||V_IN_COLUMN||' FROM '||V_IN_TABLE_NAME||' WHERE ROWID ='||CHR(39) ||V_IN_ROWID||CHR(39);

    EXECUTE IMMEDIATE V_COMANDO_SQL INTO V_RESULTADO_TEXTO;

    V_RESULTADO_TEXTO := SUBSTR(V_RESULTADO_TEXTO, 1, 4000);

    RETURN V_RESULTADO_TEXTO;

END;


A sua utilização é feita da seguinte forma:

SELECT CODCOLIGADA, RA, IDOCORALUNO, OBSERVACOES, RM.LONG_TO_VARCHAR(ROWID,'RM.SOCORRENCIAALUNO','OBSERVACOES') AS OBSERVACOES_STR
FROM RM.SOCORRENCIAALUNO A
WHERE CODCOLIGADA = 7


