SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -200419;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-200419, '[-200419]: Số ngày chuyền loại hình phải lớn hơn 0 !', '[-200419]: Số ngày chuyền loại hình phải lớn hơn 0!', 'SA', NULL);COMMIT;