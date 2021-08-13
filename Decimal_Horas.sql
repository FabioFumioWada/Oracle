DECIMAL/HORAS
select  690/60,
        trunc((690/60),0),
        ((690/60)-(trunc((690/60),0)))*60
from dual


SELECT  HORA, 
        TO_NUMBER(SUBSTR(HORA,1,INSTR(HORA,':')-1)) HORA,
        TO_NUMBER(SUBSTR(HORA,(INSTR(HORA,':')+1),2)) MINUTO,
        (TO_NUMBER(SUBSTR(HORA,1,INSTR(HORA,':')-1)) +
         TO_NUMBER(SUBSTR(HORA,(INSTR(HORA,':')+1),2))) AS VLRDECIMAL
FROM ZPFFINANC_IMP