-- Modelo de Ranking Regional (Top Cidades por Estado)

WITH city_metrics AS (
    SELECT
        state,
        city,
        COUNT(brewery_id) AS qty_breweries,
        
        -- Cria um ranking dentro de cada estado
        RANK() OVER (PARTITION BY state ORDER BY COUNT(brewery_id) DESC) as city_rank
    FROM {{ ref('stg_brew') }}
    WHERE city IS NOT NULL
    GROUP BY 1, 2
)

SELECT * FROM city_metrics WHERE city_rank <= 5