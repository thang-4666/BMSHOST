SET DEFINE OFF;
WHERE H.ACCTNO LIKE ''086%''
   OR
   (  EXISTS (SELECT   1
            FROM   CFMAST
            WHERE   CUSTODYCD =H.ACCTNO)
    AND EXISTS (SELECT 1 FROM OOD WHERE CUSTODYCD=H.ACCTNO))', 'ODMAST', '', '', '', NULL, -1, 'N', 30, '', 'Y', 'T', '', 'N', '', '');