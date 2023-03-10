SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ORDER_MAKER
(ORDERID, TLID, EXECTYPE, TXDATE, TXTIME)
BEQUEATH DEFINER
AS 
((SELECT     distinct B.ORDERID, D.TLNAME TLID, B.EXECTYPE, to_date(A.TXDATE, 'dd-mon-yyyy'), B.TXTIME
            FROM        VW_TLLOG_ALL A, VW_ODMAST_ALL B, TLPROFILES D
            WHERE       A.TXNUM = B.TXNUM AND A.TLID <> '0000' AND D.TLID = A.TLID and A.TXDATE = B.TXDATE AND
                        b.via <> 'B')
            union ALL
            (SELECT      E.ORGACCTNO, F.TLNAME, E.EXECTYPE, TO_DATE(SUBSTR(CREATEDDT,1,10), 'DD/MM/YYYY'), TO_CHAR(LAST_CHANGE, 'HH24:MI:SS') TXTIME
            FROM        VW_FOMAST_ALL E, TLPROFILES F
            WHERE       E.USERNAME = F.TLID(+) AND LENGTH(ORGACCTNO) = LENGTH('8000080610001415')))
/
