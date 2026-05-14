-- Opportunity Map (Cidades com Potencial de Crescimento)

SELECT
    state,
    city,
    COUNT(DISTINCT brewery_type) as diversity_index,
    COUNT(brewery_id) as total_breweries,
    CASE 
        WHEN COUNT(DISTINCT brewery_type) <= 2 THEN 'Baixa Diversidade - Oportunidade'
        WHEN COUNT(DISTINCT brewery_type) BETWEEN 3 AND 5 THEN 'Mercado em Expansão'
        ELSE 'Mercado Saturado/Consolidado'
    END as market_status
FROM {{ ref('stg_brew') }}
WHERE city IS NOT NULL
GROUP BY 1, 2
HAVING total_breweries > 5