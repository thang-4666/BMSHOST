SET DEFINE OFF;
 FROM (SELECT SYMBOL,IR.fullname ,1 LSTODR FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid)ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
 FROM (SELECT CDVAL, CDCONTENT, LSTODR FROM ALLCODE WHERE CDTYPE = ''SA'' AND CDNAME = ''TRADEPLACE'' AND CDVAL <> ''000'' ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');