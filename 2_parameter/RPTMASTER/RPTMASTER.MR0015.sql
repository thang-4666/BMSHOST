SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('MR0015','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('MR0015', 'HOST', 'MR', '12', '5', '5', '60', '5', '5', 'CHI TIẾT TÀI SẢN ĐẢM BẢO', 'Y', 1, '1', 'L', 'MR0015', 'N', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'CHI TIẾT TÀI SẢN ĐẢM BẢO', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;