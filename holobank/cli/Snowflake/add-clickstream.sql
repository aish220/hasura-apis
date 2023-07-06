-- Use the bank database
USE DATABASE BANK_DB;

TRUNCATE CLICKSTREAM_DATA;

-- Generate 10000 rows of dummy data for the CLICKSTREAM_DATA table
INSERT INTO CLICKSTREAM_DATA (
    USER_ID,
    SESSION_ID,
    URL,
    REFERRER,
    EVENT_TYPE,
    DEVICE_TYPE,
    BROWSER_TYPE,
    USER_IP,
    LOCATION
)
SELECT 
    -- Generate random user IDs between 1 and 100
    MOD(ABS(RANDOM()), 100) + 1 AS USER_ID,
    -- Generate random session IDs between 1 and 10
    MOD(ABS(RANDOM()), 100) + 1 AS SESSION_ID,
    -- Generate random event times within the last 30 days
    -- CURRENT_TIMESTAMP() AS EVENT_TIME,
 -- DATEADD('DAY', -1 * FLOOR(RANDOM() * 365), CURRENT_DATE()) as EVENT_TIME,
-- Generate random URLs
    CASE MOD(ABS(RANDOM()), 30) + 0
        WHEN 0 THEN '/'
        WHEN 1 THEN '/accounts'
        WHEN 2 THEN '/loans'
        WHEN 3 THEN '/insurance'
        WHEN 4 THEN '/offers'
        WHEN 5 THEN '/creditcards'
        WHEN 6 THEN '/investments'
        WHEN 7 THEN '/mortgages'
        WHEN 8 THEN '/wealth-management'
        WHEN 9 THEN '/online-banking'
        WHEN 10 THEN '/mobile-banking'
        WHEN 11 THEN '/savings-accounts'
        WHEN 12 THEN '/checking-accounts'
        WHEN 13 THEN '/personal-loans'
        WHEN 14 THEN '/business-loans'
        WHEN 15 THEN '/home-loans'
        WHEN 16 THEN '/auto-loans'
        WHEN 17 THEN '/home-insurance'
        WHEN 18 THEN '/auto-insurance'
        WHEN 19 THEN '/life-insurance'
        WHEN 20 THEN '/travel-insurance'
        WHEN 21 THEN '/retirement-planning'
        WHEN 22 THEN '/education-savings'
        WHEN 23 THEN '/health-savings'
        WHEN 24 THEN '/credit-score'
        WHEN 25 THEN '/fraud-protection'
        WHEN 26 THEN '/contact-us'
        WHEN 27 THEN '/about-us'
        WHEN 28 THEN '/careers'
        WHEN 29 THEN '/blog'
    END AS URL,
    -- Generate random referrer URLs
    CASE MOD(ABS(RANDOM()), 30) + 0
WHEN 0 THEN 'https://www.google.com/'
WHEN 1 THEN 'https://www.facebook.com/'
WHEN 2 THEN 'https://www.twitter.com/'
WHEN 3 THEN 'https://www.linkedin.com/'
WHEN 4 THEN 'https://www.reddit.com/'
WHEN 5 THEN 'https://www.instagram.com/'
WHEN 6 THEN 'https://www.youtube.com/'
WHEN 7 THEN 'https://www.yahoo.com/'
WHEN 8 THEN 'https://www.bing.com/'
WHEN 9 THEN 'https://www.amazon.com/'
WHEN 10 THEN 'https://www.netflix.com/'
WHEN 11 THEN 'https://www.microsoft.com/'
WHEN 12 THEN 'https://www.apple.com/'
WHEN 13 THEN 'https://www.github.com/'
WHEN 14 THEN 'https://www.medium.com/'
WHEN 15 THEN 'https://www.quora.com/'
WHEN 16 THEN 'https://www.wikipedia.org/'
WHEN 17 THEN 'https://www.nytimes.com/'
WHEN 18 THEN 'https://www.cnbc.com/'
WHEN 19 THEN 'https://www.wsj.com/'
WHEN 20 THEN 'https://www.bloomberg.com/'
WHEN 21 THEN 'https://www.cnn.com/'
WHEN 22 THEN 'https://www.bbc.com/'
WHEN 23 THEN 'https://www.theguardian.com/'
WHEN 24 THEN 'https://www.nbcnews.com/'
WHEN 25 THEN 'https://www.huffpost.com/'
WHEN 26 THEN 'https://www.thrillist.com/'
WHEN 27 THEN 'https://www.espn.com/'
WHEN 28 THEN 'https://www.nba.com/'
WHEN 29 THEN ''
    END AS REFERRER,
    -- Generate random event types
    CASE MOD(ABS(RANDOM()), 15) + 0
