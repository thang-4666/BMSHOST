SET DEFINE OFF;
from login_info_bo a ,  allcode a2
where a2.CDNAME = ''STATUS''  and a2.cdtype = ''SA'' and a2.cdval in(''A'',''C'')
and a.status = a2.cdval and a.status = ''A''', 'LOGIN_INFO_BO', 'frmLOGIN_INFO_BO', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');