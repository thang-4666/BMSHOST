SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -200059;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-200059, '[-200059]: Khách hàng chưa đăng ký giao dịch qua điện thoại!', '[-200059]: Khách hàng chưa đăng ký giao dịch qua điện thoại!', 'CF', NULL);COMMIT;