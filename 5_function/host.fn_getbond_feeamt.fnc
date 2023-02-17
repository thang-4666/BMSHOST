SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_getbond_feeamt(PV_STOTALSELL NUMBER, PV_STOTALBUY NUMBER, PV_SFEEEXC NUMBER)
  RETURN  NUMBER
-- Lua chon Ma trai phieu, Load ra LISTINGQTTY

  IS
    v_FEEAMT NUMBER(20,4);
   -- Declare program variables as shown above
BEGIN
    --((STOTALSELL|++|STOTALBUY))|**|((SFEEEXC|//|@100))
    v_FEEAMT := ROUND((PV_STOTALSELL+PV_STOTALBUY)*(PV_SFEEEXC/100),4);
    RETURN v_FEEAMT;

EXCEPTION
   WHEN others THEN
    RETURN 0;
END;

 
 
 
 
/