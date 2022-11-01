SELECT cliente.nome, devolucao.numero, serie,cpf_cliente,motivo,data_devolucao,
valor_total, usuario.nomereduzido, id_fiscal FROM devolucao
INNER JOIN usuario
ON usuario.id = devolucao.id_fiscal
INNER JOIN cliente
ON devolucao.cpf_cliente = cliente.cnpjcpf
ORDER BY data_devolucao desc
limit 30