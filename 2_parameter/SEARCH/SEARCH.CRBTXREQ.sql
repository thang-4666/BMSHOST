SET DEFINE OFF;
cr.bankcode,crb.bankname,refcode
txnum,txdate,objname,afacctno,bankacct
,trfcode,txamt So_tien ,notes,
( Case when cr.status =''P'' then ''Chờ gửi''
       when cr.status =''C'' then ''Thành công''
       when cr.status =''E'' then ''Có lỗi'' else
cr.status end ) status
   ,errorcode ,
de.errdesc ErrDesc,cf.custodycd,cf.fullname
from
vw_CRBTXREQ_all cr, deferror de , crbdefbank crb, cfmast cf, afmast af
Where cr.errorcode=de.errnum(+)
and (trfcode=''HOLD'' or trfcode=''UNHOLD'')
and cr.bankcode = crb.bankcode
and cr.afacctno=af.acctno
and af.custid=cf.custid', 'CRBTXREQ', '', '', '', NULL, 50, 'N', 0, 'NNNNYYNNNNNY', 'Y', 'T', '', 'N', '', '');