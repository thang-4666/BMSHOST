SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CA0026','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CA0026', 'HOST', 'CA', '12', '5', '5', '60', '5', '5', 'GIẤY ĐỀ NGHỊ CHUYỂN NHƯỢNG QUYỀN MUA CHỨNG KHOÁN (17/THQ)', 'Y', 1, '1', 'P', 'CA0026', 'N', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'GIẤY ĐỀ NGHỊ CHUYỂN NHƯỢNG QUYỀN MUA CHỨNG KHOÁN (17/THQ)', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;