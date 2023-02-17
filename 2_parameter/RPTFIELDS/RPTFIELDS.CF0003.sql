SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''Có'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''Không'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''Đã xác nhận (GD0018)'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''Chưa xác nhận (GD0017)'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''Online'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''Back'' cdcontent ,2 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (
 SELECT ''ALL'' VALUE, ''ALL'' display, -1 lstodr FROM DUAL
UNION ALL  SELECT ''CFMAST'' VALUE, ''Thông tin khách hàng'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''CFAUTH'' VALUE, ''Ủy quyền'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''OTRIGHT'' VALUE, ''Thông tin ĐK dịch vụ trực tuyến'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''CFRELATION'' VALUE, ''Thành viên'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''CFCONTACT'' VALUE, ''Liên hệ'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''AFMAST'' VALUE, ''Tiểu khoản'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''AFTEMPLATES'' VALUE, ''ĐK nhận SMS/EMAIL'' display,1 lstodr FROM DUAL
UNION ALL  SELECT ''CFOTHERACC'' VALUE, ''Chuyển tiền trực tuyến'' display, 1 lstodr FROM DUAL
UNION ALL  SELECT ''ISSUER_MEMBER'' VALUE, ''Tổ chức phát hành'' display, 1 lstodr FROM DUAL
)
ORDER BY lstodr, VALUE', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
FROM ((SELECT FLDNAME, (CASE WHEN FLDNAME =''MOBILE'' THEN ''Số Mobile 2''
WHEN FLDNAME =''MOBILESMS'' THEN ''Số Mobile 1''  ELSE CAPTION END) CAPTION, 1 lstodr
FROM FLDMASTER WHERE OBJNAME = ''CF.CFMAST'' AND VISIBLE=''Y'' AND FLDNAME NOT IN (''CAREBY'',''ACTYPE'',''ISUSEOADVRES'')
UNION ALL SELECT ''ALL'' FLDNAME, ''ALL'' CAPTION, -1 lstodr FROM DUAL
UNION ALL SELECT FLDNAME, (CASE WHEN FLDNAME =''BANKACC'' THEN ''Số TK ngân hàng chuyển tiền trực tuyến'' ELSE CAPTION END) CAPTION, 1 lstodr
FROM FLDMASTER WHERE OBJNAME IN (''CF.CFAUTH'',''CF.OTRIGHT'',''CF.CFRELATION'',''CF.CFCONTACT'',''CF.AFMAST'',
''SA.AFTEMPLATES'',''SA.CFOTHERACC'',''SA.ISSUER_MEMBER'') AND VISIBLE=''Y''
) )
ORDER BY lstodr, FLDNAME', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''Online mở mới'' cdcontent ,2 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''Back'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''Z'' CDVAL ,''Back mở mới'' cdcontent ,3 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''I'' VALUECD, ''I'' VALUE, ''Cá nhân'' DISPLAY FROM DUAL
UNION ALL
SELECT ''B'' VALUECD, ''B'' VALUE, ''Tổ chức'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');