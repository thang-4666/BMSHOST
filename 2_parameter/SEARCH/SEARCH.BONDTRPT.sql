SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('BONDTRPT','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('BONDTRPT', 'Danh sách lệnh trái phiếu', 'Danh sách lệnh trái phiếu', 'SELECT CF.CUSTODYCD, CF.FULLNAME, OD.AFACCTNO, SB.SYMBOL, A1.CDCONTENT EXECTYPE,
    OD.ORDERQTTY, OD.EXECQTTY, OD.EXECAMT, OD.QUOTEPRICE, OD.TAXSELLAMT, BO.PARTNER, BO.BUSDATE, OD.FEEACR,
    OD.TXDATE, BO.BILLPIRCE, BO.YIELDS, BO.COUPON, A2.CDCONTENT ORSTATUS, ((OD.QUOTEPRICE*OD.ORDERQTTY)+OD.TAXSELLAMT+OD.FEEACR) TOTALAMT
FROM BONDTRANSACTPT BO, VW_ODMAST_ALL OD, AFMAST AF, CFMAST CF, SBSECURITIES SB, ALLCODE A2, ALLCODE A1
WHERE BO.ORDERID = OD.ORDERID AND OD.AFACCTNO = AF.ACCTNO
    AND AF.CUSTID = CF.CUSTID AND OD.DELTD <> ''Y''
    AND OD.CODEID = SB.CODEID AND A2.CDNAME = ''ORSTATUS''
    AND A2.CDTYPE = ''OD'' AND A2.CDVAL = OD.ORSTATUS
    AND A1.CDTYPE = ''OD'' AND A1.CDNAME = ''EXECTYPE''
    AND SUBSTR(CF.CUSTODYCD,4,1) <> ''P''
    AND A1.CDVAL = OD.EXECTYPE ', 'BONDDEAL', 'frmBONDDEAL', 'TXDATE DESC', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', 'CUSTODYCD');COMMIT;