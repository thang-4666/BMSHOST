SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CF0065','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CF0065', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'TRA CỨU TRẠNG THÁI GỬI SMS VÀ EMAIL', 'Y', 1, '1', 'P', 'CFMAST', 'Y', 'A', 'N', 'V', 'N', 'N', 'M', '000', 'S', -1, 'TRA CỨU TRẠNG THÁI GỬI SMS VÀ EMAIL', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;