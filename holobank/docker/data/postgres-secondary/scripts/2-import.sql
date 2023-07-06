--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.points (
    id integer NOT NULL,
    "customerId" integer NOT NULL,
    points_balance integer NOT NULL
);


ALTER TABLE public.points OWNER TO postgres;

--
-- Name: points_catalogue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.points_catalogue (
    id integer NOT NULL,
    destination text NOT NULL,
    description text NOT NULL,
    cost numeric NOT NULL,
    rating numeric NOT NULL,
    reviewers numeric NOT NULL,
    image text NOT NULL,
    points_club boolean DEFAULT false NOT NULL,
    category text DEFAULT 'Travel'::text NOT NULL
);


ALTER TABLE public.points_catalogue OWNER TO postgres;

--
-- Name: points_catalogue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.points_catalogue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_catalogue_id_seq OWNER TO postgres;

--
-- Name: points_catalogue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.points_catalogue_id_seq OWNED BY public.points_catalogue.id;


--
-- Name: points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_id_seq OWNER TO postgres;

--
-- Name: points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.points_id_seq OWNED BY public.points.id;


--
-- Name: points_purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.points_purchases (
    id integer NOT NULL,
    purchase_description text NOT NULL,
    points_amount integer NOT NULL,
    points_account integer
);


ALTER TABLE public.points_purchases OWNER TO postgres;

--
-- Name: points_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.points_purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_purchases_id_seq OWNER TO postgres;

--
-- Name: points_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.points_purchases_id_seq OWNED BY public.points_purchases.id;


--
-- Name: points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points ALTER COLUMN id SET DEFAULT nextval('public.points_id_seq'::regclass);


--
-- Name: points_catalogue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points_catalogue ALTER COLUMN id SET DEFAULT nextval('public.points_catalogue_id_seq'::regclass);


--
-- Name: points_purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points_purchases ALTER COLUMN id SET DEFAULT nextval('public.points_purchases_id_seq'::regclass);


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.points (id, "customerId", points_balance) FROM stdin;
1	1	89124
2	2	278
4	4	7814
5	5	148920
6	6	127893
7	7	7813
9	9	3718
10	10	618323
8	8	817
3	3	97371
\.


