SELECT reducaoz.dataemissao, reducaoz.id_pdv, 
sum(reducaoz.descontos),
sum(reducaoz.cancelmanetos)
FROM reducaoz
WHERE DATE(dataemissao) = CURRENT_DATE -4
GROUP BY reducaoz.dataemissao, reducaoz.id_pdv
ORDER BY dataemissao desc
LIMIT 10



