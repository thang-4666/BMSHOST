SET DEFINE OFF;
FROM ALLCODE WHERE CDTYPE=''SY'' AND CDNAME=''TRFCODE'' AND CDUSER=''Y'' ORDER BY LSTODR', '', '', 'Y', 'Y', 'Y', '', '', 'Y', 'C', '', '', '', '', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDTYPE=''RM'' AND CDNAME=''TRFLOGSTS'' AND CDVAL IN (''F'',''D'',''B'',''P'',''H'') ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDTYPE=''RM'' AND CDNAME=''TRFLOGSTS'' ORDER BY LSTODR', '', '', 'Y', 'Y', 'Y', '', '', 'Y', 'C', '', '', '', '', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');