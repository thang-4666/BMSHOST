SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100802;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100802, '[-100802]: Không được phép khai trùng giao dịch bị chặn!', '[-100802]: Không được phép khai trùng giao dịch bị chặn', 'SA', NULL);COMMIT;