SET DEFINE OFF;
,''1104'',''1108'',''1111'',''1114'',''1104'',''1112'',''1145'',''1144'',''1153''
,''1123'',''1124'',''1126'',''1127'',''1162'',''1180'',''1182'',''5540'',''5566'',''5567'',''6613'',''2665'',''2665'',''1105'',''1198'',''1199'',''1178'',
''2646'',''2648'',''2674'',''2636'',''1178'',''8865'',''8866'',''8855'',''8856'',''0066'',''8889'',''8894'',''8851'',''1120'',''1130'',''1134'',''5541'',''3342'',''3384'',''3386''
,''0088'',''1110'',''1018'',''1137'',''1138'',''1191'',''1192'',''1146'')
UNION ALL
SELECT ''8855T0'' tltxcd,''Thu phí mua T0'' txdesc ,1 LSTODR  FROM DUAL
UNION ALL
SELECT ''8855T2'' tltxcd,''Thu phí mua T2'' txdesc ,1 LSTODR  FROM DUAL
UNION ALL
SELECT ''ALL'' tltxcd,''ALL'' txdesc ,-1 LSTODR  FROM DUAL
ORDER BY tltxcd ) ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
''Corebank'' EN_DISPLAY, ''Corebank'' DESCRIPTION
FROM Dual
union
SELECT ''N'' VALUE, ''N'' VALUECD, ''BSC'' DISPLAY, ''ECC''
EN_DISPLAY, ''ECC'' DESCRIPTION
FROM Dual
union
SELECT ''ALL'' VALUE, ''ALL'' VALUECD, ''ALL'' DISPLAY, ''ALL''
EN_DISPLAY, ''ALL'' DESCRIPTION
FROM Dual', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
union all
SELECT ''002'' VALUE, ''002'' VALUECD, ''Nơi làm mở tài khoản'' DISPLAY,  ''Nơi làm mở tài khoản'' EN_DISPLAY,  ''Nơi làm mở tài khoản'' DESCRIPTION FROM DUAL', '', '002', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
CDCONTENT EN_DESCRIPTION
FROM (SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
      UNION
      SELECT ''YES'' CDVAL, ''YES''CDCONTENT, 0 LSTODR FROM DUAL
      UNION
      SELECT ''NO'' CDVAL, ''NO'' CDCONTENT, 1 LSTODR FROM DUAL)
ORDER BY LSTODR
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');