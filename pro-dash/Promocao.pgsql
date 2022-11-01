SELECT ROW_NUMBER() OVER(ORDER BY datafim asc),
 iditem, date(datainicio),date(datafim), idpromocao, item.nome, preco, precopromocao, (preco-precopromocao) AS desconto FROM itempromocao
INNER JOIN item 
ON itempromocao.iditem = item.id
INNER JOIN promocao
ON promocao.id = itempromocao.idpromocao
WHERE promocao.desativado  IS NULL

limit 50
