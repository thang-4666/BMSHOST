SET DEFINE OFF;
select mst.*,
round((case when MARGINRATE * MRIRATE =0 then OUTSTANDING else
greatest( 0,-OUTSTANDING-NAVACCOUNT *100/MRIRATE) end),0) ADDVND
from v_acoountmarginrate mst where 0=0 and CUSTID=''<$CUSTID>''
', 'MRTYPE', '', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');