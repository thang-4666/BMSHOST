SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('DF0005','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('DF0005', 'HOST', 'DF', '12', '5', '5', '60', '5', '5', 'BÁO CÁO TỔNG HỢP SỐ DƯ SẢN PHẨM HỖ TRỢ THEO ĐƠN VỊ GIẢI NGÂN', 'Y', 1, '1', 'L', 'DF0005', 'N', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'BÁO CÁO TỔNG HỢP SỐ DƯ SẢN PHẨM THEO ĐƠN VỊ GIẢI NGÂN', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;