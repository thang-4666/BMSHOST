SET DEFINE OFF;
  FROM (SELECT   mst.txdate, mst.refordernumber, mst.ordernumber,
                 mst.custodycd, mst.symbol, mst.bsca bors, mst.norp,
                 mst.ordertype, mst.volume, mst.price,
                 NVL (dtl.volume, 0) tradevol,
                 NVL (dtl.price,0) tradeprice
            FROM stcorderbookexp mst ,stctradebookexp dtl
            WHERE SUBSTR(mst.refordernumber,1,2)=SUBSTR(dtl.refconfirmnumber(+),1,2)
            AND  mst.ordernumber = dtl.ordernumber(+)
            ORDER BY mst.CUSTODYCD,mst.ORDERNUMBER
        )
 WHERE 0 = 0
', 'ODMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');