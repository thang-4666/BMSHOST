SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CI0052','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CI0052', 'HOST', 'CI', '12', '5', '5', '60', '5', '5', 'BẢNG KÊ NỘP TIỀN CỦA KHÁCH HÀNG', 'Y', 1, '1', 'L', 'CI0052', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'BẢNG KÊ NỘP TIỀN CỦA KHÁCH HÀNG', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;