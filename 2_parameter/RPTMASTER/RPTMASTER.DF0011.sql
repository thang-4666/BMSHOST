SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('DF0011','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('DF0011', 'HOST', 'DF', '12', '5', '5', '60', '5', '5', 'BÁO CÁO SỐ DƯ CÁC TK VAY BẢO LÃNH VÀ USER CẤP HẠN MỨC', 'Y', 1, '1', 'L', 'DF0011', 'N', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'BÁO CÁO SỐ DƯ CÁC TK VAY BẢO LÃNH VÀ USER CẤP HẠN MỨC', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;