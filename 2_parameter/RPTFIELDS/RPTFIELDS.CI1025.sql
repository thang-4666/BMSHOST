SET DEFINE OFF;
    SELECT TLTXCD,TXDESC, 1 LSTODR FROM TLTX WHERE TLTXCD IN(''1115'',''1121'',''1131'',''1132'',''1133'',''1134'',''1135'',''1136'')
    UNION
    SELECT ''ALL'' TLTXCD,''ALL'' TXDESC, -1 LSTODR FROM DUAL ORDER BY LSTODR)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');