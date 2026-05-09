WITH source_data AS (
    SELECT * FROM {{ source('openbrew_silver', 'breweries') }}
),

renamed_and_final AS (
    SELECT
        brewery_id,
        brewery_name,
        brewery_type,
        street_address,
        city,
        state,
        postal_code,
        country,
        longitude,
        latitude,
        phone_number,
        website_url,
        
        original_ingestion_at,
        processed_at AS silver_processed_at,
        CURRENT_TIMESTAMP() AS staging_processed_at
        
    FROM source_data
)

SELECT * FROM renamed_and_final