SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100142;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100142, '[-100142]:Chuyển đổi loại hình không thành công!. Tiểu khoản tồn tại khoản ứng trước tiền bán chưa hoàn trả!', '[-100142]:Chuyển đổi loại hình không thành công!. Tiểu khoản tồn tại khoản ứng trước tiền bán chưa hoàn trả!', 'CF', NULL);COMMIT;