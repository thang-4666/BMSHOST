SET DEFINE OFF;
FROM ALLCODE WHERE CDTYPE = ''SY'' AND CDNAME = ''YESNO'' and cdval = decode(''<$TAGFIELD>'',''C'',cdval,''N'') ORDER BY LSTODR', 'N', 'LOANTYPE', 'Y', '', 'Y', '[CL]', '', '', 'N');
FROM ALLCODE WHERE CDTYPE = ''SY'' AND CDNAME = ''YESNO'' and cdval = ''N'' ORDER BY LSTODR', 'N', 'LOANTYPE', 'Y', '', 'Y', '[DF]', '', '', 'N');
FROM ALLCODE
WHERE CDTYPE = ''LN'' AND CDNAME = ''RRTYPE'' AND CDVAL <> ''O''
and case when ''<$TAGFIELD>'' = ''T0'' and cdval = ''C'' then 1
        when ''<$TAGFIELD>'' <> ''T0'' then 1 else 0 end = 1
ORDER BY LSTODR', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDTYPE = ''SY'' AND CDNAME = ''YESNO''  AND cdval = ''N''  ORDER BY LSTODR', 'N', 'LOANTYPE', 'Y', '', 'Y', '[T0]', '', '', 'N');