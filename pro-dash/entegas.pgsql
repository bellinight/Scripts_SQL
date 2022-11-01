
SELECT 
entrega.dh_emissao,
entrega.id_cupom_fiscal AS NFce,
cupomfiscal.serieecf, 
cupomfiscal.coo, 
cupomfiscal.frete,
entrega.nome_do_cliente,
entrega.logradouro,
entrega.bairro,
entrega.telefone 
FROM entrega
INNER JOIN cupomfiscal
ON cupomfiscal.id = entrega.id_cupom_fiscal
WHERE cupomfiscal.id_motivo_cancelamento IS NULL
ORDER BY dataabertura DESC
LIMIT 100


#####-V2-######

SELECT  entrega.cod_cpf_cnpj, 
        entrega.nome_do_cliente,
        entrega.logradouro,
        entrega.cidade,
        entrega.referencia,
        entrega.cep,
        entrega.telefone,
        entrega.numero_cupom,
        cupomfiscal.serieecf,
        cupomfiscal.dataabertura ::date,
        cupomfiscal.coo,
        cupomfiscal.totalliquido,
        cupomfiscal.troco,
        cupomfiscal.frete
          
FROM entrega
    INNER JOIN cupomfiscal
    ON entrega.id_cupom_fiscal = cupomfiscal.ID
order by date(dh_emissao) desc
limit 1000










