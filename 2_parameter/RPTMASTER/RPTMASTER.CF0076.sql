SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CF0076','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CF0076', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'DANH SÁCH HỒ SƠ KHÁCH HÀNG ĐANG CHỜ DUYỆT (GIAO DỊCH 0076)', 'Y', 1, '1', 'P', 'CFMAST', 'N', 'B', 'N', 'V', 'N', 'N', 'M', '000', 'S', -1, 'VIEW PENDING CUSTOMER TO APPROVE (WAIT FOR 0076)', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;