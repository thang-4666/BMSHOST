SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_SA_GENTXDESC_REFFIELD
(REFTYPE, REFKEY, RETVAL)
BEQUEATH DEFINER
AS 
SELECT 'CFCUSTID_FULLNAME' REFTYPE, CUSTID REFKEY, TO_CHAR(FULLNAME) RETVAL FROM CFMAST
UNION ALL SELECT 'CFCUSTID_SHORTNAME' REFTYPE, CUSTID REFKEY, TO_CHAR(SHORTNAME) RETVAL FROM CFMAST
UNION ALL SELECT 'CFCUSTODYCD_FULLNAME' REFTYPE, CUSTODYCD REFKEY, TO_CHAR(FULLNAME) RETVAL FROM CFMAST
UNION ALL SELECT 'CFCUSTODYCD_SHORTNAME' REFTYPE, CUSTODYCD REFKEY, TO_CHAR(SHORTNAME) RETVAL FROM CFMAST
UNION ALL SELECT 'SECODEID_SYMBOL' REFTYPE, CODEID REFKEY, TO_CHAR(SYMBOL) RETVAL FROM SBSECURITIES
UNION ALL SELECT 'AFACCTNO_FULLNAME' REFTYPE, AF.ACCTNO REFKEY, TO_CHAR(CF.FULLNAME) RETVAL FROM AFMAST AF, CFMAST CF WHERE AF.CUSTID=CF.CUSTID
UNION ALL SELECT 'AFACCTNO_CUSTODYCD' REFTYPE, AF.ACCTNO REFKEY, TO_CHAR(CF.CUSTODYCD) RETVAL FROM AFMAST AF, CFMAST CF WHERE AF.CUSTID=CF.CUSTID
/