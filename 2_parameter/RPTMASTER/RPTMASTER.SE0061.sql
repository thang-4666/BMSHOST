SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('SE0061','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('SE0061', 'HOST', 'SE', '12', '5', '5', '60', '5', '5', 'PHIẾU TÍNH PHÍ LƯU KÝ', 'Y', 1, '1', 'L', 'SE0061', 'Y', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'PHIẾU TÍNH PHÍ LƯU KÝ', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;