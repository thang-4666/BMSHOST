SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_DFTRAN_ALL
(TXNUM, TXDATE, ACCTNO, TXCD, NAMT, 
 CAMT, REF, DELTD, AUTOID, ACCTREF, 
 TLTXCD, BKDATE)
BEQUEATH DEFINER
AS 
(
select "TXNUM","TXDATE","ACCTNO","TXCD","NAMT","CAMT","REF","DELTD","AUTOID","ACCTREF","TLTXCD","BKDATE" from dftran where nvl(deltd,'N') <> 'Y'
union all 
select "TXNUM","TXDATE","ACCTNO","TXCD","NAMT","CAMT","REF","DELTD","AUTOID","ACCTREF","TLTXCD","BKDATE" from dftrana where nvl(deltd,'N') <> 'Y'
)
/