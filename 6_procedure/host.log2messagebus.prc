SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "LOG2MESSAGEBUS" (V_TLTXCD VARCHAR2, V_TXDATE VARCHAR2, V_TXNUM VARCHAR2, V_REFTYPE VARCHAR2, V_TBLNAME VARCHAR2, V_QUEUENAME VARCHAR2,V_REFKEY VARCHAR2, V_MSGBODY VARCHAR2) IS
    BEGIN
       INSERT INTO BUSTXLOG (AUTOID, TLTXCD, REFTYPE, TBLNAME, QUEUENAME, TXDATE, TXNUM,REFKEY, MSGBODY)
       VALUES (SEQ_BUSTXLOG.NEXTVAL, V_TLTXCD, V_REFTYPE, V_TBLNAME, V_QUEUENAME, to_date( V_TXDATE,'DD/MM/YYYY' ), V_TXNUM, v_REFKEY,V_MSGBODY);
    END ;

 
 
 
 
/
