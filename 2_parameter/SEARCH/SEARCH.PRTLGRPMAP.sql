SET DEFINE OFF;
SELECT prtlgrpmap.autoid, prtlgrpmap.prcode, prtlgrpmap.grpid, decode(prtlgrpmap.grpid,''ALL'',''Toàn hệ thống'',TL.grpname) grpname FROM prtlgrpmap, (SELECT * FROM TLGROUPS WHERE grptype = ''2'') TL WHERE prtlgrpmap.grpid = TL.grpid(+) AND prtlgrpmap.prcode = ''<$KEYVAL>''
', 'PR.PRTLGRPMAP', 'GRPID', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');