SET DEFINE OFF;
SELECT EVENTCODE VALUECD, EVENTCODE VALUE, EVENTNAME DISPLAY, EVENTNAME EN_DISPLAY, EVENTNAME DESCRIPTION
FROM APPEVENTS
WHERE MODCODE = ''CI'' AND EVENTCODE= ''CRINTACR''
ORDER BY LSTODR
', '', 'CRINTACR', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', 'T', 'Y', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
SELECT CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY FROM ALLCODE WHERE CDTYPE = ''SA'' AND CDNAME = ''PERIOD''  ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');