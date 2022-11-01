
====================Atual Usado no DSHM===========================================
SELECT SUM(dfvalor_venda_bruta - dfvalor_desconto)
    FILTER ( WHERE dfdata_movimento = CURRENT_DATE -1 
AND dfvalor_venda_bruta_cancelada = 0 ) 
AS Itens_Cupons_Total
FROM vw_item_cupom_fiscal