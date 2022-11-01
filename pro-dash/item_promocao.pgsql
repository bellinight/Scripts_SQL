select
id as codigo_item, nome,
(preco-precocusto) as lucro_bruto,
(estoque*precocusto) as moeda_giro, 
preco, precocusto, estoque, desc_secao
from item
