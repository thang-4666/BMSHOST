SET DEFINE OFF;
UNION ALL
SELECT ''8855T0'' tltxcd,''Thu phí mua T0'' txdesc ,1 LSTODR  FROM DUAL
UNION ALL
SELECT ''8855T2'' tltxcd,''Thu phí mua T2'' txdesc ,1 LSTODR  FROM DUAL
UNION ALL
 SELECT ''ALL''  TLTXCD, ''ALL'' TXDESC, -1 LSTODR FROM DUAL ) ORDER BY  LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
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