-- Modelo de índice de diversidade por estado (Market Mix)

SELECT
    state,
    COUNT(DISTINCT brewery_type) AS unique_types_count,
    COUNT(brewery_id) AS total_breweries,
    
    -- Média de cervejarias por tipo no estado
    ROUND(COUNT(brewery_id) / COUNT(DISTINCT brewery_type), 2) AS density_index
FROM {{ ref('stg_brew') }}
WHERE state IS NOT NULL
GROUP BY 1
ORDER BY unique_types_count DESC