SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "INSERT_CFAUTH_SIGN" (V_AUTOID varchar2,V_SIGNATURE VARCHAR2) IS
    LONGLITERAL VARCHAR2(32767);

    BEGIN
       LONGLITERAL:=V_SIGNATURE;
       Update CFAUTH SET SIGNATURE=LONGLITERAL WHERE AUTOID=V_AUTOID;
    END ;

 
 
 
 
/