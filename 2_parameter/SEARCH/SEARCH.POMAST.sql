SET DEFINE OFF;
select TXDATE,TXNUM,AMT,BRID,DELTD,cd.cdcontent STATUS,BANKID,BANKNAME,BANKACC,
BANKACCNAME,GLACCTNO,FEETYPE,POTYPE,BENEFACCT,BENEFNAME,BENEFCUSTNAME,DESCRIPTION
from pomast po, allcode cd
where cd.cdname =''POSTATUS'' and cd.cdtype =''SA''
and cd.cdval= po.status
', 'POMAST', '', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');