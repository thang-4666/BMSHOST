SET DEFINE OFF;
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''001'' CDVAL, ''Phí margin'' CDCONTENT, 0 LSTODR FROM DUAL
        UNION SELECT ''002'' CDVAL, ''Phí ứng trước'' CDCONTENT, 1 LSTODR FROM DUAL
		UNION SELECT ''003'' CDVAL, ''Hạn mức margin'' CDCONTENT, 2 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL, cdcontent,LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE'' AND CDVAL IN (''NM'',''QM'',''NN'')
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');