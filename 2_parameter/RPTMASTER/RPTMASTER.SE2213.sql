SET DEFINE OFF;DELETE FROM RPTMASTER WHERE 1 = 1 AND NVL(RPTID,'NULL') = NVL('SE2213','NULL');Insert into RPTMASTER   (RPTID, DSN, MODCODE, FONTSIZE, RHEADER, PHEADER, RDETAIL, PFOOTER, RFOOTER, DESCRIPTION, AD_HOC, RORDER, PSIZE, ORIENTATION, STOREDNAME, VISIBLE, AREA, ISLOCAL, CMDTYPE, ISCAREBY, ISPUBLIC, ISAUTO, ORD, AORS, ROWPERPAGE, EN_DESCRIPTION, STYLECODE, TOPMARGIN, LEFTMARGIN, RIGHTMARGIN, BOTTOMMARGIN, SUBRPT, ISCMP, ISDEFAULTDB, ICONFILENAME) Values   ('SE2213', 'HOST', 'SE', '12', '5', '5', '60', '5', '5', 'TỪ CHỐI LỆNH TRÁI PHIẾU (GIAO DỊCH 2213)', 'Y', 1, '1', 'P', 'SE9001', 'N', 'B', 'N', 'V', 'N', 'N', 'M', '000', 'S', -1, 'VIEW SENDING BOND ORDER TO REJECT (WAIT FOR 2213)', '', 0, 0, 0, 0, 'N', 'N', 'Y', '');COMMIT;