SET DEFINE OFF;
         to_char(F.LASTDATE, ''DD/MM/RRRR hh24:mi:ss'') LASTDATE
FROM CRBFILEEXPORT F, CRBDEFBANK B, ALLCODE A1
WHERE F.BANKCODE = B.BANKCODE
      AND A1.CDNAME=''F_EXPORTSTATUS'' AND A1.CDTYPE =''SA'' AND A1.CDVAL = F.STATUS', 'CRBFILEEXPORT', '', '', '', NULL, 50, 'N', 0, 'NYYNYYNNNNN', 'Y', 'T', '', 'N', '', '');