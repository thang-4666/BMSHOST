SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('CRBRQDSTS','NULL') AND NVL(CDTYPE,'NULL') = NVL('RM','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'N', 'Chờ xử lý', 0, 'Y', 'Chờ xử lý', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'C', 'Hoàn thành', 1, 'Y', 'Hoàn thành', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'E', 'Lỗi', 2, 'Y', 'Lỗi', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'H', 'Hủy bỏ', 3, 'Y', 'Hủy bỏ', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'M', 'Đã xử lý tay', 4, 'Y', 'Đã xử lý tay', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'L', 'Gửi muộn', 5, 'Y', 'Gửi muộn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'W', 'Chờ hoàn thành', 6, 'Y', 'Chờ hoàn thành', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'O', 'Đã xử lý muộn', 7, 'Y', 'Đã xử lý muộn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('RM', 'CRBRQDSTS', 'B', 'Lỗi xử lý muộn', 8, 'Y', 'Lỗi xử lý muộn', 'C');COMMIT;