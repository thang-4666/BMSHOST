SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CI0029','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CI0029', 'HOST', 'CI', '12', '5', '5', '60', '5', '5', 'BÁO CÁO CÁC GIAO DỊCH PHÁT SINH QNTBCK THÁNG TRƯỚC ĐÃ TRẢ', 'Y', 1, '1', 'L', 'CI0029', 'Y', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'BÁO CÁO CÁC GIAO DỊCH PHÁT SINH QNTBCK THÁNG TRƯỚC ĐÃ TRẢ', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;