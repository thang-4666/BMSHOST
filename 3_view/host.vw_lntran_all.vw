SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_LNTRAN_ALL
(AUTOID, TXNUM, TXDATE, ACCTNO, TXCD, 
 NAMT, CAMT, REF, DELTD, ACCTREF, 
 TLTXCD, BKDATE)
BEQUEATH DEFINER
AS 
select "AUTOID","TXNUM","TXDATE","ACCTNO","TXCD","NAMT","CAMT","REF","DELTD","ACCTREF","TLTXCD","BKDATE" from lntran where deltd <> 'Y'
        union all
        select "AUTOID","TXNUM","TXDATE","ACCTNO","TXCD","NAMT","CAMT","REF","DELTD","ACCTREF","TLTXCD","BKDATE" from lntrana  where deltd <> 'Y'
/
