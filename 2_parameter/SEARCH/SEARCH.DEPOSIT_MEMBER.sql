SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('DEPOSIT_MEMBER','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('DEPOSIT_MEMBER', 'Quản lý thành viên lưu ký', 'Deposit member management', 'SELECT MST.DEPOSITID, MST.SHORTNAME, MST.FULLNAME, MST.OFFICENAME, MST.ADDRESS, MST.PHONE, MST.FAX, MST.DESCRIPTION  ,
(CASE WHEN NVL(MST.STATUS,''A'') IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW, A0.CDCONTENT STATUS
FROM DEPOSIT_MEMBER MST, ALLCODE A0 WHERE A0.CDTYPE = ''SA'' AND  A0.CDNAME = ''STATUS'' AND NVL(MST.STATUS,''A'') = A0.CDVAL ', 'DEPOSIT_MEMBER', 'frmDEPOSIT_MEMBER', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;