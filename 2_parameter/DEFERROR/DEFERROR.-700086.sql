SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -700086;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-700086, '[-700086]: Tiểu khoản bị phong tỏa không được phép mua bán!', '[-700086]: Tieu khoan bi phong toa khong duoc phep mua ban!', 'OD', NULL);COMMIT;