SET DEFINE OFF;
GRPNAME EN_DISPLAY,GRPNAME DESCRIPTION FROM (SELECT
GRPID, GRPNAME,1 LSTODR FROM TLGROUPS WHERE GRPTYPE =''2''
UNION SELECT''ALL'' TLID, ''ALL'' TLFULLNAME, -1 LSTODR FROM
DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
EN_DISPLAY,description DESCRIPTION
FROM (SELECT tlid,tlname, to_char(description)description
FROM tlprofiles
UNION
SELECT''ALL'' tlid, ''ALL'' tlname,  ''ALL'' description FROM
DUAL)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');