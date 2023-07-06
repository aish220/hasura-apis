USE BANK_DB;

TRUNCATE CUSTOMERS;

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE) VALUES
(1, 'Emelia Chapman', '17 Fitzroy St, Surry Hills NSW 2010', '+61 2 4567 8901', 'Driver License: N1234567', 1300.00, 'Withdrawal on 2023-03-29 for $200.00', 680),
(3, 'Rory Hodge', '8 Elizabeth St, Hobart TAS 7000', '+61 3 4567 8901', 'Passport: C3456789', 480.25, 'Deposit on 2023-04-04', 750),
(7, 'Abbie Horne', '45 King William St, Adelaide SA 5000', '+61 8 7654 3210', 'Driver License: S7654321', 9100.00, 'Purchase at Westfield Marion on 2023-04-05 for $120.00', 840),
(8, 'Sara Pineda', '9 Collins St, Melbourne VIC 3000', '+61 3 5678 9012', 'Passport: D4567890', 1750.50, 'Purchase at Woolworths, Melbourne on 2023-03-31 for $65.20', 790),
(9, 'Rico Wheeler', '123 Bourke St, Melbourne VIC 3000', '+61 3 6789 0123', 'Driver License: T6543210', 600.00, 'Deposit on 2023-04-01', 680),
(10, 'Zachary Mclaughlin', '98 Flinders St, Melbourne VIC 3000', '+61 3 7890 1234', 'Passport: E5678901', 845.75, 'Purchase at Myer, Melbourne on 2023-04-02 for $150.00', 820),
(11, 'Sian Contreras', '27 James St, Brisbane QLD 4000', '+61 7 9012 3456', 'Driver License: U4321098', 235.50, 'Withdrawal on 2023-04-05 for $50.00', 700),
(2, 'Bernard Rojas', '7 Park St, Sydney NSW 2000', '+61 2 3456 7890', 'Passport: F6789012', 1825.00, 'Deposit on 2023-04-06', 710),
(4, 'Clarence Munoz', '55 St Georges Tce, Perth WA 6000', '+61 8 0123 4567', 'Driver License: V8765432', 4000.00, 'Purchase at David Jones, Perth on 2023-04-03 for $300.00', 790),
(5, 'Virginia Reilly', '62 Lygon St, Carlton VIC 3053', '+61 3 2345 6789', 'Passport: G7890123', 690.25, 'Withdrawal on 2023-04-07 for $50.00', 770);

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE) VALUES
(6, 'Seren Lara', '32 Prince Street, Richmond, VIC 3121', '+61 413 123 456', 'Passport: AUS123456', 4500.00, 'Account opened on 01/02/2020. Regular deposits of $1000/month.', 765),
(12, 'Marcus Peters', '89 George Street, Sydney, NSW 2000', '+61 499 987 654', 'Driver License: NSW123456', 25000.00, 'Account opened on 03/03/2019. Regular withdrawals of $500/month.', 620),
(13, 'Niamh Perez', '57 Flinders Lane, Melbourne, VIC 3000', '+61 412 345 678', 'Passport: AUS234567', 8900.00, 'Account opened on 05/05/2021. No transaction history.', 790),
(14, 'Sophie Griffiths', '22 Puckle Street, Moonee Ponds, VIC 3039', '+61 488 765 432', 'Driver License: VIC654321', 1500.00, 'Account opened on 11/11/2020. One-time deposit of $1500.', 450),
(15, 'Niamh Thomson', '75 Main Street, Mornington, VIC 3931', '+61 499 876 543', 'Passport: AUS345678', 6000.00, 'Account opened on 09/09/2021. Regular deposits of $2000/month.', 840),
(16, 'Tiana Rodriguez', '26 Elizabeth Street, Hobart, TAS 7000', '+61 488 654 321', 'Driver License: TAS123456', 30000.00, 'Account opened on 06/06/2018. Regular withdrawals of $1000/month.', 710),
(17, 'Emilie Stewart', '40 Ferguson Street, Williamstown, VIC 3016', '+61 412 678 901', 'Passport: AUS456789', 4000.00, 'Account opened on 02/02/2022. No transaction history.', 800),
(18, 'Hector Payne', '33 West Terrace, Adelaide, SA 5000', '+61 499 765 432', 'Driver License: SA654321', 18000.00, 'Account opened on 04/04/2019. Regular deposits of $1500/month.', 690),
(19, 'Isabella Mckee', '96 King William Street, Kent Town, SA 5067', '+61 488 987 654', 'Passport: AUS567890', 7500.00, 'Account opened on 08/08/2020. Regular withdrawals of $500/month.', 820),
(20, 'James Mclean', '14 Church Street, Hawthorn, VIC 3122', '+61 412 345 678', 'Driver License: VIC123456', 5200.00, 'Account opened on 10/10/2021. One-time deposit of $5200.', 530);

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE)
VALUES
    (21, 'Wei Chen', '123 Orchard Rd, Singapore 238855', 'wei.chen@email.com', 'Passport: GA-5210, DL: 98574', 2350.00, '{"2023-03-25": {"description": "Salary deposit", "amount": 2350.00}, "2023-03-15": {"description": "Electric bill payment", "amount": -85.00}}', 720),
    (22, 'Yuki Nakamura', '2 Chome-1 Nishishinjuku, Shinjuku City, Tokyo 163-0532, Japan', 'yuki.nakamura@email.com', 'Passport: 463745, DL: 32658', 980.30, '{"2023-03-28": {"description": "Bonus deposit", "amount": 500.00}, "2023-03-15": {"description": "Rent payment", "amount": -600.00}, "2023-03-01": {"description": "Salary deposit", "amount": 1080.30}}', 780),
    (23, 'Zhang Wei', 'Jing\'an, Shanghai, China', '+86 139 1122 3344', 'Passport: BC-9857, DL: 372819', 500.00, '{"2023-03-21": {"description": "Deposit", "amount": 500.00}}', 650),
    (24, 'Choi Hye-jin', 'Gangnam-gu, Seoul, South Korea', 'hyejin.choi@email.com', 'Passport: 239849, DL: 78392', 3500.00, 
    '{"2023-03-29": {"description": "Salary deposit", "amount": 3500.00}, "2023-03-20": {"description": "Utility bill payment", "amount": -80.00}}', 820),
    (25, 'Tanaka Satoshi', '2 Chome-8-1 Nishishinjuku, Shinjuku City, Tokyo 160-0023, Japan', 'satoshi.tanaka@email.com', 
    'Passport: 584672, DL: 982364', 752.40, '{"2023-03-23": {"description": "Salary deposit", "amount": 752.40}, "2023-03-17": {"description": "Phone bill payment", "amount": -50.00}}', 790),
    (26, 'Wang Xiaohua', 'Xuanwu, Beijing, China', '+86 139 2233 4455', 'Passport: DE-372819, DL: 291837', 1200.00, '{"2023-03-26": {"description": "Deposit", "amount": 1200.00}}', 690),
    (27, 'Park Min-ji', 'Jung-gu, Seoul, South Korea', 'minji.park@email.com', 
    'Passport: 372819, DL: 947293', 468.90, '{"2023-03-22": {"description": "Salary deposit", "amount": 468.90}, "2023-03-10": {"description": "Deposit", "amount": 200.00}}', 700);

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE) VALUES
(28, 'Hiroki Tanaka', '4 Chome-4-5 Ginza, Chuo City, Tokyo 104-0061, Japan', '+81 3-6263-8686', 'Passport ID: JP-12345678', 12300.00, 'Bought a laptop, paid rent', 750),
(29, 'Ji-won Kim', '23, 12-gil, Gangnam-daero, Seocho-gu, Seoul, South Korea', '+82 2-1234-5678', 'National ID: KR-12345678', 500.00, 'Grocery shopping, paid electricity bill', 600),
(30, 'Xi Chen', '88 Century Ave, Pudong, Shanghai, China', '+86 21 6882 8888', 'National ID: CN-12345678', 2500.00, 'Paid for car repairs, bought new clothes', 700),
(31, 'Haruki Nakamura', '1 Chome-11-7 Nankōbashi, Suminoe-ku, Osaka, Japan', '+81 6-1234-5678', 'Passport ID: JP-87654321', 1200.00, 'Paid for groceries, bought a new phone', 800),
(32, 'Chen Li', '22 Gulshan Ave, Dhaka 1212, Bangladesh', '+880 2-55662000', 'National ID: BD-12345678', 8000.00, 'Paid rent, bought a new TV', 900),
(33, 'Jae-hyun Kim', '654-1 Sinsa-dong, Gangnam-gu, Seoul, South Korea', '+82 2-1234-5678', 'National ID: KR-87654321', 700.00, 'Bought new shoes, paid for utilities', 550),
(34, 'Chia-hui Wu', 'No. 1, Sec. 4, Roosevelt Rd., Da’an Dist., Taipei City 10617, Taiwan', '+886 2 3366 5888', 'National ID: TW-12345678', 2200.00, 'Paid for car repairs, bought a new laptop', 780),
(35, 'Rajesh Kumar', 'F-1, Block 9, Clifton, Karachi, Pakistan', '+92 21 35833111', 'National ID: PK-12345678', 1500.00, 'Bought groceries, paid for internet', 680);

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE) VALUES
(36, 'Arianna Kim', 'Seoul, South Korea', '+82 2-1234-5678', 'Passport: KR1234567', 5000.00, 'Purchases: Groceries, Clothing', 780),
(37, 'Ethan Wong', 'Hong Kong, China', '+852 1234 5678', 'Passport: HK1234567', 10000.00, 'Purchases: Electronics, Home Appliances', 820),
(38, 'Kaitlyn Li', 'Shanghai, China', '+86 21 1234 5678', 'Passport: CN1234567', 7500.00, 'Purchases: Jewelry, Luxury Items', 760),
(39, 'Mika Sato', 'Tokyo, Japan', '+81 3-1234-5678', 'Passport: JP1234567', 9000.00, 'Purchases: Books, Stationery', 810),
(40, 'Liam Chen', 'Taipei, Taiwan', '+886 2 1234 5678', 'Passport: TW1234567', 8000.00, 'Purchases: Toys, Games', 790),
(41, 'Sofia Kim', 'Seoul, South Korea', '+82 2-1234-5678', 'Passport: KR1234567', 6000.00, 'Purchases: Groceries, Clothing', 750),
(42, 'Ryota Nakamura', 'Osaka, Japan', '+81 6-1234-5678', 'Passport: JP1234567', 12000.00, 'Purchases: Furniture, Home Decor', 900),
(43, 'Samantha Lim', 'Singapore', '+65 1234 5678', 'Passport: SG1234567', 6500.00, 'Purchases: Beauty Products, Fashion Accessories', 780),
(44, 'Jun Lee', 'Seoul, South Korea', '+82 2-1234-5678', 'Passport: KR1234567', 4500.00, 'Purchases: Groceries, Household Items', 710),
(45, 'Hiroshi Tanaka', 'Tokyo, Japan', '+81 3-1234-5678', 'Passport: JP1234567', 11000.00, 'Purchases: Electronics, Gadgets', 860);

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE) VALUES 
(46, 'Hana Nakamura', 'Tokyo, Japan', '+81-3-1234-5678', 'Passport - JP12345678', 12450.00, 'Purchases: 4/6/23 - $245.00; 4/7/23 - $99.99', 780),
(47, 'Zhang Wei', 'Beijing, China', '+86-10-8765-4321', 'ID Card - 987654321012345678', 1650.00, 'Purchases: 4/6/23 - $99.99; 4/7/23 - $34.50', 625),
(48, 'Kim Min-Jae', 'Seoul, South Korea', '+82-2-9876-5432', 'ID Card - 123456789012', 520.00, 'Purchases: 4/5/23 - $50.00; 4/6/23 - $23.75; 4/7/23 - $19.99', 690),
(49, 'Siti Nurhaliza', 'Kuala Lumpur, Malaysia', '+60-3-1234-5678', 'IC Number - 901231-08-1234', 9875.00, 'Purchases: 4/7/23 - $875.00', 825),
(50, 'Naru Patel', 'Mumbai, India', '+91-22-1234-5678', 'Passport - Z1234567', 234.50, 'Purchases: 4/6/23 - $34.50; 4/7/23 - $200.00', 570),
(51, 'Bounkham Vorachit', 'Vientiane, Laos', '+856-21-123-456', 'ID Card - 001234567', 987.60, 'Purchases: 4/5/23 - $36.20; 4/7/23 - $18.75', 630),
(52, 'Anna Li', 'Shanghai, China', '+86-21-9876-5432', 'Passport - AB1234567', 7580.00, 'Purchases: 4/6/23 - $499.00; 4/7/23 - $123.45', 720),
(53, 'Sakura Tanaka', 'Kyoto, Japan', '+81-75-123-4567', 'ID Card - 123456789012', 865.20, 'Purchases: 4/5/23 - $75.20; 4/7/23 - $790.00', 760),
(54, 'Jung Ji-Woo', 'Busan, South Korea', '+82-51-987-6543', 'ID Card - 987654321012', 246.90, 'Purchases: 4/6/23 - $199.00; 4/7/23 - $47.90', 685),
(55, 'Nguyen Thanh', 'Hanoi, Vietnam', '+84-24-1234-5678', 'ID Card - 001234567', 765.00, 'Purchases: 4/7/23 - $99.00; 3/6/23 - $12.12', 566);

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CONTACT_DETAILS, IDENTIFICATION_DOCUMENTS, ACCOUNT_BALANCE, ACCOUNT_HISTORY, CREDIT_SCORE) VALUES
(56, 'Shiori Nakamura', 'Tokyo, Japan', 'shiori.nakamura@example.com, +81-3-1234-5678', 'Passport: 1234567890', 5000.00, 'Deposit: +$5000.00 on 2023-04-08', 850),
(57, 'Min-ho Park', 'Seoul, South Korea', 'minho.park@example.com, +82-2-9876-5432', 'ID Card: 1234567890', 15000.00, 'Deposit: +$15000.00 on 2023-04-08', 780),
(58, 'Chang Wei', 'Shanghai, China', 'chang.wei@example.com, +86-21-1234-5678', 'Passport: 1234567890', 12000.00, 'Deposit: +$12000.00 on 2023-04-08', 710),
(59, 'Risa Ito', 'Kyoto, Japan', 'risa.ito@example.com, +81-75-987-6543', 'Driver License: 1234567890', 800.00, 'Withdrawal: -$200.00 on 2023-04-08\nWithdrawal: -$600.00 on 2023-04-09', 640),
(60, 'Kuan Huang', 'Beijing, China', 'kuan.huang@example.com, +86-10-1234-5678', 'Passport: 1234567890', 3300.00, 'Deposit: +$3300.00 on 2023-04-08\nWithdrawal: -$800.00 on 2023-04-10', 900),
(61, 'Eun-joo Kim', 'Busan, South Korea', 'eunjoo.kim@example.com, +82-51-987-6543', 'ID Card: 1234567890', 700.00, 'Withdrawal: -$300.00 on 2023-04-08', 760),
(62, 'Lan Mei', 'Guangzhou, China', 'lan.mei@example.com, +86-20-1234-5678', 'Passport: 1234567890', 6500.00, 'Deposit: +$6500.00 on 2023-04-08', 820),
(63, 'Haruki Nakamura', 'Osaka, Japan', 'haruki.nakamura@example.com, +81-6-9876-5432', 'Passport: 1234567890', 18000.00, 'Deposit: +$18000.00 on 2023-04-08', 880),
(64, 'Tae-joon Lee', 'Incheon, South Korea', 'taejoon.lee@example.com, +82-32-1234-5678', 'ID Card: 1234567890', 2500.00, 'Deposit: +$2500.00 on 2023-04-08\nWithdrawal: -$1000.00 on 2023-04-09', 720);


