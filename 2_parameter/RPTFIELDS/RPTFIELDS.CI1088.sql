SET DEFINE OFF;
UNION ALL
SELECT ''ALL'' tltxcd,''ALL'' txdesc ,-1 LSTODR  FROM DUAL
ORDER BY tltxcd ) ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
CDCONTENT EN_DESCRIPTION
FROM (SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
      UNION
      SELECT ''YES'' CDVAL, ''YES''CDCONTENT, 0 LSTODR FROM DUAL
      UNION
      SELECT ''NO'' CDVAL, ''NO'' CDCONTENT, 1 LSTODR FROM DUAL)
ORDER BY LSTODR
', '', 'ALL', 'N', 'N', 'N', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
CDCONTENT EN_DESCRIPTION
FROM (SELECT ''N'' CDVAL, ''N'' CDCONTENT, 0 LSTODR FROM DUAL
      UNION
      SELECT ''Y'' CDVAL, ''Y'' CDCONTENT, 1 LSTODR FROM DUAL)
ORDER BY LSTODR', '', 'N', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');