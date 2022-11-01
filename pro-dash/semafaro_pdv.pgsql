SELECT identificador_pdv,
(dh_download_iniciado-dh_atualizacao_finalizada) AS Tempo_AT,
date(dh_atualizacao_finalizada) AS Tempo_DT,
id_atualizacao AS Vers_AT
from carga.semaforo_pdv