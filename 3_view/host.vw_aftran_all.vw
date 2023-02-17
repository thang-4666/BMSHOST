SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_AFTRAN_ALL
(TXNUM, TXDATE, ACCTNO, TXCD, NAMT, 
 CAMT, REF, DELTD, AUTOID, ACCTREF, 
 TLTXCD, BKDATE)
BEQUEATH DEFINER
AS 
select "TXNUM","TXDATE","ACCTNO","TXCD","NAMT","CAMT","REF","DELTD","AUTOID","ACCTREF","TLTXCD","BKDATE" from aftran where deltd <> 'Y'
union all
select "TXNUM","TXDATE","ACCTNO","TXCD","NAMT","CAMT","REF","DELTD","AUTOID","ACCTREF","TLTXCD","BKDATE" from aftrana where deltd <> 'Y'
/