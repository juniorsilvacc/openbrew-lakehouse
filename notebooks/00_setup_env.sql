-- 1. Garantir que o catálogo existe
CREATE CATALOG IF NOT EXISTS openbrew;

-- Definir o catálogo atual
USE CATALOG openbrew;

-- 2. Criar os schemas para organização das camadas
CREATE SCHEMA IF NOT EXISTS brew;
CREATE SCHEMA IF NOT EXISTS brew_bronze;
CREATE SCHEMA IF NOT EXISTS brew_silver;

-- 3. Criar o Volume
CREATE VOLUME IF NOT EXISTS openbrew.brew.landing_zone;

-- 4. Comentários para Governança 
COMMENT ON CATALOG openbrew IS 'Catálogo dedicado ao projeto OpenBrewery Lakehouse';
COMMENT ON SCHEMA openbrew.brew_bronze IS 'Dados brutos extraidos diretamente da API OpenBrewery';
COMMENT ON SCHEMA openbrew.brew_silver IS 'Dados limpos, tipados e padronizados';