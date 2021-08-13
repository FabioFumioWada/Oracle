http://www.vihdamarques.com.br/2012/02/como-agrupar-varias-linhas-um-uma-no-oracle/


-- Comando WM_CONCAT

           SELECT WM_CONCAT(CODTRB)
           FROM TTRBPRD
           WHERE CODCOLIGADA = 11
           AND IDPRD = 8

	Resultado:  CSRF,INSSPJ,IRRFPJ

	** O resultado sempre será separado por vírgula.

-- Comando LISTAGG

	select LISTAGG(codtrb, '#') WITHIN GROUP (ORDER BY codtrb desc)  from ttrbprd
	where codcoligada = 2
	and idprd = 8;

	Resultado: IRRFPJ#INSSPJ#CSRF

	** Possibilidade de trocar o carácter separador. No exemplo, coloquei o "#".

-- Comando XMLELEMENT

	select rtrim(xmlagg(xmlelement(e,codtrb,';').extract('//text()')),';') 
	from ttrbprd
	where codcoligada = 2
	and idprd = 8

	Resultado: CSRF;INSSPJ;IRRFPJ