WHEN 0 THEN 'click'
WHEN 1 THEN 'pageview'
WHEN 2 THEN 'form_submission'
WHEN 3 THEN 'scroll'
WHEN 4 THEN 'hover'
WHEN 5 THEN 'keydown'
WHEN 6 THEN 'keyup'
WHEN 7 THEN 'search'
WHEN 8 THEN 'credit_card_apply'
WHEN 9 THEN 'share_sell'
WHEN 10 THEN 'share_purchase'
WHEN 11 THEN 'video_play'
WHEN 12 THEN 'video_pause'
WHEN 13 THEN 'video_seek'
WHEN 14 THEN 'video_end'
    END AS EVENT_TYPE,
    -- Generate random device types
    CASE MOD(ABS(RANDOM()), 3) + 0
        WHEN 0 THEN 'desktop'
        WHEN 1 THEN 'mobile'
        WHEN 2 THEN 'tablet'
    END AS DEVICE_TYPE,
    -- Generate random browser types
    CASE MOD(ABS(RANDOM()), 3) + 0
        WHEN 0 THEN 'Chrome'
        WHEN 1 THEN 'Firefox'
        WHEN 2 THEN 'Safari'
    END AS BROWSER_TYPE,
    -- Generate random IP addresses
CONCAT(
    SUBSTRING(REGEXP_REPLACE(CAST(FLOOR(RANDOM() * 256) AS VARCHAR), '[^0-9]', ''), 1, 2), '.',
    SUBSTRING(REGEXP_REPLACE(CAST(FLOOR(RANDOM() * 256) AS VARCHAR), '[^0-9]', ''), 1, 2), '.',
    SUBSTRING(REGEXP_REPLACE(CAST(FLOOR(RANDOM() * 256) AS VARCHAR), '[^0-9]', ''), 1, 2), '.',
    SUBSTRING(REGEXP_REPLACE(CAST(FLOOR(RANDOM() * 256) AS VARCHAR), '[^0-9]', ''), 1, 2)
) AS USER_IP,
    -- Generate random locations
    CASE MOD(ABS(RANDOM()), 63) + 0
WHEN 0 THEN 'Sydney, Australia'
WHEN 1 THEN 'Melbourne, Australia'
WHEN 2 THEN 'Brisbane, Australia'
WHEN 3 THEN 'Perth, Australia'
WHEN 4 THEN 'Adelaide, Australia'
WHEN 5 THEN 'Auckland, New Zealand'
WHEN 6 THEN 'Wellington, New Zealand'
WHEN 7 THEN 'Christchurch, New Zealand'
WHEN 8 THEN 'Singapore'
WHEN 9 THEN 'Hong Kong'
WHEN 10 THEN 'Tokyo, Japan'
WHEN 11 THEN 'Osaka, Japan'
WHEN 12 THEN 'Seoul, South Korea'
WHEN 13 THEN 'Busan, South Korea'
WHEN 14 THEN 'Shanghai, China'
WHEN 15 THEN 'Beijing, China'
WHEN 16 THEN 'Guangzhou, China'
WHEN 17 THEN 'Shenzhen, China'
WHEN 18 THEN 'Taipei, Taiwan'
WHEN 19 THEN 'Bangkok, Thailand'
WHEN 20 THEN 'Jakarta, Indonesia'
WHEN 21 THEN 'Kuala Lumpur, Malaysia'
WHEN 22 THEN 'Manila, Philippines'
WHEN 23 THEN 'Hanoi, Vietnam'
WHEN 24 THEN 'Ho Chi Minh City, Vietnam'
WHEN 25 THEN 'Phnom Penh, Cambodia'
WHEN 26 THEN 'Vientiane, Laos'
WHEN 27 THEN 'Yangon, Myanmar'
WHEN 28 THEN 'Colombo, Sri Lanka'
WHEN 29 THEN 'Mumbai, India'
WHEN 30 THEN 'Delhi, India'
WHEN 31 THEN 'Bengaluru, India'
WHEN 32 THEN 'Chennai, India'
WHEN 33 THEN 'Hyderabad, India'
WHEN 34 THEN 'Kolkata, India'
WHEN 35 THEN 'Bangalore, India'
WHEN 36 THEN 'Ahmedabad, India'
WHEN 37 THEN 'Pune, India'
WHEN 38 THEN 'Surat, India'
WHEN 39 THEN 'Jaipur, India'
WHEN 40 THEN 'Lucknow, India'
WHEN 41 THEN 'Kanpur, India'
WHEN 42 THEN 'Nagpur, India'
WHEN 43 THEN 'Patna, India'
WHEN 44 THEN 'Ludhiana, India'
WHEN 45 THEN 'Agra, India'
WHEN 46 THEN 'Nashik, India'
WHEN 47 THEN 'Vadodara, India'
WHEN 48 THEN 'Bhopal, India'
WHEN 49 THEN 'Coimbatore, India'
WHEN 50 THEN 'Kochi, India'
WHEN 51 THEN 'Goa, India'
WHEN 52 THEN 'Trivandrum, India'
WHEN 53 THEN 'Kathmandu, Nepal'
WHEN 54 THEN 'Dhaka, Bangladesh'
WHEN 55 THEN 'Karachi, Pakistan'
WHEN 56 THEN 'Lahore, Pakistan'
WHEN 57 THEN 'Islamabad, Pakistan'
WHEN 58 THEN 'Kabul, Afghanistan'
WHEN 59 THEN 'Tehran, Iran'
WHEN 60 THEN 'Baghdad, Iraq'
WHEN 61 THEN 'Dubai, United Arab Emirates'
WHEN 62 THEN 'Abu Dhabi, United Arab Emirates'
    END AS LOCATION
FROM TABLE(GENERATOR(ROWCOUNT=>10000));
