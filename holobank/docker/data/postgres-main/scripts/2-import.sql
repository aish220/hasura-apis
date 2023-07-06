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

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_cards (
    id integer NOT NULL,
    expiry date NOT NULL,
    "CVV" integer NOT NULL,
    "accountId" integer NOT NULL,
    balance numeric DEFAULT '0'::numeric NOT NULL,
    number_enc text NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.credit_cards OWNER TO postgres;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_cards_id_seq OWNER TO postgres;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: transaction_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_category (
    id integer NOT NULL,
    name text NOT NULL,
    icon text NOT NULL
);


ALTER TABLE public.transaction_category OWNER TO postgres;

--
-- Name: transaction_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_category_id_seq OWNER TO postgres;

--
-- Name: transaction_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_category_id_seq OWNED BY public.transaction_category.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    "from" text,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    amount numeric NOT NULL,
    account_id_from integer,
    account_id_to integer NOT NULL,
    receipt_id uuid DEFAULT gen_random_uuid() NOT NULL,
    transaction_category integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- Name: user_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accounts_id_seq OWNER TO postgres;

--
-- Name: user_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_accounts_id_seq OWNED BY public.user_accounts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    tfn integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: transaction_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_category ALTER COLUMN id SET DEFAULT nextval('public.transaction_category_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: user_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts ALTER COLUMN id SET DEFAULT nextval('public.user_accounts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, name) FROM stdin;
5	Abbie Current
6	Abbie Savings
8	Youth saver
9	Zach & Sian
10	Sian secret acc
11	Sian current
12	Zach's current account
13	Current account
1	Current Account
2	Checking Account
3	Rory & Virginia
4	Savings
7	Junior Saver
\.


--
-- Data for Name: credit_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_cards (id, expiry, "CVV", "accountId", balance, number_enc, "userId") FROM stdin;
4	2025-01-11	679	5	8768.5500	\\xc30d0407030281957319dd8229ec73d24101cdf2f8f2e5255e2893a13d489d4bc57e9f38808f97afc806955a92137eae809fc1e24177cad0090f53900552f76cbd1927bdeee6247f5f4203ddf9738f08fb22	7
6	2023-12-09	167	9	73.5500	\\xc30d04070302ec31cdce13a10eb179d241016b2efbe6d7bd295265852055c3b024baea36ff7e8d60169b2d0660d1d4faf96c67284282ce34aded8903f3ca703a1f9265d7dc6f2aa6bc90d8dc351992fb95f5	7
5	2023-10-29	457	5	3002	\\xc30d04070302177903e528a4d71269d241013a6d622df87d64753382487bdff3d12b26f9a796dfc2e0dca1627c930cc18a5eafc020566104492c2ea8be02ac2ad6f2ce0321d33c3882861676e2ed39d974e2	7
2	2024-08-26	142	2	1651.1200	\\xc30d040703025414805afba26c0f7ed2410110e067df897980e515bfd6318a618069fc6b5dd38cea5ce628c0dcd12e558ed7f38654b02d4490eeb6907e335215532ac84c67fc1d4d58b7fca1b3e6e27d57af	3
3	2024-07-19	372	3	599.7800	\\xc30d04070302896c1e0bec543eeb77d241017decf56a9bdc7b0ee23def1fba6cb0c8c11e250ad2c9d5d4448b8470608059f7ac8ee4faf4c2c3183c46b437febb13081d6551f255ea9c091a8f5a06609ad1fe	3
\.


--
-- Data for Name: transaction_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_category (id, name, icon) FROM stdin;
2	Cash	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /> </svg>
3	Entertainment	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 010 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 010-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375z" /> </svg>
4	Home	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" /> </svg>
5	Shopping	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" /> </svg>
6	Groceries	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" /> </svg>
7	Travel	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" /> </svg>
8	Utilities	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M12 18v-5.25m0 0a6.01 6.01 0 001.5-.189m-1.5.189a6.01 6.01 0 01-1.5-.189m3.75 7.478a12.06 12.06 0 01-4.5 0m3.75 2.383a14.406 14.406 0 01-3 0M14.25 18v-.192c0-.983.658-1.823 1.508-2.316a7.5 7.5 0 10-7.517 0c.85.493 1.509 1.333 1.509 2.316V18" /> </svg>
9	Health	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" /> </svg>
10	Credit card	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z" /> </svg>
1	Uncategorised	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z" /> </svg>
11	Transfers	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 21L3 16.5m0 0L7.5 12M3 16.5h13.5m0-13.5L21 7.5m0 0L16.5 12M21 7.5H7.5" /> </svg>
12	Income	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /> </svg>
13	Eating out	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">   <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" /> </svg>
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, "from", description, created_at, amount, account_id_from, account_id_to, receipt_id, transaction_category) FROM stdin;
1	Commonwealth Bank	Account Creation	2023-03-16 08:06:56.593372+00	85005.1200	\N	1	994d9530-e42b-453e-8d62-212df68024e4	1
2	Commonwealth Bank	Account Creation	2023-03-16 08:14:07.564917+00	25010	\N	11	939c601e-23fd-49f2-9b03-94a881407bc2	1
5	Commonwealth Bank	Account Creation	2023-03-16 08:22:58.650881+00	45010.8900	\N	11	2f053451-ef0f-4da0-9248-8f7d8d4a2d56	1
6	Commonwealth Bank	Account Creation	2023-03-16 08:24:21.370437+00	9878.1200	\N	12	44fe760d-7b49-4434-828e-0e41ae3b823c	1
7	Ernst & Young	Salary	2023-03-16 08:25:46.287046+00	14668.2100	\N	11	5807e9b4-296f-412a-926a-67da105a50b2	1
8	Melbourne City Council	Pay	2023-03-16 08:26:19.937322+00	2188.8700	\N	12	93394190-64cb-4238-bb51-579bad442e91	1
9		Mortgage (Zach)	2023-03-16 08:26:39.094779+00	2000	12	9	8010dce6-411c-46be-96df-904ef43d1081	1
10		Mortgage (Sian)	2023-03-16 08:26:52.201858+00	2000	11	9	e6b0bc5f-a381-46e8-89ca-904e36c0d519	1
11		Savings	2023-03-16 08:27:23.284801+00	8000	11	10	3b3c85c0-53dc-4523-b023-4446136d0041	1
14	IGA Finance	Pay-SYD-2000	2023-03-16 08:29:58.353123+00	4589.1200	\N	5	2cb2c05d-df2a-4aef-ba79-2ada53369e73	1
15	\N	Dinner	2023-03-16 08:30:39.953818+00	120	1	5	4a1bc281-cda5-482f-90f6-6a6910fed21e	1
47	\N	Expenses (nsw.gov.au)	2023-03-27 08:59:01.152745+00	109.4200	\N	2	066b5c22-a0c0-4d74-9ccd-066059b9fc7c	1
13	BOC-FINANCE-SAL	Expenses-2023-02	2023-02-16 08:29:14.945476+00	1020	\N	13	186c2b1c-d683-43e6-9be8-833195793e62	1
16	\N	Pocket money (mum)	2023-03-16 08:31:02.855794+00	20	13	7	4ffbaa07-a4f8-4d42-ae12-922bc3f2b8d1	1
44	\N	Expenses (nsw.gov.au)	2023-02-27 08:58:36.475202+00	13.9700	\N	2	4f4da009-c46f-42eb-80d1-8f45c476a098	1
45	\N	Expenses (nsw.gov.au)	2023-01-27 08:58:43.164712+00	42.1200	\N	2	9dac966f-4f3a-4d87-b9be-181e9612b4dc	1
46	\N	Expenses (nsw.gov.au)	2022-12-27 08:58:52.191415+00	8.0100	\N	2	819bf7aa-26f0-4571-9b43-9c89409431a1	1
12	BOC-FINANCE-SAL	Salary-2023-02	2023-02-16 08:29:02.693634+00	5881.1900	\N	13	5ff4ee42-bcc6-4df6-ae4b-87da52796f22	1
37	BOC-FINANCE-SAL	Expenses-2023-01	2023-01-16 08:29:14.945476+00	1020	\N	13	5cf9930e-1c52-42a8-90c3-7b3be542090d	1
35	BOC-FINANCE-SAL	Expenses-2022-10	2022-10-16 08:29:14.945476+00	1020	\N	13	bacb329e-8206-4c21-8f22-1e889c0f001f	1
34	BOC-FINANCE-SAL	Expenses-2022-11	2022-11-16 08:29:14.945476+00	1020	\N	13	31180d16-d704-47a2-b378-1c7343e35185	1
31	BOC-FINANCE-SAL	Salary-2023-03	2023-03-16 08:29:02.693634+00	5881.1900	\N	13	739115d3-eb70-489f-960b-627e52cad8cc	1
30	BOC-FINANCE-SAL	Salary-2022-11	2022-11-16 08:29:02.693634+00	5881.1900	\N	13	de59b269-1fab-4408-b761-c751aded2db6	1
33	BOC-FINANCE-SAL	Expenses-2023-03	2023-03-16 08:29:14.945476+00	1020	\N	13	6048e036-9516-47de-970c-fc2da35a7679	1
29	BOC-FINANCE-SAL	Salary-2022-10	2022-10-16 08:29:02.693634+00	5881.1900	\N	13	0e6e78dc-eb80-42e6-97fb-43e2a36b49ff	1
32	BOC-FINANCE-SAL	Salary-2022-12	2022-12-16 08:29:02.693634+00	5881.1900	\N	13	8f991209-6356-4b07-8b6a-f0d009ed22ca	1
55	\N	savings top up	2023-03-28 09:00:27.801013+00	2250	2	4	cd4647f6-a076-489e-be4f-9c3f9226c1fb	11
52	\N	Mortgage	2022-11-28 08:59:56.893+00	1500	2	3	ca6c6908-5b01-47c9-8c18-1a3e11dbadd8	4
53	\N	Mortgage	2022-10-28 08:59:58.279259+00	1500	2	3	679a2fc2-2371-42a3-81fb-9cda35538b2e	4
60	\N	Airbnb (wine tour)	2023-03-17 09:01:05.109+00	225	2	1	cb79774d-4942-4376-8d0d-baa9b631bc45	7
74	\N	Transport NSW	2023-03-13 09:44:34.839741+00	1	2	1	136034ba-e54b-4a27-98df-174c65ced387	7
61	\N	Flights	2023-03-17 09:01:05.109+00	890	2	1	dde1156e-47f7-42ad-9199-ae1763c9eb11	7
48	\N	Mortgage	2023-03-28 08:59:47.306332+00	1500	2	3	019b785b-d6dc-4ab4-bc56-354071a411fd	4
3		Moving to savings	2023-03-16 08:14:35.650888+00	2500	2	4	cd215123-8d82-40c6-ba7a-2f6179c715a7	11
50	\N	Mortgage	2023-01-28 08:59:51.951881+00	1500	2	3	7c8fbbd5-a237-4333-9a4f-b20373d843b7	4
19		Sara pocket money	2022-11-16 08:15:19.734347+00	10	2	7	f758ec19-5c9c-4e83-b407-586284f9ae74	11
20		Sara pocket money	2022-10-16 08:15:19.734347+00	10	2	7	de38095c-3484-4daf-bbb7-54c01347e70a	11
18		Sara pocket money	2022-12-16 08:15:19.734347+00	10	2	7	1941ba77-157b-4c52-b6bd-3207c31c4a0e	11
21		Sara pocket money	2023-03-16 08:15:19.734347+00	10	2	7	ca889310-8ef2-407b-a971-0ec5062f617c	11
49	\N	Mortgage	2023-02-28 08:59:50.679164+00	1500	2	3	dd721082-d419-4be5-b395-c3211204a2b2	4
64	\N	Spotify	2023-02-28 09:44:34.839741+00	11.9900	2	1	7824c5af-8bd5-4987-8ddc-5ac0464f8980	3
51	\N	Mortgage	2022-12-28 08:59:53.688556+00	1500	2	3	8cb4c620-c4d7-406e-a32b-5b1031fb6684	4
56	\N	savings top up	2022-12-28 09:00:34.832034+00	400	2	4	f6d04aa6-e878-4576-b4bd-08d1f46f3297	11
59	\N	Congratulations to you both <3	2023-02-17 09:01:05.109+00	500	2	1	d588a3fd-d5dc-4e3d-a9f9-c183b5265712	2
62	\N	Visa credit card	2022-12-17 09:41:45.239+00	1200	2	1	65da34f4-54c2-41c5-8a91-47504f47be98	10
65	\N	Spotify	2023-01-28 09:44:34.839741+00	11.9900	2	1	3aa8c1dd-b29d-41c8-b14a-ce702f0fa6e6	3
66	\N	Spotify	2022-12-28 09:44:34.839741+00	11.9900	2	1	da169b3a-6891-4149-9bd7-eb32c8ec97d1	3
67	\N	Spotify	2022-11-28 09:44:34.839741+00	11.9900	2	1	b31b49b9-cecf-4582-b170-595dd22ab705	3
68	\N	Energy Australia (gas)	2023-01-07 09:44:34.839741+00	346.2700	2	1	8f58ae74-92aa-4f92-89c0-f4085ef9be0a	8
69	\N	Energy Australia (electricity)	2023-01-07 09:44:34.839741+00	612.0900	2	1	caac4ca3-e889-4eff-b64e-efda175491ec	8
70	\N	Tempo Cafe	2023-01-12 09:44:34.839741+00	26.4500	2	1	63611763-b4f5-49a4-bc6d-c583740a8b89	13
71	\N	Light Brigade Hotel	2023-03-12 09:44:34.839741+00	48.9900	2	1	3f32a582-ca8b-4327-9de7-fab66799f521	3
72	\N	Light Brigade Hotel	2023-03-12 09:44:34.839741+00	20.2000	2	1	0b08f17c-8502-4851-8d1a-9ff80b7c067c	3
73	\N	Light Brigade Hotel	2023-03-12 09:44:34.839741+00	14.1400	2	1	23f0001c-b5fc-478c-8397-8cf431211605	3
75	\N	IGA North Sydney	2023-03-14 09:44:34.839741+00	31.1900	2	1	92a51338-5be1-4736-b8eb-1bfbb28e991f	6
76	\N	Ginny's Canoe Club	2023-03-15 09:44:34.839741+00	46.8000	2	1	50324df4-8f17-4db3-bc20-041722afd793	3
77	\N	City Recital Hall	2023-03-15 09:44:34.839741+00	25	2	1	60f756de-d5c5-4b0e-9439-123a391c96a6	3
78	\N	Red Bird Chinese	2023-03-16 09:44:34.839741+00	207.0500	2	1	4ed9dd76-e8b9-4637-939a-6db24f3775f7	13
79	\N	Will & Co on George	2023-03-17 09:44:34.839741+00	10	2	1	fadde362-0b56-48d4-8124-ea6f6b8edee7	13
80	\N	Woolworths Australia	2023-03-18 09:44:34.839741+00	187.9200	2	1	915c8c51-6ae9-46cc-8905-9d8af8ed5a98	6
81	\N	Aussie Broadband	2023-03-19 09:44:34.839741+00	79	2	1	71202d6c-1996-456a-a853-26d7f43e8c69	8
82	\N	Sydney Opera House	2023-03-20 09:44:34.839741+00	298.5000	2	1	fb8312e7-1713-4288-827a-ef22b1e1d46a	3
22		Sara pocket money	2023-02-16 08:15:19.734347+00	10	2	7	ee7c846b-bdca-4442-8a3c-87046842408b	11
17	Martin Friedmann	Friday Night	2023-03-16 08:32:41.180297+00	300	\N	2	1970c0b6-62d2-4faa-9143-72ef10ff11fa	2
38	FINANCE-NSWGOV-SALARY	NSW Government Salary	2023-02-27 08:20:44.786251+00	4287	\N	2	6a83dd4e-61bb-4bb6-bc34-57834c8a8531	12
40	FINANCE-NSWGOV-SALARY	NSW Government Salary	2023-01-27 08:20:47.252213+00	4287	\N	2	0950efee-d160-4398-9220-391feb03d74d	12
42	FINANCE-NSWGOV-SALARY	NSW Government Salary	2022-11-27 08:20:49.099447+00	4287	\N	2	3d18d43a-9235-4db3-86bd-d5e826ba7c62	12
41	FINANCE-NSWGOV-SALARY	NSW Government Salary	2022-12-27 08:20:48.202517+00	4287	\N	2	54fa0262-93aa-41bd-bb0a-f68d56407909	12
43	FINANCE-NSWGOV-SALARY	NSW Government Salary	2022-10-27 08:20:50.029026+00	4287	\N	2	6c9db232-ec9f-4318-a524-74ec6f50671a	12
58	\N	Moving money for credit card	2022-12-17 09:01:17.271332+00	1200	3	2	731d7a32-cb6c-4654-b23b-0d9e84dcc597	11
84	\N	Suze and Jez tix	2023-03-21 09:44:34.839741+00	119.4000	1	2	7a62b07c-6413-42b5-b54a-b2626eb90e65	2
36	BOC-FINANCE-SAL	Expenses-2022-12	2022-12-16 08:29:14.945476+00	1020	\N	13	12aeb555-65c4-461e-a7c0-cf28b718b2a5	1
28	BOC-FINANCE-SAL	Salary-2023-01	2023-01-16 08:29:02.693634+00	5881.1900	\N	13	330264da-1d5a-4c1e-b857-3a7a38aeaf58	1
23	\N	Pocket money (mum)	2023-01-16 08:31:02.855794+00	20	13	7	15839ce2-b945-4648-806f-1801fead1587	1
24	\N	Pocket money (mum)	2023-02-16 08:31:02.855794+00	20	13	7	9e454252-3cae-4e47-8da6-c6db18ae0f5b	1
25	\N	Pocket money (mum)	2022-12-16 08:31:02.855794+00	20	13	7	7bb2288c-075e-4335-880f-e664a39106ae	1
26	\N	Pocket money (mum)	2022-11-16 08:31:02.855794+00	20	13	7	d3a1eb47-bd90-4f6b-8684-6ebf78558ac4	1
27	\N	Pocket money (mum)	2022-10-16 08:31:02.855794+00	20	13	7	da2a6b9b-888b-4830-9339-7bd4ea146699	1
90	\N	DirectDebit-CBA-Mortgage	2023-03-27 10:31:07.365288+00	3412.1300	3	1	768d3f04-6f15-4c13-91b7-b25c2eb18298	1
91	\N	DirectDebit-CBA-Mortgage	2023-02-27 10:31:07.366+00	3412.1300	3	1	065a37e7-109c-4b08-8a94-0382a742b3ef	1
92	\N	DirectDebit-CBA-Mortgage	2023-01-27 10:31:07.366+00	3312.1300	3	1	a065b996-e835-4057-892a-11fc560a3553	1
93	\N	DirectDebit-CBA-Mortgage	2022-12-27 10:31:07.366+00	3210.1300	3	1	46209097-a8e0-411b-9303-e17cee2daf2b	1
94	\N	DirectDebit-CBA-Mortgage	2022-12-27 10:31:07.366+00	2840.1900	3	1	076f620c-35ab-4772-8216-9f6ebe7afe85	1
95	\N	Mortgage (Ginny)	2022-10-21 10:31:07.366+00	4000	13	3	8e7f9b70-fd10-47fb-baf6-f0039747e1b5	1
96	\N	Mortgage (Ginny)	2022-11-21 10:31:07.366+00	4000	13	3	931111af-e347-4c9d-a3d0-92a9f1594dff	1
97	\N	Mortgage (Ginny)	2022-12-21 10:31:07.366+00	4100	13	3	c8da6f18-006b-4385-8dfd-cb838b63d90b	1
98	\N	Mortgage (Ginny)	2023-01-21 10:31:07.366+00	4100	13	3	5658cafb-d93e-4154-a6df-0a0b858bcc0c	1
99	\N	Mortgage (Ginny)	2023-02-21 10:31:07.366+00	4100	13	3	49a0d128-c53a-4ef3-a768-bc89e33f9fd0	1
100	\N	Mortgage (Ginny)	2023-03-21 10:31:07.366+00	4200	13	3	a877c641-0924-4e20-8e1b-b942e7760016	1
101	\N	Ginny credit card	2023-02-25 10:31:07.366+00	3512	3	1	87df95ff-3f15-4ba6-80e1-350a120c73db	1
102	\N	Ginny credit card	2023-01-25 10:31:07.366+00	2819	3	1	93b0e6e0-1acb-4f99-8aba-624df939f7f1	1
103	\N	Ginny credit card	2022-12-25 10:31:07.366+00	1616	3	1	83c6a934-0c70-4f3b-bfe8-560ddd98f378	1
104	\N	LEGO.com inc.	2022-12-28 10:31:07.366+00	265	7	1	e1e46417-c272-42a7-9d17-30540ab776e0	1
105	Grandma Watson	Happy Christmas from grandma	2022-12-25 10:31:07.366+00	50	\N	7	5f6082c6-b276-4422-af31-b3268ec44cea	1
106	Peter Jones	Merry xmas from Uncle Peter	2022-12-25 10:31:07.366+00	100	\N	7	8fcbcd8b-2296-4c15-866d-dcbe726ef867	1
107	Elodie Smythe	Happy xmas Auntie Elodie	2022-12-25 10:31:07.366+00	60	\N	7	23d99a6d-abc6-4504-879d-7ed0fd1b8892	1
63	\N	Spotify	2023-03-28 09:44:34.839741+00	11.9900	2	1	6661ca34-d72b-4160-9170-97566a31f94f	3
57	\N	savings top up	2023-01-28 09:00:43.654481+00	800	2	4	26ccdb0c-a7cd-4d1c-a8c5-766c0a786457	11
4		Sara pocket money	2023-01-16 08:15:19.734347+00	10	2	7	e7ee4593-a8d1-4974-b756-c82f597fae6b	11
86	\N	Uber	2023-03-22 09:44:34.839741+00	19.8100	2	1	908f6bba-9dcd-40ba-a056-a48e3fe6765a	7
88	\N	Uber	2023-03-24 09:44:34.839741+00	47.6000	2	1	8f8c65ec-c363-4bf7-8031-91b52f652a84	7
89	\N	Vodafone	2023-03-25 09:44:34.839741+00	108	2	1	dfcf4827-456c-4b36-804b-d58bc1026fbb	8
54	\N	Making my savings sing!	2022-10-27 09:00:23.203252+00	1500	2	4	94b7d895-752a-43c3-8cff-804efa64f9ab	11
39	FINANCE-NSWGOV-SALARY	NSW Government Salary	2023-03-27 08:20:46.260236+00	4287	\N	2	9c0167de-2ac3-406e-b091-8641c955a33b	12
83	\N	Tickets - thanks mate	2023-03-21 09:44:34.839741+00	59.7000	1	2	8f478591-dbd7-4b97-98c7-500fb5d7a744	2
85	\N	opera house tix	2023-03-21 09:44:34.839741+00	59.7000	1	2	9655ece6-dfc2-410c-8b3a-0b33fdca8d20	2
87	\N	10 William St	2023-03-23 09:44:34.839741+00	204.2100	2	1	42ee27de-0dfd-4e5e-a235-9734cca2e160	13
\.


