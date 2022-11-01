SELECT 
    inutilizacao_sefaz.situacao, 
    inutilizacao_sefaz.serie, 
    inutilizacao_sefaz.numero_inicial,
    inutilizacao_sefaz.mensagem,
    inutilizacao_sefaz.dh_inutilizacao,
    inutilizacao_sefaz.protocolo, 
    inutilizacao_sefaz.exportado
FROM inutilizacao_sefaz

