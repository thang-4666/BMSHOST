SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_RM_GETTRANSFERRESULT
(REQID, OBJTYPE, OBJNAME, TRFCODE, REFCODE, 
 OBJKEY, TXDATE, BANKCODE, BANKACCT, AFACCTNO, 
 TXAMT, NOTES, STATUS, REFTXNUM, REFTXDATE, 
 REFVAL, AFFECTDATE, ERRORCODE, CREATEDATE, GRPREQID, 
 VIA, DIRBANKCODE, DIRBANKNAME, DIRBANKCITY, DIRACCNAME, 
 TRNREF)
BEQUEATH DEFINER
AS 
select "REQID","OBJTYPE","OBJNAME","TRFCODE","REFCODE","OBJKEY","TXDATE","BANKCODE","BANKACCT","AFACCTNO","TXAMT","NOTES","STATUS","REFTXNUM","REFTXDATE","REFVAL","AFFECTDATE","ERRORCODE","CREATEDATE","GRPREQID","VIA","DIRBANKCODE","DIRBANKNAME","DIRBANKCITY","DIRACCNAME","TRNREF" from crbtxreq
where status in ('S','E') and via ='DIR' and trnref is not null and errorcode <>'-670051'
/
