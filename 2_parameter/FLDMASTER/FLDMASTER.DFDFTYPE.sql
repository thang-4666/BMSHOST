SET DEFINE OFF;
FROM ALLCODE
WHERE CDTYPE = ''SY'' AND CDNAME = ''YESNO''
and case when ''<$TAGFIELD>'' = ''Y'' and cdval = ''N'' then 1
        when ''<$TAGFIELD>'' <> ''Y'' then 1 else 0 end = 1
ORDER BY LSTODR', 'N', 'ISVSD', 'Y', '', 'Y', '[N]', '', '', 'N');
FROM ALLCODE
WHERE CDTYPE = ''SY'' AND CDNAME = ''YESNO''
and case when ''<$TAGFIELD>'' = ''Y'' and cdval = ''N'' then 1
        when ''<$TAGFIELD>'' <> ''Y'' then 1 else 0 end = 1
ORDER BY LSTODR', 'N', 'ISVSD', 'Y', '', 'Y', '[Y]', '', '', 'N');