SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''A'' CDVAL ,''Gán môi giới'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''B'' CDVAL ,''Chuyển môi giới'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''C'' CDVAL ,''Rút môi giới'' cdcontent ,0 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');