SELECT cupom_fiscal_eletronico.dh_emissao, sum(preco) - sum(precocusto) ::float4 AS lucro_loja
FROM itemcupomfiscal, cupom_fiscal_eletronico
WHERE date(cupom_fiscal_eletronico.dh_emissao) = CURRENT_DATE -5
GROUP BY cupom_fiscal_eletronico.dh_emissao
limit 10

SELECT * FROM cupom_fiscal_eletronico
ORDER BY dh_autorizacao desc
LIMIT 10



SELECT 
* from item

limit 5


SELECT 
dfdata_movimento, 
dfcodigo_item, item.nome, item.preco,
item.peso_variavel,
sum(dfquantidade_venda) ::int AS Qtda,
item.preco * sum(dfquantidade_venda) ::float4 AS Total_Item
from vw_venda_diaria_pdv
INNER JOIN item
ON vw_venda_diaria_pdv.dfcodigo_item = item.id
WHERE dfdata_movimento = CURRENT_DATE -1 
GROUP BY dfdata_movimento, item.peso_variavel, dfcodigo_item, item.nome, item.preco
limit 100


SELECT 
dfdata_movimento, 
dfcodigo_item, item.nome, item.preco,
item.peso_variavel,
sum(dfquantidade_venda) AS Qtda,
sum(dfquantidade_venda) * (sum(preco) - sum(precocusto)) ::int
from vw_venda_diaria_pdv
INNER JOIN item
ON vw_venda_diaria_pdv.dfcodigo_item = item.id
WHERE dfdata_movimento = CURRENT_DATE -1 AND item.peso_variavel = FALSE
GROUP BY dfdata_movimento, item.peso_variavel, dfcodigo_item, item.nome, item.preco


limit 100