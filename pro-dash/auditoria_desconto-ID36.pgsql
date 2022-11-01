SELECT 
    item_cupom_desconto.numero_cupom,
    item_cupom_desconto.serie_cupom,
    item_cupom_desconto.desconto_total,
    item_cupom_desconto.nome_promocao_retaguarda,
    item_cupom_desconto.nome_supervisor,
    item_cupom_desconto.pertence_izio,
    item_cupom_desconto.pertence_premium,
    item_cupom_desconto.pertence_scanntech,
    item_cupom_desconto.subtotal_cresce_vendas
FROM item_cupom_desconto
INNER JOIN item
ON item_cupom_desconto.id_item_cupom_fiscal = item.id
    GROUP BY item_cupom_desconto.numero_cupom,
    item_cupom_desconto.serie_cupom,
    item_cupom_desconto.desconto_total,
    item_cupom_desconto.nome_promocao_retaguarda,
    item_cupom_desconto.nome_supervisor,
    item_cupom_desconto.pertence_izio,
    item_cupom_desconto.pertence_premium,
    item_cupom_desconto.pertence_scanntech,
    item_cupom_desconto.subtotal_cresce_vendas