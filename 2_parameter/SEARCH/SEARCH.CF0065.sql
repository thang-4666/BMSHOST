SET DEFINE OFF;
 TO_CHAR(createtime,''DD/MM/YYYY hh24:mI'') createtime,
 to_char(createtime,''DD/MM/YYYY'')  txdate, templateid,t.subject,
 case when e.status = ''A'' then ''Chờ gửi'' when e.status = ''R'' then ''Từ chối'' when e.status = ''S'' then ''Đã gửi'' else ''Không gửi'' end status,
e.note,
 decode (t.type,''E'',''EMAIL'',''S'',''SMS'') TYPE,AUTOID
FROM (SELECT * FROM EMAILLOG UNION ALL SELECT * FROM EMAILLOGHIST ) E  inner join templates t on  e.templateid = t.code
 ', 'CF0065', 'frm', '', '0333', 0, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', 'CUSTODYCD', 'N', '', '');