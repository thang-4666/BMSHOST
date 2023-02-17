SET DEFINE OFF;
    G.CDCONTENT TRADEPLACE, F.CDCONTENT VIA, A.TXDATE, A.TXNUM, J.FULLNAME, J.CUSTODYCD, K.FULLNAME SENAME, A.OODSTATUS, H.CDCONTENT PRICETYPE
FROM OOD A, SBSECURITIES B, ODMAST C, ODTYPE D, AFMAST I, CFMAST J, ISSUERS K, ALLCODE E, ALLCODE F, ALLCODE G, ALLCODE H, SECURITIES_INFO L
WHERE A.CODEID = B.CODEID AND A.ORGORDERID = C.ORDERID AND C.ACTYPE = D.ACTYPE
    AND A.CODEID = L.CODEID
    AND C.AFACCTNO = I.ACCTNO AND I.CUSTID = J.CUSTID
    AND B.ISSUERID = K.ISSUERID
    AND (C.EXECTYPE = E.CDVAL AND E.CDNAME = ''EXECTYPE'' AND E.CDTYPE = ''OD'')
    AND (C.VIA = F.CDVAL AND F.CDNAME = ''VIA'' AND F.CDTYPE = ''OD'')
    AND (B.TRADEPLACE = G.CDVAL AND G.CDNAME = ''TRADEPLACE'' AND G.CDTYPE = ''OD'')
    AND (C.PRICETYPE = H.CDVAL AND H.CDNAME = ''PRICETYPE'' AND H.CDTYPE = ''OD'')
AND OODSTATUS IN (''N'',''B'') ', 'OOD', 'frmOOD', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');