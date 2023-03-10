SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('AFUSERTRDLNK','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('AFUSERTRDLNK', 'Gắn tiểu khoản tự doanh cho môi giới', 'Broker/Remiser management', 'SELECT MST.AUTOID, CF.CUSTODYCD, CF.FULLNAME, AF.ACCTNO, TLP.TLNAME, A3.CDCONTENT EXECTYPE,
    A2.CDCONTENT TRADELOTCD, A1.CDCONTENT TRADEPLACE, MST.LASTDATE, A4.cdcontent STATUS, 
    (CASE WHEN NVL(MST.STATUS,''A'') IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW
FROM AFUSERTRDLNK MST, ALLCODE A1,
    ALLCODE A2, ALLCODE A3, AFMAST AF, CFMAST CF, TLPROFILES TLP, Allcode A4
WHERE MST.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID AND MST.TRADERID = TLP.TLID
    AND A1.CDTYPE = ''OD'' AND A1.CDNAME = ''TRADEPLACE'' AND MST.TRADEPLACE = A1.CDVAL
    AND A2.CDTYPE = ''SA'' AND A2.CDNAME = ''TRADELOTCD'' AND MST.TRADELOTCD = A2.CDVAL
    AND A3.CDTYPE = ''SA'' AND A3.CDNAME = ''EXECTYPE'' AND MST.EXECTYPE = A3.CDVAL
    AND A4.CDTYPE = ''SA'' AND A4.CDNAME = ''STATUS'' AND nvl(MST.status,''A'') = A4.CDVAL', 'AFUSERTRDLNK', 'frmRECFLNK', 'FULLNAME', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;