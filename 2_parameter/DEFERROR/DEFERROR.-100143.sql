SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100143;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100143, '[-100143]:Chuyển đổi loại hình không thành công!. Tiểu khoản tồn tại dư nợ chưa thu hồi!', '[-100143]:Chuyển đổi loại hình không thành công!. Tiểu khoản tồn tại dư nợ chưa thu hồi!', 'CF', NULL);COMMIT;