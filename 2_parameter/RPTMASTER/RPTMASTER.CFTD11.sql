SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CFTD11','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CFTD11', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'BÁO CÁO TỔNG HỢP XUẤT NHẬP TỒN CHỨNG KHOÁN CÁC TIỂU KHOẢN', 'Y', 1, '1', 'L', 'CFTD11', 'N', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'GENERAL REPORT OF INVENTORY OF SECURITIES SUB-ACCOUNT', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;