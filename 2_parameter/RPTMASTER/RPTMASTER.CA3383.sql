SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('CA3383','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('CA3383', 'HOST', 'CA', '12', '5', '5', '60', '5', '5', 'CHUYỂN KHOẢN QUYỀN MUA RA NGOÀI VÀ NỘI BỘ', 'Y', 1, '1', 'P', 'CA3383', 'Y', 'B', 'N', 'V', 'N', 'N', 'M', '000', 'S', -1, 'OUTWARD TRANSFER', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;