--
-- Data for Name: points_catalogue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.points_catalogue (id, destination, description, cost, rating, reviewers, image, points_club, category) FROM stdin;
2	Singapore	The jewel of Asia	99980	4.8000	32	photo-1562503542-2a1e6f03b16b.avif	f	Travel
3	Hong Kong	A long weekender	89910	4.6000	12	photo-1533029030467-904d7bbd602b.avif	f	Travel
4	Bali	Your Indonesian dream	76002	4.9000	19	photo-1531778272849-d1dd22444c06.avif	f	Travel
5	Phuket	Relax in Thailand	120499	5	61	photo-1586820672103-2272d8490ade.avif	f	Travel
6	Hanoi	Vietnam in style	101999	4.2000	26	photo-1605552666921-bd313f851541.avif	f	Travel
7	Bangalore	Experience India	88599	4.9000	95	photo-1640282898687-de31c76a465a.avif	f	Travel
9	The Maldives	Luxury on coral	198614	5	2	photo-1590523277543-a94d2e4eb00b.avif	t	Travel
29	KitchenAid	Crucial in any serious kitchen	2310	5	1	photo-1595644258096-69155da290fd.avif	t	Homewares
13	Ester	Trendy eclectic dishes	1100	4.5000	9	46tnThj.png	f	Food
31	Wooden plinth lamp	Lighting up your life	306	3.6000	3	photo-1517991104123-1d56a6e81ed9.avif	f	Homewares
10	Berowra Waters	A modern waterfront restaurant	1200	5	6	NbsvsWh.jpg	f	Food
20	Horse Riding	Bring out your inner cowboy	960	4.3000	12	photo-1632714392887-e10072d37709.avif	f	Experiences
14	mimi's	A restaurant fit for its vista	1200	4.3000	8	XB0sf8I.png	f	Food
19	Grana	A bustling all-day dining hub	1020	4.7000	3	ToMK3fO.png	f	Food
15	LuMi Dining	Beneath a multitude of pendent lights	900	4.5000	12	wF0bUQ2.png	f	Food
17	Bastardo	Italy, Argentina or Surry Hills	990	4.5000	12	ESzBg7f.png	f	Food
16	Arthur Surry Hills	Australian degustation	1360	4.6000	21	Hxx5CIs.png	f	Food
21	V8 Hot laps	For rev-heads only	550	4.1000	3	aij96nwwntfutvi9v6ou.jpg	f	Experiences
24	Skydive	Reach terminal velocity	475	3.5000	19	photo-1594277041806-4855808dcc75.avif	f	Experiences
26	Road & Snore	Sleeping in with the animals	1260	5	45	photo-1534567153574-2b12153a87f0.avif	f	Experiences
12	Fontana	Like taking a Mediterranean holiday	950	4.7000	5	lrMPUmc.png	t	Food
11	Cafe Paci	That special Paci vibe	1050	4.7000	11	4XO3h4y.png	t	Food
27	Meet a koala	Oh come on, look at it, it's cute	210	5	23	photo-1459262838948-3e2de6c1ec80.avif	f	Experiences
28	High tea	The finer things	880	5	1	photo-1532509334149-d2130d74253c.avif	t	Experiences
32	Cookware set	Suitable for 1-2 people	450	4.1000	5	photo-1584990347193-6bebebfeaeee.avif	f	Homewares
33	Portable speaker	Bringing tunes to your room	300	4.3000	7	photo-1612795146974-84dbe538f4a4.avif	f	Homewares
18	Bistrot 916	Neighbourhood bistro in Potts Point	880	4.6000	16	giVvoVB.png	f	Food
8	Tokyo	Scramble in Shibuya	141300	4.9000	89	photo-1549693578-d683be217e58.avif	f	Travel
34	Lenco turntable	Spin them like you're a real DJ	770	2.7000	16	photo-1597075383833-a10d2f819ca9.avif	f	Homewares
30	iRobot Vacuum	Let robots do it!	620	3.6000	21	photo-1590164409291-450e859ccb87.avif	f	Homewares
35	3 stone vases	Perfect for any sized home	1120	3.8000	8	photo-1631125915902-d8abe9225ff2.avif	f	Homewares
37	Antique bookshelf	Cat not included	6000	4.5000	6	photo-1505015306469-3b734c70fea7.avif	f	Homewares
22	Helicopter ride	Get a bird's eye view	1600	3.9000	8	photo-1576725386266-5c4b8c63da66.avif	f	Experiences
25	Icebergs swim	By in the water by the water	120	4.2000	65	photo-1554869284-9e692207599b.avif	f	Experiences
23	Jet fighter flight	Life at Mach 2	3680	4.9000	16	photo-1570158789564-391c2304f568.avif	f	Experiences
1	Sydney	The harbour city	13560	5	87	photo-1506973035872-a4ec16b8e8d9.avif	f	Travel
36	Champagne flutes	An element of class and decorum	960	4	5	photo-1535154866965-69bee7bc036c.avif	f	Homewares
\.


