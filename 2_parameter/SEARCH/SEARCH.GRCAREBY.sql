SET DEFINE OFF;
GRPNAME EN_DISPLAY,GRPNAME DESCRIPTION
FROM (Select TLG.GRPID, TLG.GRPNAME,1 LSTODR from
TLGROUPS TLG, tlgrpusers TL
  where  TLG.grptype = 2 and TLG.active=''Y''  and tl.grpid
= TLG.grpid  and TL.TLID = ''<$TELLERID>'' UNION ALL SELECT ''ALL''
TLID, ''ALL'' TLFULLNAME, -1 LSTODR FROM DUAL
) where 0 = 0', 'AFMAST', '', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');