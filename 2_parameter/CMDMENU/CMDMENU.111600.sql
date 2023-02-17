SET DEFINE OFF;DELETE FROM CMDMENU WHERE 1 = 1 AND NVL(PRID,'NULL') = NVL('111600','NULL');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111601', '111600', 3, 'Y', 'O', 'RM0001  ', 'SA', 'CRBTRFLOG', 'Quản lý bảng kê', 'Management list of voucher send to bank', 'YYYYYYYYYYY', '6611,6612,6600,6640,6655,6656');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111602', '111600', 3, 'Y', 'O', 'RM0001  ', 'SA', 'CRBTXREQ', 'Quản lý Hold/ Unhold', 'Hold/ Unhold management', 'NNNNNNNNNNY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111604', '111600', 3, 'N', 'T', 'RM0004  ', 'RM', '', 'Giao dịch RM', 'RM transaction', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111605', '111600', 3, 'Y', 'R', 'RM0005  ', 'RM', 'RPTMASTER', 'Báo cáo', 'Reporting', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111606', '111600', 3, 'Y', 'O', 'RM9938', 'RM', 'VSDTXREQ', 'Quản lý thông tin chi tiết điện gửi VSD', 'VSD message management', 'NYNNYYYNNN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111607', '111600', 3, 'Y', 'A', 'RM0007  ', 'RM', 'RMGENERALVIEW', 'Tra cứu tổng hợp', 'RM General view', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111609', '111600', 3, 'Y', 'A', 'RM0009', 'RM', 'RMHOLDCONTROL', 'Bảng vận hành phong tỏa/giải tỏa NH', 'Queue hold/unhold control process', 'YYYYYYYYYYY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111610', '111600', 3, 'Y', 'A', 'RM0010  ', 'RM', 'VIEWACC', 'Xem trạng thái tài khoản corebank mở trong ngày', 'View Corebank Status', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111611', '111600', 3, 'Y', 'A', 'RM0011', 'RM', 'BANKORDER', 'Lấy các trạng thái bảng kê chờ xác nhận', 'Banks TRFCODE Request', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111615', '111600', 3, 'Y', 'A', 'SY0613', 'SA', 'IMPFROMCRB', 'Đồng bộ dữ liệu đầu ngày', 'BOD Synchronous data', 'YYYYYYYYYYN', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111616', '111600', 3, 'Y', 'A', '', 'ST', 'VSDREPORT', 'Tạo điện yêu cầu tra xuất báo cáo từ VSD', 'Tạo điện yêu cầu tra xuất báo cáo từ VSD', 'NYNNYYYNNN', '6630');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111617', '111600', 3, 'Y', 'O', 'RM0015  ', 'ST', 'CRBFILEEXPORT', 'Quản lý file bảng kê Offline', 'Management file export to bank', 'YYYYYYYYYYY', '');Insert into CMDMENU   (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD) Values   ('111619', '111600', 3, 'Y', 'A', '', 'ST', 'CSVCOMPARE_DE', 'Xem file CSV (DE)', 'Xem file CSV', 'NYNNYYYNNN', '6608');COMMIT;