SET DEFINE OFF;
FROM (SELECT to_char(SYMBOL)SYMBOL , to_char(IR.fullname) fullname ,1 LSTODR
FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid
union all
SELECT ''ALL'' CDVAL ,''ALL'' CDCONTENT, 0 LSTODR FROM dual
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');