SET DEFINE OFF;
SELECT tim.autoid, prt.actype, tim.typeid, vw.typename FROM TYPEIDMAP tim, prtype prt, vw_type vw where tim.prtype = prt.actype AND prt.TYPE = vw.type  AND vw.actype = tim.typeid  AND tim.prtype = ''<$KEYVAL>''
', 'PR.TYPEIDMAP', 'typeid', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');