SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('RM0036','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('RM0036', 'HOST', 'RM', '12', '5', '5', '60', '5', '5', 'BẢNG KÊ THANH TOÁN PHÍ TIỀN MUA CK ', 'Y', 1, '1', 'P', 'RM0036', 'Y', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'BẢNG KÊ THANH TOÁN PHÍ TIỀN MUA CK', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;