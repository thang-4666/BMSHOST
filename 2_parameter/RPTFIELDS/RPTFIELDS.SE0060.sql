SET DEFINE OFF;
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''01'' VALUECD, ''01'' VALUE, ''Còn Nợ'' DISPLAY FROM DUAL
UNION ALL
SELECT ''02'' VALUECD, ''02'' VALUE, ''Hết nợ'' DISPLAY FROM DUAL
UNION ALL
SELECT ''03'' VALUECD, ''03'' VALUE, ''Phí đã thu'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''Y'' VALUE, ''Y'' VALUECD, ''Corebank'' DISPLAY,
''Corebank'' EN_DISPLAY, ''Corebank'' DESCRIPTION
FROM Dual
union
SELECT ''N'' VALUE, ''N'' VALUECD, ''VCBS'' DISPLAY, ''VCBS''
EN_DISPLAY, ''VCBS'' DESCRIPTION
FROM Dual
union
SELECT ''ALL'' VALUE, ''ALL'' VALUECD, ''ALL'' DISPLAY, ''ALL''
EN_DISPLAY, ''ALL'' DESCRIPTION
FROM Dual', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''B'' VALUECD, ''B'' VALUE, ''Tổ chức'' DISPLAY FROM DUAL
UNION ALL
SELECT ''I'' VALUECD, ''I'' VALUE, ''Cá nhân'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');