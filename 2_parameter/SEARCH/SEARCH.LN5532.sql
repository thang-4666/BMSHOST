SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('LN5532','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('LN5532', 'Tra cuu lich tra lai de dieu chinh lai den han', 'View interest payment schedule for adjust maturity(waiting for 5532)', 'SELECT L.AUTOID, ACCTNO, NML DUE, DUEDATE, A.CDCONTENT DUESTS FROM LNSCHD L, ALLCODE A WHERE A.CDTYPE = ''LN'' AND A.CDNAME = ''DUESTS'' AND A.CDVAL = DUESTS AND REFTYPE = ''I''', 'LNMAST', '', '', '5532', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;