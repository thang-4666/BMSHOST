SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''ADD'' CDVAL ,''Thêm mới'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''EDIT'' CDVAL ,''Sửa'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''ONLINE'' CDVAL ,''GD trực tuyến'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''TELE'' CDVAL ,''GD điện thoại'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''Đăng ký'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''Hủy bỏ'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');