SELECT  XMLELEMENT("GCOLIGADA",
            XMLAGG(
                XMLELEMENT("NOMEFANTASIA", NOMEFANTASIA)
            )
        )
FROM RM.GCOLIGADA
ORDER BY CODCOLIGADA




-- Comando XMLELEMENT

	select rtrim(xmlagg(xmlelement(e,codtrb,';').extract('//text()')),';') 
	from ttrbprd
	where codcoligada = 2
and idprd = 8

