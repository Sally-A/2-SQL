--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    car_id integer NOT NULL,
    currentlocation_id character varying(3) NOT NULL,
    type_id character varying(4) NOT NULL,
    color character varying(45) NOT NULL,
    brand character varying(45) NOT NULL,
    model character varying(45) NOT NULL,
    description character varying(45) DEFAULT NULL::character varying,
    purch_date date NOT NULL
);


ALTER TABLE public.car OWNER TO postgres;

--
-- Name: car_car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_car_id_seq OWNER TO postgres;

--
-- Name: car_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_car_id_seq OWNED BY public.car.car_id;


--
-- Name: car_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_type (
    type_id character varying(4) NOT NULL,
    type_label character varying(45) NOT NULL,
    type_descr character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.car_type OWNER TO postgres;

--
-- Name: crc_office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crc_office (
    location_id character varying(3) NOT NULL,
    crc_addr character varying(45) NOT NULL,
    crc_city character varying(45) NOT NULL,
    crc_state character varying(45) NOT NULL,
    crc_country character varying(45) NOT NULL,
    default_tel bigint NOT NULL
);


ALTER TABLE public.crc_office OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    custormer_id integer NOT NULL,
    ssn integer NOT NULL,
    driver_license character varying(25) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    cust_addr character varying(45) NOT NULL,
    cust_city character varying(45) NOT NULL,
    cust_state character varying(45) NOT NULL,
    country character varying(45) NOT NULL,
    phone character varying(45) NOT NULL,
    email character varying(45)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_custormer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_custormer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_custormer_id_seq OWNER TO postgres;

--
-- Name: customers_custormer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_custormer_id_seq OWNED BY public.customers.custormer_id;


--
-- Name: office_tel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office_tel (
    default_tel bigint NOT NULL,
    tel1 bigint,
    tel2 bigint,
    tel3 bigint
);


ALTER TABLE public.office_tel OWNER TO postgres;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    reservation_id integer NOT NULL,
    amount double precision NOT NULL,
    pickup_date date NOT NULL,
    return_date date NOT NULL,
    pickuplocation_id character varying(3) NOT NULL,
    returnlocation_id character varying(3) NOT NULL,
    custormer_id integer NOT NULL,
    car_id integer NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_reservation_id_seq OWNER TO postgres;

--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_reservation_id_seq OWNED BY public.reservation.reservation_id;


--
-- Name: car car_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car ALTER COLUMN car_id SET DEFAULT nextval('public.car_car_id_seq'::regclass);


--
-- Name: customers custormer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN custormer_id SET DEFAULT nextval('public.customers_custormer_id_seq'::regclass);


--
-- Name: reservation reservation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN reservation_id SET DEFAULT nextval('public.reservation_reservation_id_seq'::regclass);


--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car (car_id, currentlocation_id, type_id, color, brand, model, description, purch_date) FROM stdin;
1	AKR	SUBC	red	Ford	Taurus	new	2021-08-01
2	CLE	COMP	blue	Chevy	Equinox	new	2021-06-05
3	PIT	FULL	black	Chevy	Lumina	new	2021-04-22
\.


--
-- Data for Name: car_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_type (type_id, type_label, type_descr) FROM stdin;
SUBC	Subcompact	
COMP	Compact	
FULL	Full Size	
\.


--
-- Data for Name: crc_office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crc_office (location_id, crc_addr, crc_city, crc_state, crc_country, default_tel) FROM stdin;
CLE	100 Rental Lane	Cleveland	OH	USA	1112220000
AKR	200 Rental Lane	Akron	OH	USA	2222220000
PIT	300 Rental Lane	Pittsburgh	PA	USA	3332220000
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (custormer_id, ssn, driver_license, first_name, last_name, cust_addr, cust_city, cust_state, country, phone, email) FROM stdin;
1	111223333	RT12-36D	Bill	Smith	111 No Where Lane	Salem	OH	USA	111-222-3333	bill.smith@gmail.com
2	123456789	RT12-345G	Jane	Doe	555 Some Where Lane	Cleveland	OH	USA	222-222-2222	jane.doe@gmail.com
3	987654321	AA54-555S	John	Johnson	123 Main Street	Pittsburgh	PA	USA	333-333-3333	john.johnson@gmail.com
\.


--
-- Data for Name: office_tel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office_tel (default_tel, tel1, tel2, tel3) FROM stdin;
1112220000	1112220001	1112220002	1112220003
2222220000	2222220001	2222220002	2222220003
3332220000	3332220001	3332220002	3332220003
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (reservation_id, amount, pickup_date, return_date, pickuplocation_id, returnlocation_id, custormer_id, car_id) FROM stdin;
1	150.86	2021-08-24	2021-08-28	AKR	AKR	1	1
2	250.86	2021-09-10	2021-09-22	CLE	CLE	2	2
3	350.86	2021-09-12	2021-09-18	PIT	PIT	3	3
\.


--
-- Name: car_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_car_id_seq', 3, true);


--
-- Name: customers_custormer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_custormer_id_seq', 3, true);


--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_reservation_id_seq', 3, true);


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (car_id);


--
-- Name: car_type car_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_type
    ADD CONSTRAINT car_type_pkey PRIMARY KEY (type_id);


--
-- Name: crc_office crc_office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crc_office
    ADD CONSTRAINT crc_office_pkey PRIMARY KEY (location_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (custormer_id);


--
-- Name: office_tel office_tel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_tel
    ADD CONSTRAINT office_tel_pkey PRIMARY KEY (default_tel);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id);


--
-- Name: car car_currentlocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_currentlocation_id_fkey FOREIGN KEY (currentlocation_id) REFERENCES public.crc_office(location_id);


--
-- Name: car car_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.car_type(type_id);


--
-- Name: crc_office crc_office_default_tel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crc_office
    ADD CONSTRAINT crc_office_default_tel_fkey FOREIGN KEY (default_tel) REFERENCES public.office_tel(default_tel);


--
-- Name: reservation reservation_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(car_id);


--
-- Name: reservation reservation_custormer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_custormer_id_fkey FOREIGN KEY (custormer_id) REFERENCES public.customers(custormer_id);


--
-- Name: reservation reservation_pickuplocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pickuplocation_id_fkey FOREIGN KEY (pickuplocation_id) REFERENCES public.crc_office(location_id);


--
-- PostgreSQL database dump complete
--

