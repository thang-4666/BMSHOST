SET DEFINE OFF;
FROM  (  SELECT TL.TLID actype, TL.TLFULLNAME TYPENAME, TL.TLID lstodr  FROM TLPROFILES TL UNION   SELECT ''ALL'' actype,  ''ALL'' TYPENAME, ''0'' lstodr  FROM DUAL ) ORDER BY lstodr
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');