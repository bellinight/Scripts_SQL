select serie_cupom, totalliquido, bandeira, tipo, data_hora_gravacao
from pagamento_cartao_pos
inner join cupomfiscal cupomfiscal2 
ON cupomfiscal2.id = pagamento_cartao_pos.id_cupom_fiscal
WHERE date(data_hora_gravacao) = CURRENT_DATE -1