SET DEFINE OFF;
FROM (SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT FROM DUAL
       UNION SELECT BANKACCTNO CDVAL, FULLNAME CDCONTENT  FROM BANKNOSTRO) ORDER BY CDVAL DESC ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');