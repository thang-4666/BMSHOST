SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CF1124','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CF1124', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'Giữ hạng khách hàng', 'Y', 1, '1', 'P', 'CF1124', 'Y', 'A', 'N', 'V', 'N', 'N', 'M', '000', 'S', -1, 'Giữ hạng khách hàng', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;