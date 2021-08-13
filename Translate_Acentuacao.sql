SELECT NOME
FROM PPESSOA
WHERE upper
    (translate(nome,
    'ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü',
    'ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu')) =  'FABIO FUMIO WADA'
