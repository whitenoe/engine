--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    gender boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id integer NOT NULL,
    price real,
    unit_id integer,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_id_seq OWNER TO postgres;

--
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(150) NOT NULL,
    is_active boolean NOT NULL,
    parent_id integer,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: propinsi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propinsi (
    equip_id integer NOT NULL,
    nama character varying(50) NOT NULL,
    parent_id character varying(50),
    create_date date,
    update_date date
);


ALTER TABLE public.propinsi OWNER TO postgres;

--
-- Name: propinsi_equip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propinsi_equip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propinsi_equip_id_seq OWNER TO postgres;

--
-- Name: propinsi_equip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propinsi_equip_id_seq OWNED BY public.propinsi.equip_id;


--
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit (
    id integer NOT NULL,
    parent_id integer,
    name character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_id_seq OWNER TO postgres;

--
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_id_seq OWNED BY public.unit.id;


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: propinsi equip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propinsi ALTER COLUMN equip_id SET DEFAULT nextval('public.propinsi_equip_id_seq'::regclass);


--
-- Name: unit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, gender, is_active, date_joined) FROM stdin;
1	123	\N	f	doni	Almadoni	Almadoni	almadoni@gmail.com	f	f	2019-02-24 08:21:47.751506+00
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, price, unit_id, create_date, update_date) FROM stdin;
100	35000	100	2019-02-24 22:53:28.350336+00	2019-02-24 22:53:28.350336+00
300	4000	200	2019-03-17 00:07:15.011781+00	2019-03-17 00:07:15.011781+00
301	4000	300	2019-03-17 00:11:40.74573+00	2019-03-17 00:11:40.74573+00
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, code, name, is_active, parent_id, create_date, update_date) FROM stdin;
100	SP000	Sepatu	f	\N	2019-02-24 22:30:45.938298+00	2019-02-24 22:30:45.938298+00
101	SP001	Carvil Hitam No 39	f	100	2019-02-24 22:32:00.663284+00	2019-02-24 22:32:00.663284+00
1003	SDL001	Sandal	f	100	2019-03-10 09:57:51.721838+00	2019-03-10 09:57:51.721838+00
102	SDL002	Sandal Carvil No 39	f	1003	2019-03-10 10:11:36.696031+00	2019-03-10 10:11:36.696031+00
103	SDL003	Sandal Carvil No 40	f	1003	2019-03-10 10:12:52.744725+00	2019-03-10 10:12:52.744725+00
104	SDL004	Sandal Kato	f	1003	2019-03-10 11:05:30.970704+00	2019-03-10 11:05:30.970704+00
105	SDL005	Sandal Pro Att No 30	f	1003	2019-03-10 11:07:37.955845+00	2019-03-10 11:07:37.955845+00
106	SDL006	Sandal Pro Att No 31	f	1003	2019-03-10 11:09:30.797657+00	2019-03-10 11:09:30.797657+00
107	SDL007	Sandal Kato No 30	f	1003	2019-03-10 11:14:47.74799+00	2019-03-10 11:14:47.74799+00
108	SDL100	Fito Merah	f	1003	2019-03-11 23:05:25.362485+00	2019-03-11 23:05:25.362485+00
109	SDL1001	Graludo Cewek	f	1003	2019-03-11 23:20:43.489625+00	2019-03-11 23:20:43.489625+00
201	SDL2001	Ardiles No 39	f	1003	2019-03-16 23:22:15.816133+00	2019-03-16 23:22:15.816133+00
202	SDL202	Pro Att 29	f	1003	2019-03-16 23:27:46.190305+00	2019-03-16 23:27:46.190305+00
203	SDL203	Finoti	f	1003	2019-03-16 23:34:06.3486+00	2019-03-16 23:34:06.3486+00
400	SDL400	Jepil Cewek No 39	t	1003	2019-03-17 00:11:40.741358+00	2019-03-17 00:11:40.741358+00
401	SDL401	Sualow	t	1003	2019-03-17 00:24:03.366839+00	2019-03-17 00:24:03.366839+00
402	SDL402	Appolo	t	1003	2019-03-17 00:31:28.797049+00	2019-03-17 00:31:28.797049+00
403	SDL403	Lompes	t	1003	2019-03-17 00:47:56.976177+00	2019-03-17 00:47:56.976177+00
\.


--
-- Data for Name: propinsi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propinsi (equip_id, nama, parent_id, create_date, update_date) FROM stdin;
1	DKI Jakarta	\N	\N	\N
2	Jawa Barat	\N	2019-02-22	2019-02-22
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit (id, parent_id, name, is_active, create_date, update_date, product_id) FROM stdin;
100	\N	PCS	t	2019-02-24 22:40:43.53913+00	2019-02-24 22:40:43.53913+00	101
200	\N	PCS	f	2019-03-16 23:34:33.234827+00	2019-03-16 23:34:33.234827+00	103
201	\N	PCS	f	2019-03-16 23:48:11.547408+00	2019-03-16 23:48:11.547408+00	109
300	\N	PCS	t	2019-03-17 00:11:40.744177+00	2019-03-17 00:11:40.744177+00	400
302	\N	PCS	t	2019-03-17 00:31:28.799847+00	2019-03-17 00:31:28.799847+00	402
303	\N	PCS	t	2019-03-17 00:47:56.978989+00	2019-03-17 00:47:56.978989+00	403
\.


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- Name: propinsi_equip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propinsi_equip_id_seq', 1, true);


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unit_id_seq', 1, false);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: product product_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_code_key UNIQUE (code);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: propinsi propinsi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propinsi
    ADD CONSTRAINT propinsi_pkey PRIMARY KEY (equip_id);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- Name: price price_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: product product_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.product(id);


--
-- Name: unit unit_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.unit(id);


--
-- Name: unit unit_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

