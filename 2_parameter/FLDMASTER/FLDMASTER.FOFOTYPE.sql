SET DEFINE OFF;
(
SELECT  CDVAL VALUECD, CDVAL VALUE, TO_CHAR(CDCONTENT) DISPLAY, TO_CHAR(CDCONTENT) EN_DISPLAY, LSTODR
FROM ALLCODE WHERE CDTYPE = ''FO'' AND CDNAME = ''EXECTYPE''
)
ORDER BY LSTODR
', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
(
SELECT  CDVAL VALUECD, CDVAL VALUE, TO_CHAR(CDCONTENT) DISPLAY, TO_CHAR(CDCONTENT) EN_DISPLAY,LSTODR
FROM ALLCODE WHERE CDTYPE = ''FO'' AND CDNAME = ''PRICETYPE''
)
ORDER BY LSTODR
', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
(SELECT  CDVAL VALUECD, CDVAL VALUE, TO_CHAR(CDCONTENT) DISPLAY, TO_CHAR(CDCONTENT) EN_DISPLAY,LSTODR
FROM ALLCODE WHERE CDTYPE = ''FO'' AND CDNAME = ''TIMETYPE''
)
ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');