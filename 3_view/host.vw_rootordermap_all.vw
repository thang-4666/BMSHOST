SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ROOTORDERMAP_ALL
(FOACCTNO, ORDERID, STATUS, MESSAGE, ID)
BEQUEATH DEFINER
AS 
select "FOACCTNO","ORDERID","STATUS","MESSAGE","ID" from rootordermap
union all
select "FOACCTNO","ORDERID","STATUS","MESSAGE","ID" from rootordermaphist
/
