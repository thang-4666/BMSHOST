SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -700121;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-700121, '[-700121]: Lệnh con phải cùng loại giá với lệnh tổng!', '[-700121]:Lệnh con phải cùng loại giá với lệnh tổng!', 'OD', NULL);COMMIT;