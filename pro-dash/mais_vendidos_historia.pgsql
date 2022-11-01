SELECT item.nome, iditem, sum(quantidade) AS total_venda,
itemcupomfiscal.preco AS  Preço 
FROM itemcupomfiscal
INNER JOIN
item
ON
item.id = itemcupomfiscal.iditem
GROUP BY  item.nome, iditem, itemcupomfiscal.preco
ORDER BY total_venda DESC
LIMIT 100