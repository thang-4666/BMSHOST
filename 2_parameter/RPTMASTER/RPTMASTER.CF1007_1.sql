SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CF1007_1','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CF1007_1', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'SAO KÊ CHI TIẾT TIỀN VÀ CHỨNG KHOÁN', 'Y', 1, '1', 'P', 'CF1007_1', 'Y', 'S', 'N', 'R', 'Y', 'Y', 'M', '000', 'S', -1, 'SAO KÊ CHI TIẾT TIỀN VÀ CHỨNG KHOÁN', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;