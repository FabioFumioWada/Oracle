select l.SESSION_ID,
o.owner,
o.object_type,
o.object_name,
l.oracle_username,
l.os_user_name
FROM gv$locked_object l,
dba_objects o
WHERE l.object_id = o.object_id
ORDER by l.SESSION_ID,o.object_name;


select * from gv$locked_object l,

select distinct sid from v$mystat


select sid,
   serial#,
   status,
   username,
   osuser,
   program,
   blocking_session blocking,
   event
    from v$session
   where blocking_session is not null


select waiting_session,holding_session from dba_waiters;

select * from v$lock

Leia mais: http://eduardolegatti.blogspot.com/2015/05/detectando-sessoes-bloqueadoras-e.html#ixzz4V03Nl7Uh
Under Creative Commons License: Attribution Non-Commercial

alter system disconnect session 2119 immediate

select *
Jiraya196969
l

rollback
