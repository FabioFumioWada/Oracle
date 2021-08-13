	1) Descobrir código de um caracter ASC

SELECT ASCII('')
FROM DUAL

Resultado: 129


	2) Remover o caracter ASC de um texto:

SELECT  REPLACE(HISTORICO, CHR(129),'')
FROM FLAN
WHERE CODCOLIGADA = 3
AND IDLAN = 567


	3) Descobrir se um campo, tem um determinado caracter ASC:

SELECT  IDLAN,
               HISTORICO,
               REPLACE(HISTORICO,CHR(129),'=+-+=') A129,
               REPLACE(HISTORICO,CHR(141),'=+-+=') A141        
FROM FLAN
WHERE CODCOLIGADA = 3
AND (REPLACE(HISTORICO,CHR(129),'=+-+=') LIKE '%=+-+=%'
OR REPLACE(HISTORICO,CHR(141),'=+-+=') LIKE '%=+-+=%' )
