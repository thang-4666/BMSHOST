SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100992;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100992, 'Không được phân quyền mức phòng giao dịch để sử dụng sản phẩm', 'The business product is invalid for sub-branch', 'SA', NULL);COMMIT;