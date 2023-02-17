SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('SBSECURITIES_CA','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('SBSECURITIES_CA', 'Quản lý chứng khoán', 'Securities management', 'SELECT CODEID,ISSUERID,SYMBOL,A0.CDCONTENT SECTYPE,A2.CDCONTENT TRADEPLACE,PARVALUE,FOREIGNRATE
 FROM SBSECURITIES,ALLCODE A0, ALLCODE A2 WHERE TRADEPLACE<>''006'' AND SECTYPE <> ''004'' AND A0.CDTYPE = ''SA'' AND A0.CDNAME = ''SECTYPE'' AND A0.CDVAL=SECTYPE and  A2.CDTYPE = ''SA'' AND A2.CDNAME = ''TRADEPLACE'' AND A2.CDVAL= TRADEPLACE', 'SBSECURITIES', 'frmSBSECURITIES', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;