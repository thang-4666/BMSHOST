SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CI0003','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CI0003', 'HOST', 'CI', '12', '5', '5', '60', '5', '5', 'SỔ CHI TIẾT TK TIỀN GIAO DỊCH CỦA NHÀ ĐẦU TƯ', 'Y', 1, '1', 'L', 'CI0003', 'N', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'SỔ CHI TIẾT TK TIỀN GIAO DỊCH CỦA NHÀ ĐẦU TƯ', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;