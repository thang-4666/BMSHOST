SET DEFINE OFF;
EN_DISPLAY,description DESCRIPTION
FROM (SELECT tlid,tlname, to_char(description)description
FROM tlprofiles
UNION
SELECT''ALL'' tlid, ''ALL'' tlname,  ''ALL'' description FROM
DUAL)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');