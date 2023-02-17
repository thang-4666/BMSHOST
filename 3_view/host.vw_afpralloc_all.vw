SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_AFPRALLOC_ALL
(AUTOID, AFACCTNO, PRINUSED, CODEID, ALLOCTYP, 
 ORGORDERID, TXDATE, TXNUM, RESTYPE)
BEQUEATH DEFINER
AS 
select "AUTOID","AFACCTNO","PRINUSED","CODEID","ALLOCTYP","ORGORDERID","TXDATE","TXNUM","RESTYPE" from afpralloc
union all
select "AUTOID","AFACCTNO","PRINUSED","CODEID","ALLOCTYP","ORGORDERID","TXDATE","TXNUM","RESTYPE" from afprallocation
/