--
-- Data for Name: points_purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.points_purchases (id, purchase_description, points_amount, points_account) FROM stdin;
1	Points Purchase - 10,000 points	10000	7
2	Points Deduction - Sunbeam Blender (400 points x 36 months)	-14400	9
3	Points Purchase - 7,500 points	7500	4
4	Points Deduction - 3 Nights in Grand King Suite at Mandarin Oriental New York (3,273 points per night)	-9819	10
5	Points Purchase - 10,000 points	10000	3
6	Points Purchase - 7,500 points	7500	2
7	Points Deduction - Round Trip First Class Flight from Los Angeles (LAX) to New York (JFK) on Delta Airlines (16,140 points)	-16140	5
8	Points Purchase - 7,500 points	7500	6
9	Points Deduction - Credit Card Redemption (1 point per $1 spent)	-6723	8
10	Points Purchase - 5,000 points	5000	1
11	Points Accrual - Survey Completion (250 points)	250	3
12	Points Deduction - 5 Nights in Overwater Villa at Four Seasons Resort Bora Bora (38,680 points per night)	-193400	4
13	Points Purchase - 10,000 points	10000	2
14	Points Deduction - 2 Nights in St. Regis Suite at St. Regis San Francisco (3,845 points per night)	-7690	7
15	Points Purchase - 5,000 points	5000	10
16	Points Purchase - 7,500 points	7500	6
17	Points Deduction - Round Trip Business Class Flight from London (LHR) to Dubai (DXB) on Emirates Airlines (9,123 points)	-18246	1
18	Points Purchase - 7,500 points	7500	5
19	Points Deduction - 65" LG OLED TV (206 points x 63 months)	-12978	9
20	Points Purchase - 10,000 points	10000	2
21	Points Accrual - Credit Card Usage (500 points per $1,000 spent)	500	1
22	Points Deduction - Round Trip Business Class Flight from San Francisco (SFO) to Sydney (SYD) on Qantas Airways (96,700 points)	-193400	3
23	Points Purchase - 5,000 points	5000	4
24	Points Deduction - 3 Nights in Skyline View Suite at Aria Resort and Casino Las Vegas (1,501 points per night)	-4503	1
25	Points Purchase - 7,500 points	7500	9
26	Points Purchase - 10,000 points	10000	5
27	Points Deduction - 5 Nights in Ocean View Room at Waldorf Astoria Los Cabos Pedregal (4,380 points per night)	-21900	6
28	Points Purchase - 5,000 points	5000	8
29	Points Deduction - KitchenAid Stand Mixer (450 points x 24 months)	-10800	3
30	Points Purchase - 10,000 points	10000	7
31	Points accrual for credit card usage	2500	2
32	Points accrual for answering survey	1000	5
33	Points deduction for Dyson V11 Absolute vacuum cleaner	55000	1
34	Points deduction for Apple iPhone 13 Pro Max	80000	7
35	Points purchase - 10,000 points	-10000	3
36	Points purchase - 5,000 points	-5000	4
37	Points deduction for Bose QuietComfort Earbuds	35000	8
38	Points accrual for referring a friend	5000	6
39	Points deduction for KitchenAid Artisan Stand Mixer	45000	2
40	Points accrual for watching promotional video	2000	9
41	Points deduction for Sony BRAVIA XR OLED TV	120000	1
42	Points deduction for All-Clad Stainless Steel Cookware Set	90000	4
43	Points accrual for completing online course	15000	7
44	Points purchase - 15,000 points	-15000	5
45	Points deduction for Canon EOS R6 Mirrorless Camera	70000	3
46	Points deduction for LG OLED TV	100000	9
47	Points accrual for referring a friend	5000	1
48	Points deduction for Vitamix Ascent Series Blender	50000	6
49	Points accrual for credit card usage	3000	8
50	Points deduction for Samsung Galaxy Z Fold3	90000	2
51	Points accrual for answering survey	2000	4
52	Points deduction for Sony WH-1000XM4 headphones	30000	10
53	Points purchase - 20,000 points	-20000	1
54	Points deduction for iRobot Roomba i7+ robot vacuum	75000	3
55	Points accrual for watching promotional video	1500	7
56	Points deduction for KitchenAid Stand Mixer Pasta Attachment Set	25000	9
57	Points accrual for referring a friend	5000	2
58	Points deduction for Microsoft Surface Laptop 4	100000	5
59	Points accrual for answering survey	1000	8
60	Points deduction for Weber Genesis II S-435 Gas Grill	80000	4
61	Points purchase - 5,000 points	-5000	10
62	Points deduction for Sennheiser HD 660 S headphones	45000	6
63	Points accrual for completing online course	12000	1
64	Points deduction for Samsung 4-Door Flex Refrigerator	110000	7
65	Points accrual for referring a friend	5000	3
66	Points deduction for Breville Barista Express Espresso Machine	60000	2
67	Points accrual for credit card usage	5000	9
68	Points deduction for LG CX OLED TV	120000	5
69	Points purchase - 30,000 points	-30000	8
70	Points deduction for Bose SoundTouch 300 Soundbar	50000	10
71	Points accrual for watching promotional video	3000	4
72	Points Purchase	5000	3
73	Points Purchase	10000	7
74	Points Purchase	2500	1
75	Points Purchase	7500	2
76	Points Purchase	5000	5
77	Points Deduction: Set of 3 mixing bowls	-8000	8
78	Points Deduction: Dyson vacuum cleaner	-12000	4
79	Points Deduction: Google Pixel 6 Pro	-17000	2
80	Points Deduction: Bose QuietComfort 35 II headphones	-9000	10
81	Points Deduction: Philips Sonicare toothbrush	-5000	1
82	Points Deduction: KitchenAid Artisan Stand Mixer	-15000	9
83	Points Purchase	15000	6
84	Points Purchase	1000	8
85	Points Purchase	5000	7
86	Points Deduction: Cuisinart Coffee Maker	-6000	2
87	Points Deduction: Apple Watch Series 7	-12000	6
88	Points Deduction: Sony Alpha a7 III camera	-20000	3
89	Points Deduction: Vitamix Blender	-15000	4
90	Points Deduction: Bose SoundLink Revolve speaker	-8000	5
91	Points Purchase	5000	1
92	Points Purchase	1000	2
93	Points Purchase	15000	3
94	Points Purchase	2500	5
95	Points Purchase	5000	6
96	Points Deduction: iRobot Roomba Vacuum Cleaner	-11000	9
97	Points Deduction: Samsung Galaxy Z Flip3	-18000	10
98	Points Deduction: Dyson Airwrap Hair Styler	-14000	1
99	Points Deduction: Nintendo Switch OLED Model	-10000	4
100	Points Deduction: Tumi luggage set	-20000	8
101	Points Purchase	5000	7
102	Points Purchase	1000	10
103	Points Purchase	7500	9
104	Points Deduction: Peloton Bike	-30000	2
105	Points Deduction: Apple MacBook Air	-18000	3
106	Points Deduction: GoPro HERO10 Black	-12000	5
107	Points Deduction: Patagonia Nano Puff Jacket	-5000	6
108	Points Deduction: Canon EOS R5 camera	-25000	1
109	Points Purchase	15000	4
110	Points Purchase	5000	8
111	Points Purchase	2500	9
112	Points Deduction: Bose QuietComfort Earbuds	-10000	10
113	Points Deduction: Philips Air Fryer	-8000	7
114	Points Deduction: iPhone 13 Pro Max	-20000	6
115	Points Deduction: Ray-Ban sunglasses	-5000	2
116	Points Deduction: Le Creuset Dutch Oven	-12000	3
117	Points Purchase	1000	1
118	Points Purchase	5000	2
119	Points Purchase	15000	3
120	Points Deduction: Sonos Beam soundbar	-140	3
\.


--
-- Name: points_catalogue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.points_catalogue_id_seq', 37, true);


--
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.points_id_seq', 10, true);


--
-- Name: points_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.points_purchases_id_seq', 120, true);


--
-- Name: points_catalogue points_catalogue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points_catalogue
    ADD CONSTRAINT points_catalogue_pkey PRIMARY KEY (id);


--
-- Name: points points_customerId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points
    ADD CONSTRAINT "points_customerId_key" UNIQUE ("customerId");


--
-- Name: points points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: points_purchases points_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points_purchases
    ADD CONSTRAINT points_purchases_pkey PRIMARY KEY (id);


--
-- Name: points_purchases points_purchases_points_account_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.points_purchases
    ADD CONSTRAINT points_purchases_points_account_fkey FOREIGN KEY (points_account) REFERENCES public.points(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

