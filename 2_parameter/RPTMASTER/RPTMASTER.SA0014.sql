SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('SA0014','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('SA0014', 'HOST', 'SA', '12', '5', '5', '60', '5', '5', 'BÁO CÁO LỊCH SỬ THAY ĐỔI THÔNG TIN CỦA USER', 'Y', 1, '1', 'P', 'SA0014', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'BÁO CÁO LỊCH SỬ THAY ĐỔI THÔNG TIN CỦA USER', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;