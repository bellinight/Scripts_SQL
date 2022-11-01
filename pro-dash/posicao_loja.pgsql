SELECT
    dfdata_movimento ::date,
    sum(dfquantidade_venda) ::int2 as Itens,
    sum(dfvalor_venda_liquido) ::float4 as Venda,
    sum(dfvalor_custo_bruto) :: float4 as Custo,
    (sum(dfvalor_venda_liquido)) - (sum(dfvalor_custo_bruto)) as Lucro,
    ((sum(dfvalor_venda_liquido)) - (sum(dfvalor_custo_bruto))) / sum(dfvalor_venda_liquido) * 100 as Perc_Lucro,
    sum(dfvalor_icms) ::float4 as Tributo,
    sum(dfvalor_icms) /  sum(dfvalor_venda_liquido) * 100 as Perc_Tributo 
FROM vw_venda_diaria  
GROUP BY dfdata_movimento
    ORDER BY dfdata_movimento desc
  limit 3