-- Modelo de Coordenadas (Geo Distribution)

SELECT
    state,
    city,
    brewery_type,
    
    ROUND(latitude, 2) as map_lat,
    ROUND(longitude, 2) as map_long,
    COUNT(brewery_id) as cluster_size
FROM {{ ref('stg_brew') }}
WHERE latitude IS NOT NULL AND longitude IS NOT NULL
GROUP BY 1, 2, 3, 4, 5