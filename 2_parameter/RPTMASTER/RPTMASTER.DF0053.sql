SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('DF0053','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('DF0053', 'HOST', 'DF', '12', '5', '5', '60', '5', '5', 'BÁO CÁO TỔNG HỢP CHỨNG KHOÁN CẦM CỐ KHÔNG QUA VSD', 'Y', 1, '1', 'L', 'DF0053', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'BÁO CÁO TỔNG HỢP CHỨNG KHOÁN CẦM CỐ KHÔNG QUA VSD', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;