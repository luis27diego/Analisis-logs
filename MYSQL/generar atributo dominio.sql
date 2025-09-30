SELECT * FROM log_analytics.dim_referer;

SELECT 
    referer,
    SUBSTRING_INDEX(
        SUBSTRING_INDEX(
            REPLACE(REPLACE(REPLACE(referer, 'https://', ''), 'http://', ''), 'www.', ''), 
            '/', 
            1
        ), 
        '?', 
        1
    ) AS dominio
FROM log_analytics.dim_referer;

ALTER TABLE dim_referer ADD COLUMN dominio VARCHAR(255);

UPDATE dim_referer
SET dominio = SUBSTRING_INDEX(
                  SUBSTRING_INDEX(
                      REPLACE(REPLACE(REPLACE(referer, 'https://', ''), 'http://', ''), 'www.', ''), 
                      '/', 
                      1
                  ), 
                  '?', 
                  1
              );
