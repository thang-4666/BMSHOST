SET DEFINE OFF;
DISPLAY, CDVAL||''-''||EN_CDCONTENT EN_DISPLAY, '''' 
DESCRIPTION
FROM ALLCODE WHERE CDNAME = ''RPTID'' AND CDTYPE=''ST'' AND 
CDUSER=''Y'' AND CDVAL IN (''DE013'',''DE065'')
ORDER BY LSTODR', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'RPTID', '##########', '', '', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_RPTID', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDNAME = ''TRADEPLACE'' AND CDTYPE=''ST'' AND CDUSER=''Y''
ORDER BY LSTODR', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'BRID', '##########', '', '', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_BRID', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDNAME = ''CONFIRM_STATUS'' AND CDTYPE=''ST'' AND CDUSER=''Y''
ORDER BY LSTODR', '', 'CONF', 'Y', 'Y', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CONFIRMSTATUS', '##########', '', '', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CONFIRMSTATUS', 'Y', '', 'N', '', '', '', 'N');