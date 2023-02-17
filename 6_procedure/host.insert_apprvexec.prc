SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE insert_apprvexec (V_PARENTOBJNAME varchar2,V_PARENTCLAUSE VARCHAR2,V_CHILDOBJNAME Varchar2,V_CHILDCLAUSE Varchar2
    ,v_ACTIONFLAG VARCHAR2 ,v_SQLCOMMAND VARCHAR2 ,v_SQLCOMMANDTYPE VARCHAR2 ,v_STATUS VARCHAR2 ,v_TXDATE VARCHAR2 ) IS

    BEGIN
        INSERT INTO APPRVEXEC (AUTOID,TABLE_NAME,RECORD_KEY,CHILD_TABLE_NAME,CHILD_RECORD_KEY,ACTION_FLAG,SQLCMD,SQLCMDTYPE,STATUS,MAKE_DT,MAKETIME) VALUES
         (seq_apprvexec.nextval,V_PARENTOBJNAME, V_PARENTCLAUSE, V_CHILDOBJNAME, V_CHILDCLAUSE, v_ACTIONFLAG,
            'BEGIN DELETE FROM '|| V_CHILDOBJNAME || ' WHERE ' || V_CHILDCLAUSE || ';INSERT INTO '|| V_CHILDOBJNAME || ' SELECT * FROM '|| V_CHILDOBJNAME ||'MEMO WHERE ' || V_CHILDCLAUSE || '; DELETE FROM '|| V_CHILDOBJNAME ||'MEMO WHERE ' || V_CHILDCLAUSE || '; END;',
            v_SQLCOMMANDTYPE,
            v_STATUS, TO_DATE(v_TXDATE,'DD/MM/RRRR'), SYSTIMESTAMP);
    END ;
 
 
 
 
/