SET DEFINE OFF;
FROM (SELECT to_char(SYMBOL)SYMBOL , to_char(IR.fullname) fullname ,1 LSTODR
FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid
union all
SELECT ''ALL'' CDVAL ,''ALL'' CDCONTENT, 0 LSTODR FROM dual
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
UNION ALL
SELECT ''Chi nhánh Trung tâm Luu Ký Chứng Khoán Việt Nam'' VALUECD, ''Chi nhánh Trung tâm Luu Ký Chứng Khoán Việt Nam'' VALUE, ''Chi nhánh Trung tâm Luu Ký Chứng Khoán Việt Nam'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');