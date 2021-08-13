-- Subtrair 2 minutos:

select to_char(sysdate-(2/24/60),'hh24:mi:ss') from dual

-- Subtrair 2 horas:

select to_char(sysdate-(2/24),'hh24:mi:ss') from dual 