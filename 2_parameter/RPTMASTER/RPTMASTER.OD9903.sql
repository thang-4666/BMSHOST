SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('OD9903','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('OD9903', 'HOST', 'OD', '12', '5', '5', '60', '5', '5', 'DOANH SỐ CAREBY OT', 'Y', 1, '1', 'P', 'OD9903', 'N', 'S', 'N', 'R', 'N', 'Y', 'M', '000', 'S', -1, 'DOANH S? CAREBY OT', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;