SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CF2203','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CF2203', 'HOST', 'CF', '12', '5', '5', '60', '5', '5', 'CHỨNG TỪ ĐK KH ONLINE: GIẤY ĐỀ NGHỊ ỦY QUYỀN CHỮ KÝ', 'Y', 1, '1', 'L', 'CF2200', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'BÁO CÁO DANH SÁCH KHÁCH HÀNG MỞ TIỂU KHOẢN ĐANG HOẠT ĐỘNG', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;