-- =============================================
-- AmigosNet — Tabela de localização em tempo real
-- Cole isso no SQL Editor do Supabase
-- =============================================

-- 1. Criar tabela
CREATE TABLE IF NOT EXISTS locations (
  id          TEXT PRIMARY KEY,
  name        TEXT NOT NULL,
  char        INTEGER NOT NULL DEFAULT 0,
  status      TEXT DEFAULT 'Online',
  lat         DOUBLE PRECISION,
  lng         DOUBLE PRECISION,
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Habilitar RLS (Row Level Security) mas permitir leitura pública
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;

-- Qualquer um pode ler (ver amigos no mapa)
CREATE POLICY "Leitura pública"
  ON locations FOR SELECT
  USING (true);

-- Qualquer um pode inserir/atualizar (sem login, via anon key)
CREATE POLICY "Inserção pública"
  ON locations FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Atualização pública"
  ON locations FOR UPDATE
  USING (true);

-- 3. Habilitar Realtime para essa tabela
ALTER PUBLICATION supabase_realtime ADD TABLE locations;

-- 4. Limpar entradas antigas automaticamente (opcional)
-- Remove localizações com mais de 24h
CREATE OR REPLACE FUNCTION cleanup_old_locations()
RETURNS void AS $$
BEGIN
  DELETE FROM locations WHERE updated_at < NOW() - INTERVAL '24 hours';
END;
$$ LANGUAGE plpgsql;

-- ✅ Pronto! Agora vá para a aba "Replication" do Supabase
-- e confirme que a tabela "locations" está habilitada.
