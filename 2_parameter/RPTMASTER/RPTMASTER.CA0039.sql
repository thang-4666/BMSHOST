SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CA0039','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CA0039', 'HOST', 'CA', '12', '5', '5', '60', '5', '5', 'DANH SÁCH NGƯỜI SỞ HỮU CHỨNG KHOÁN ĐƯỢC PHÂN BỔ QUYỀN TRÁI PHIẾU CHUYỂN ĐỔI - 13B/THQ', 'Y', 1, '1', 'L', 'CA0039', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'DANH SÁCH NGƯỜI SỞ HỮU CHỨNG KHOÁN ĐƯỢC PHÂN BỔ QUYỀN TRÁI PHIẾU CHUYỂN ĐỔI - 13B/THQ', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;