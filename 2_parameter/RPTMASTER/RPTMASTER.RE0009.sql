SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('RE0009','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('RE0009', 'HOST', 'RE', '12', '5', '5', '60', '5', '5', 'BÁO CÁO DANH SÁCH LỆNH VÀ PHÍ GIAO DỊCH CÁC CHI NHÁNH', 'Y', 1, '1', 'L', 'RE0009', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'BÁO CÁO DANH SÁCH LỆNH VÀ PHÍ GIAO DỊCH CÁC CHI NHÁNH', '', 0, 0, 0, 0, 'Y', 'N', 'Y', '');COMMIT;