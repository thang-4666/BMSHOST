SET DEFINE OFF;
GRPNAME DESCRIPTION FROM (SELECT GRPID, GRPNAME,1 LSTODR FROM TLGROUPS WHERE GRPTYPE =''2'' UNION SELECT
''ALL'' TLID, ''ALL'' TLFULLNAME, -1 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''01'' VALUECD, ''01'' VALUE, ''Chưa tất toán hết'' DISPLAY FROM DUAL
', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');