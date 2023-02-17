SET DEFINE OFF;DELETE FROM CMDMENU WHERE 1 = 1 AND NVL(PRID,'NULL') = NVL('100000','NULL');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111001', '100000', 2, 'Y', 'M', 'CF0002  ', 'CF', 'CFMAST', 'Thông tin khách hàng', 'Customer profile', 'YYYYYYYNNYY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111002', '100000', 2, 'Y', 'O', 'CF0003', 'CF', 'CFMASTTEMP', 'Mở tài khoản online', 'Template customer profile', 'NYYNYYYNNYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111100', '100000', 2, 'N', 'P', '', '', '', 'Tiểu khoản giao dịch', 'Sub-account', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111200', '100000', 2, 'N', 'P', '', '', '', 'Tiền gửi thanh toán', 'Current account', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111300', '100000', 2, 'N', 'P', '', '', '', 'Chứng khoán', 'Securities account', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111400', '100000', 2, 'N', 'P', '', '', '', 'Lệnh giao dịch', 'Orders', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111500', '100000', 2, 'N', 'P', '', '', '', 'Tín dụng', 'Loan', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111600', '100000', 2, 'N', 'P', '', 'RM', '', 'Kết nối ngân hàng, VSD', 'Interface to bank and VSD', 'YYYYYYYYYY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111700', '100000', 2, 'N', 'P', '', 'MR', 'MRMAST', 'Giao dịch ký quỹ', 'Margin trading', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111800', '100000', 2, 'N', 'P', '', 'DF', 'DFMAST', 'Quản lý cầm cố', 'Mortgage', 'YYYYYYYYYY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('112700', '100000', 2, 'N', 'P', '', 'RE', 'REMAST', 'Tài khoản đại lý/môi giới', 'Remiser account', 'YYYYYYYYYYY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('112800', '100000', 2, 'N', 'P', '', '', '', 'Thông tin GDTT', 'OnlineTrade Information', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('150000', '100000', 2, 'N', 'P', '', '', '', 'Tích hợp VSD', 'VSD integration', 'YYYYYYYYYYN', '');COMMIT;