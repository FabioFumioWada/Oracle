CREATE OR REPLACE FUNCTION UJP.fn_long_to_clob
(p_owner  VARCHAR2,
p_tabela VARCHAR2,
p_coluna VARCHAR2,
p_rowid  UROWID)
RETURN VARCHAR2 IS
 
v_cursor  INTEGER;         --cursor
v_length  INTEGER;         --tamanho do long
v_tamanho INTEGER;         --tamanho do que foi retornado
v_sql     VARCHAR(2000);   --stetament
v_max     VARCHAR2(32760); --variavel varchar2 com tamanho maximo do long
v_clob    CLOB;            --variavel do tipo clob
v_long    LONG;            --variavel do tipo long
v_syscur SYS_REFCURSOR;
 
BEGIN
v_cursor := dbms_sql.open_cursor;
 
v_sql := 'SELECT '||p_coluna||'
FROM   '||p_owner||'.'||p_tabela||'
WHERE  ROWID = :row_id';
 
OPEN v_syscur FOR v_sql USING p_rowid;
FETCH v_syscur INTO v_long;
v_length := LENGTH(v_long);
CLOSE v_syscur;
 
dbms_sql.parse(v_cursor,v_sql,dbms_sql.NATIVE);
dbms_sql.bind_variable(v_cursor,'row_id',p_rowid);
dbms_sql.define_column_long(v_cursor,1);
 
IF(dbms_sql.execute_and_fetch(v_cursor) = 1) THEN
dbms_sql.column_value_long(v_cursor,
1,
v_length,
0,
v_max,
v_tamanho
);
END IF;
 
dbms_lob.createtemporary(v_clob,FALSE,dbms_lob.CALL);
v_clob := v_max;
 
RETURN v_clob; --OU ENTAO V_MAX
 
END;
