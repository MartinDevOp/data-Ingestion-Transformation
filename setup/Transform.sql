-- ========================================
-- ✅ A. Create position_current in analytics
-- ========================================
USE analytics;

DROP TABLE IF EXISTS position_current;

CREATE TABLE position_current AS
SELECT sp.*
FROM staging.staging_positions sp
JOIN (
    SELECT user_id, MAX(position_id) AS latest_position_id
    FROM staging.staging_positions
    GROUP BY user_id
) latest
ON sp.user_id = latest.user_id AND sp.position_id = latest.latest_position_id;

-- ========================================
-- ✅ B. Create individual_position in analytics
-- Enrich position_current using role_trends and company_growth
-- ========================================
DROP TABLE IF EXISTS individual_position;

CREATE TABLE individual_position AS
SELECT
    pc.user_id,
    pc.company,
    rt.position_title,
    rt.frequency,
    cg.growth_rate
FROM analytics.position_current pc
LEFT JOIN analytics.role_trends rt ON rt.position_title = 'Data Analyst'  -- dummy match for now
LEFT JOIN analytics.company_growth cg ON pc.company = cg.company_name;

-- ========================================
-- ✅ C. Create transition_unique_base in analytics
-- Simulate transitions using ROW_NUMBER over position_id
-- ========================================
DROP TABLE IF EXISTS transition_unique_base;

CREATE TABLE transition_unique_base AS
SELECT
    prev.user_id,

    -- Previous position
    prev.company AS prev_company,
    prev.position_id AS prev_position_id,

    -- New position
    next.company AS new_company,
    next.position_id AS new_position_id

FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY position_id) AS rn
    FROM staging.staging_positions
) prev

JOIN (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY position_id) AS rn
    FROM staging.staging_positions
) next
ON prev.user_id = next.user_id AND prev.rn = next.rn - 1;