SET DEFINE OFF;DELETE FROM CMDMENU WHERE 1 = 1 AND NVL(PRID,'NULL') = NVL('000000','NULL');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('010000', '000000', 2, 'N', 'P', '', '', '', 'Quản trị hệ thống', 'System administration', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('020000', '000000', 2, 'N', 'P', '', '', '', 'Tham số hệ thống', 'System parameters', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('030000', '000000', 2, 'N', 'P', '', '', '', 'Tham số nghiệp vụ', 'Business parameters', 'YYYYYYYYYYN', '');COMMIT;