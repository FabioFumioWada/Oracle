select to_char(19.00,'999D99') from dual;

Colado de <http://glufke.net/oracle/viewtopic.php?t=4582> 


SELECT CODCOLIGADA, CHAPA, TO_CHAR(SALARIO, '999999990D99') AS SALARIO, CPF
FROM 	PFUNC
			INNER JOIN PPESSOA
				ON PFUNC.CODPESSOA = PPESSOA.CODIGO
WHERE CODCOLIGADA = :CODCOLIGADA
