SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CF0064','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CF0064', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'CHUYỂN LOẠI HÌNH TIỂU KHOẢN SANG KẾT NỐI COREBANK (GIAO DỊCH 0064)', 'Y', 1, '1', 'P', 'AFMAST', 'N', 'B', 'N', 'V', 'N', 'N', 'M', '000', 'S', -1, 'VIEW  CONTRACT TO CHANGE AFTYPE TO CORE BANK (WAIT FOR 0064)', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;