--
-- Data for Name: user_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accounts (id, user_id, account_id) FROM stdin;
1	3	3
2	5	3
3	2	1
4	3	2
5	3	4
6	7	5
7	7	6
8	8	7
9	5	7
10	3	7
11	9	8
12	6	8
13	10	9
14	11	9
15	11	10
16	11	11
17	10	12
18	5	13
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, tfn) FROM stdin;
2	Bernard Rojas	245343523
5	Virginia Reilly	612752232
4	Clarence Munoz	865414088
6	Seren Lara	656077298
7	Abbie Horne	243494429
8	Sara Pineda	946489031
9	Rico Wheeler	412042562
10	Zachary Mclaughlin	459599230
11	Sian Contreras	796801997
1	Emelia Chapman	953615761
3	Rory Hodge	996506823
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 13, true);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_cards_id_seq', 6, true);


--
-- Name: transaction_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_category_id_seq', 13, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 107, true);


--
-- Name: user_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_accounts_id_seq', 18, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: transaction_category transaction_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_category
    ADD CONSTRAINT transaction_category_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (id);


--
-- Name: user_accounts user_accounts_user_id_account_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_user_id_account_id_key UNIQUE (user_id, account_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_tvn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_tvn_key UNIQUE (tfn);


--
-- Name: credit_cards credit_cards_accountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT "credit_cards_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public.accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_account_id_from_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_from_fkey FOREIGN KEY (account_id_from) REFERENCES public.accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_account_id_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_to_fkey FOREIGN KEY (account_id_to) REFERENCES public.accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_transaction_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_transaction_category_fkey FOREIGN KEY (transaction_category) REFERENCES public.transaction_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_accounts user_accounts_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_accounts user_accounts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

