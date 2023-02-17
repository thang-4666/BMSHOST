SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CAL_ODMAST_EXCFEEAMT"
IS
BEGIN
    --X?C ?NH PH?TR? CHO SGDCK
    UPDATE ODMAST T1
    SET EXCFEEAMT = (
      SELECT DECODE(T2.FORP,'P',FEEAMT/100,FEEAMT)*T1.EXECAMT/(T2.LOTDAY*T2.LOTVAL)
      FROM VW_ODMAST_EXC_FEETERM T2
      WHERE T1.ORDERID = T2.ORDERID);
    --ID THAM CHI?U
    UPDATE ODMAST T1
    SET EXCFEEREFID = (
      SELECT T2.AUTOID
      FROM VW_ODMAST_EXC_FEETERM T2
      WHERE T1.ORDERID = T2.ORDERID);
    COMMIT;
EXCEPTION
   WHEN OTHERS THEN
        BEGIN
            raise;
            return;
        END;
END;

 
 
 
 
/