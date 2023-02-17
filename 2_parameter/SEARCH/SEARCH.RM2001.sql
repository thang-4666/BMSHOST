SET DEFINE OFF;
SELECT CRB.autoid, CRB.txdate, CRB.transactionnumber, A1.CDCONTENT status, CRB.trnref,  CRB.trn_dt, CRB.desbankaccount, CRB.accname,
    CRB.accnum, CRB.bankcode,   CRB.branch, CRB.location, CRB.amount, CRB.keyacct1, CRB.keyacct2,  CRB.transactiondescription,
    CRB.isconfirmed, CRB.ismanual, CRB.usercreated, CRB.createdt, CRB.errordesc,CRB.KEYACCT1 CUSTODYCD
FROM crbbankrequest CRB, ALLCODE A1
where CRB.STATUS =A1.CDVAL AND A1.CDTYPE = ''RM'' AND A1.CDNAME = ''CRBRQDSTS''', 'CRBBANKREQUEST', '', '', '6656', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');