SET DEFINE OFF;
 FROM (SELECT SYMBOL,IR.fullname ,1 LSTODR FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid UNION ALL
 SELECT ''ALL'' SYMBOL ,''ALL'' fullname ,-1 LSTODR FROM DUAL)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');