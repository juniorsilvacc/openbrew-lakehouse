WITH brew AS (
    SELECT * FROM {{ ref('stg_brew') }}
)

SELECT
    state,
    brewery_type,
    count(distinct brewery_id) as total_breweries,
    count(distinct city) as total_cities_covered,
    current_timestamp() as logic_processed_at
FROM brew
WHERE state IS NOT NULL
GROUP BY 
    state, 
    brewery_type
ORDER BY 
    state ASC, 
    total_breweries DESC