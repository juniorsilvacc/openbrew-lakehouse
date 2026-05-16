-- Modelo de Saúde dos Dados (Data Health)

SELECT
    state,
    COUNT(brewery_id) as total,

    -- Percentual de registros que têm site (Presença Digital)
    ROUND(AVG(CASE WHEN website_url IS NOT NULL THEN 1 ELSE 0 END) * 100, 2) as website_fill_rate,
    
    -- Percentual de registros com telefone
    ROUND(AVG(CASE WHEN phone_number IS NOT NULL THEN 1 ELSE 0 END) * 100, 2) as phone_fill_rate
FROM {{ ref('stg_brew') }}
GROUP BY 1