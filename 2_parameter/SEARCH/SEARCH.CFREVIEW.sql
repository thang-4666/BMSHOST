SET DEFINE OFF;
status, c.description ,
(CASE WHEN STATUS IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW
from cfreview c, ALLCODE A0
where c.status=a0.cdval
 and A0.CDTYPE = ''SY'' AND A0.CDNAME = ''APPRV_STS''', 'CFREVIEW', 'frmTDTYPE', 'autoid', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');