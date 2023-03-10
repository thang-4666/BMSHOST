SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('MRPRMLIMITMST','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('MRPRMLIMITMST', 'Quản lý chính sách ưu đãi hạn mức margin', 'Quan ly chinh sach uu dai han muc margin', 'SELECT MST.AUTOID, MST.FULLNAME, MST.VALDAY, MST.AMT, A1.CDCONTENT STATUS,
    MST.VALDATE, MST.EXPDATE, A4.CDCONTENT DATETYPE, MST.OPENDATE, MST.CLOSEDATE,
    (CASE WHEN MST.STATUS IN (''B'',''C'',''N'') THEN ''N'' ELSE ''Y'' END) EDITALLOW,
    (CASE WHEN MST.STATUS = ''P'' THEN ''Y'' ELSE ''N'' END) APRALLOW,
    ''Y'' AS DELALLOW
FROM MRPRMLIMITMST MST, ALLCODE A1 , ALLCODE A4
WHERE A1.CDTYPE=''SY'' AND A1.CDNAME=''APPRV_STS'' AND A1.CDVAL=MST.STATUS
AND A4.CDTYPE=''SA'' AND A4.CDNAME=''DATETYPE'' AND A4.CDVAL=MST.DATETYPE', 'MRPRMLIMITMST', 'frmMRPRMLIMITMST', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;