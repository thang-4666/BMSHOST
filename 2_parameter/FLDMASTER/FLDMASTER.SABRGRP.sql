SET DEFINE OFF;
WHERE AFT.MRTYPE = MRT.ACTYPE
    AND AFT.ACTYPE = CAF.AFTYPE
    AND CAF.CFTYPE = (SELECT VARVALUE FROM SYSVAR WHERE VARNAME=''EKYC_CFTYPE'')
    AND MRT.MRTYPE = ''N''', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');