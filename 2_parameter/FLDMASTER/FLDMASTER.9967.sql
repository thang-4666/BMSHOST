SET DEFINE OFF;
select  tltxcd VALUECD,tltxcd VALUE, TLTXCD||'':''||txdesc DISPLAY ,en_txdesc EN_DISPLAY,txdesc DESCRIPTION , 1 LSTODR from tltx
UNION ALL
select  ''ALL'' VALUECD, ''ALL'' VALUE,  ''ALL'' DISPLAY , ''ALL'' EN_DISPLAY, ''ALL'' DESCRIPTION , -1 LSTODR  from DUAL
)
ORDER BY LSTODR,VALUECD ', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'TLTXCD', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_TLTXCD', 'Y', '', 'N', '', '', '', 'N');