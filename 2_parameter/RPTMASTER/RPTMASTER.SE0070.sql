SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('SE0070','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('SE0070', 'HOST', 'SE', '12', '5', '5', '60', '5', '5', 'GIẤY XÁC NHẬN PHONG TỎA(GD 2244)', 'Y', 1, '1', 'L', 'SE0070', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'GIẤY ĐN PHONG TỎA CK LÀM TSĐBKV (32/LK)', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;