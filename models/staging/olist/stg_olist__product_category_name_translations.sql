WITH source AS (
    SELECT * FROM {{ source('raw', 'product_category_name_translations') }}
),
renamed AS (
    SELECT
        product_category_name,
        product_category_name_english
    FROM source
)

SELECT * FROM renamed
