SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CI0043','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CI0043', 'HOST', 'CI', '12', '5', '5', '60', '5', '5', 'BẢNG KÊ TÀI SẢN ĐẢM BẢO ĐỐI VỚI CÁC PHÁT SINH GIAO DỊCH VAY ỨNG TRƯỚC TIỀN BÁN CHỨNG KHOÁN', 'Y', 1, '1', 'P', 'CI0043', 'Y', 'S', 'N', 'R', 'N', 'N', 'M', '000', 'S', -1, 'BẢNG KÊ TÀI SẢN ĐẢM BẢO ĐỐI VỚI CÁC PHÁT SINH GIAO DỊCH VAY ỨNG TRƯỚC TIỀN BÁN CHỨNG KHOÁN', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;