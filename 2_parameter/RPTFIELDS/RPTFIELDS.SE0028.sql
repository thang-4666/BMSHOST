SET DEFINE OFF;
FROM (SELECT to_char(SYMBOL)SYMBOL , to_char(IR.fullname) fullname ,1 LSTODR 
FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid
union all 
SELECT ''ALL'' CDVAL ,''ALL'' CDCONTENT, 0 LSTODR FROM dual    
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
UNION
SELECT ''HCM'' VALUE, ''HCM'' VALUECD, ''Tp Hồ Chí Minh'' DISPLAY, ''Tp Hồ Chí Minh'' EN_DISPLAY, ''Tp Hồ Chí Minh'' DESCRIPTION FROM DUAL ', '', 'HN', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
SELECT ''001'' VALUECD, ''001'' VALUE, ''Trung tâm Lưu ký Chứng khoán Việt Nam'' DISPLAY FROM DUAL
UNION ALL
SELECT ''002'' VALUECD, ''002'' VALUE, ''Chi nhánh Trung tâm Lưu ký Chứng khoán Việt Nam'' DISPLAY FROM DUAL
', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');