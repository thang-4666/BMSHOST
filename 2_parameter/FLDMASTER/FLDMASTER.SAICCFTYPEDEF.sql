SET DEFINE OFF;
SELECT EVENTCODE VALUECD, EVENTCODE VALUE, EVENTNAME DISPLAY, EVENTNAME EN_DISPLAY, EVENTNAME DESCRIPTION
FROM APPEVENTS
WHERE MODCODE = ''<$PARENTMOD>'' AND
INSTR(( CASE WHEN ''<$PARENTMOD>''=''OD''  then ''ODTYPEFEE''
    WHEN ''<$PARENTMOD>''=''CI''  then ''CRINTACR|CRINTPRN''
    else EVENTCODE END),EVENTCODE) >0
ORDER BY LSTODR
', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', 'T', 'Y', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
SELECT CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY FROM ALLCODE WHERE CDTYPE = ''SA'' AND CDNAME = ''PERIOD''  ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDTYPE = ''SA'' AND CDNAME = ''RULETYPE'' 
AND CDVAL IN (''F'',''C'',''T'') ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');