SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_AFADTYPE
(ACCTNO, ACTYPE, TYPENAME, TXDATE, CLEARDATE, 
 REMAINPOOL)
BEQUEATH DEFINER
AS 
SELECT AFACCTNO ACCTNO, ADTYPE ACTYPE, ADNAME TYPENAME, to_char(TXDATE,'DDMMYYYY') TXDATE, to_char(CLEARDATE,'DDMMYYYY')  CLEARDATE,
       0 REMAINPOOL
FROM v_dayadvanceschedule_all
/
