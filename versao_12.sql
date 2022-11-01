DROP TABLE IF EXISTS public.versao;

CREATE TABLE IF NOT EXISTS public.versao (
       id INTEGER NOT NULL
     , versao_sistema VARCHAR(20) NOT NULL
     , versao_script VARCHAR(30) NOT NULL
     , data_hora_atualizacao TIMESTAMP NOT NULL
     , CONSTRAINT versao_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.versao
 DROP COLUMN IF EXISTS descricao;

ALTER TABLE IF EXISTS public.versao
  ADD COLUMN IF NOT EXISTS versao_sistema VARCHAR(20) NOT NULL,
  ADD COLUMN IF NOT EXISTS versao_script VARCHAR(30) NOT NULL,
  ADD COLUMN IF NOT EXISTS data_hora_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

DO $x$
DECLARE
  retorno VARCHAR;
BEGIN
  SELECT data_type FROM information_schema.columns
    INTO retorno
   WHERE table_schema = 'public'
     AND table_name = 'versao'
     AND column_name = 'versao_script';

  IF retorno ILIKE '%char%' THEN
   ALTER TABLE IF EXISTS public.versao
   ALTER COLUMN versao_script DROP NOT NULL;

   UPDATE public.versao SET versao_script = NULL;

   ALTER TABLE IF EXISTS public.versao
   ALTER COLUMN versao_script TYPE INTEGER USING (versao_script::INTEGER);

   UPDATE public.versao SET versao_script = 0 WHERE versao_script IS NULL;
  END IF;
 END
$x$

