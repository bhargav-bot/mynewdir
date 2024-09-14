--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Postgres.app)
-- Dumped by pg_dump version 16.1

-- Started on 2024-09-08 12:27:05 EDT

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
-- TOC entry 2 (class 3079 OID 24830)
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16462)
-- Name: User12; Type: TABLE; Schema: public; Owner: bhargav
--
CREATE TABLE public."ya"(
    name character varying NOT NULL,
    user_id integer not NULL
);
CREATE TABLE public."User12" (
    name character varying NOT NULL,
    user_id integer NOT NULL,
    surname character varying NOT NULL
);


ALTER TABLE public."User12" OWNER TO bhargav;

--
-- TOC entry 222 (class 1259 OID 16461)
-- Name: User12_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bhargav
--

CREATE SEQUENCE public."User12_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User12_user_id_seq" OWNER TO bhargav;

--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 222
-- Name: User12_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhargav
--

ALTER SEQUENCE public."User12_user_id_seq" OWNED BY public."User12".user_id;


--
-- TOC entry 217 (class 1259 OID 16392)
-- Name: bhargav; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bhargav (
    name character varying NOT NULL,
    price integer NOT NULL,
    id integer NOT NULL,
    onsale boolean DEFAULT true NOT NULL,
    inventory integer NOT NULL,
    time_stamp timestamp with time zone DEFAULT now() NOT NULL
);




--
-- TOC entry 216 (class 1259 OID 16391)
-- Name: bhargav_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bhargav_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 216
-- Name: bhargav_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bhargav_id_seq OWNED BY public.bhargav.id;


--
-- TOC entry 228 (class 1259 OID 25000)
-- Name: emp; Type: TABLE; Schema: public; Owner: bhargav
--

CREATE TABLE public.emp(
    name character varying,
    experience integer,
    unique_id uuid NOT NULL,
    empuni_id uuid NOT NULL
);


ALTER TABLE public.emp OWNER TO bhargav;

--
-- TOC entry 227 (class 1259 OID 24993)
-- Name: employee; Type: TABLE; Schema: public; Owner: bhargav
--

CREATE TABLE public.employee (
    name character varying,
    salary integer,
    unique_id uuid NOT NULL
);


ALTER TABLE public.employee OWNER TO bhargav;

--
-- TOC entry 226 (class 1259 OID 24819)
-- Name: inrelationwithschedule; Type: TABLE; Schema: public; Owner: bhargav
--

CREATE TABLE public.inrelationwithschedule (
    user_id integer NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.inrelationwithschedule OWNER TO bhargav;

--
-- TOC entry 225 (class 1259 OID 24818)
-- Name: inrelationwithschedule_age_seq; Type: SEQUENCE; Schema: public; Owner: bhargav
--

CREATE SEQUENCE public.inrelationwithschedule_age_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inrelationwithschedule_age_seq OWNER TO bhargav;

--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 225
-- Name: inrelationwithschedule_age_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhargav
--

ALTER SEQUENCE public.inrelationwithschedule_age_seq OWNED BY public.inrelationwithschedule.age;


--
-- TOC entry 219 (class 1259 OID 16403)
-- Name: jogi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogi (
    name character varying NOT NULL,
    age integer NOT NULL,
    job character varying NOT NULL,
    id integer NOT NULL
);




--
-- TOC entry 218 (class 1259 OID 16402)
-- Name: jogi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jogi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 218
-- Name: jogi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jogi_id_seq OWNED BY public.jogi.id;


--
-- TOC entry 224 (class 1259 OID 24805)
-- Name: schedule; Type: TABLE; Schema: public; Owner: bhargav
--

CREATE TABLE public.schedule (
    name character varying,
    id integer NOT NULL,
    country character varying,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL,
    gender character varying DEFAULT 'male'::character varying,
    unique_value uuid,
    CONSTRAINT gender_option CHECK (((gender)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying])::text[])))
);


ALTER TABLE public.schedule OWNER TO bhargav;

--
-- TOC entry 221 (class 1259 OID 16412)
-- Name: whatever; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.whatever (
    name character varying NOT NULL,
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
CREATE TABLE public.bbb (

    id integer NOT NULL
   
);





--
-- TOC entry 220 (class 1259 OID 16411)
-- Name: whatever_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--



--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 220
-- Name: whatever_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--



--
-- TOC entry 3551 (class 2604 OID 16465)
-- Name: User12 user_id; Type: DEFAULT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public."User12" ALTER COLUMN user_id SET DEFAULT nextval('public."User12_user_id_seq"'::regclass);


--
-- TOC entry 3546 (class 2604 OID 16395)
-- Name: bhargav id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bhargav ALTER COLUMN id SET DEFAULT nextval('public.bhargav_id_seq'::regclass);


--
-- TOC entry 3554 (class 2604 OID 24822)
-- Name: inrelationwithschedule age; Type: DEFAULT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.inrelationwithschedule ALTER COLUMN age SET DEFAULT nextval('public.inrelationwithschedule_age_seq'::regclass);


--
-- TOC entry 3549 (class 2604 OID 16406)
-- Name: jogi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogi ALTER COLUMN id SET DEFAULT nextval('public.jogi_id_seq'::regclass);


--
-- TOC entry 3550 (class 2604 OID 16415)
-- Name: whatever id; Type: DEFAULT; Schema: public; Owner: postgres
--




--
-- TOC entry 3726 (class 0 OID 16462)
-- Dependencies: 223
-- Data for Name: User12; Type: TABLE DATA; Schema: public; Owner: bhargav
--

COPY public."User12" (name, user_id, surname) FROM stdin;
rthhe	242	sggerh
\.


--
-- TOC entry 3720 (class 0 OID 16392)
-- Dependencies: 217
-- Data for Name: bhargav; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bhargav (name, price, id, onsale, inventory, time_stamp) FROM stdin;
SDG	33	2	t	33	2024-09-08 12:20:42.429263-04
\.


--
-- TOC entry 3731 (class 0 OID 25000)
-- Dependencies: 228
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: bhargav
--

COPY public.emp (name, experience, unique_id, empuni_id) FROM stdin;
nSxGTl	11	8a75ef77-7f09-470e-81e1-17cf47bc7a58	9bd62e7c-b5b0-43f3-82c9-be02102856db
MXsUDb	2	e2550675-05a7-483c-a4f5-879b6f35dcfd	05e5704b-3025-4b32-a615-cfbeb5198843
qLJuSF	12	7a06bec8-e6fe-4d93-9bff-170373a684f4	38e5e31e-bb5d-408d-81dc-741ad5aa4f85
xiRtNL	15	75b1e32f-de9a-439f-8d43-f311d4216adc	13807e7e-0725-4a67-8b41-3a8cfbb3f3b2
xNPfDq	15	80c32a37-74a4-4108-a271-c1d4a64df149	d38cd5bd-1232-4980-9a6b-dfbec04faf3f
iuuXHj	16	76c1356f-84d1-4e6d-8945-736ff64e7eb3	73173613-7544-4e68-987a-929576704ee9
PkulEN	12	cd9a79a4-8570-48bb-9b0c-71bae50142b2	b99bfbe2-f1d8-458f-b853-f0eb68b65d2e
PDgCAn	16	5cfbcf9b-d9fc-4091-bdb0-1294c1ad8a00	86a86ec5-eb14-47b9-a2b7-2fc844327cfb
cnhodR	6	d66795cc-20ee-46a0-a533-ecbb4ef9ed97	08916f0b-0195-413a-af7f-140a25e762aa
VYyisQ	6	9c3a793e-273b-45a9-b59e-b16d05e2f5f2	5701cafc-96b8-4170-ad4e-600f9bb57022
NUbVZY	10	c6ebb6db-3cf5-4b5b-91c2-2eeb94f110c8	e8207149-020d-4037-819a-3c0c04280f48
clvYqH	9	66346fe0-3837-45f5-82e0-407df0c6f806	9ea78cb4-5cab-4917-b37f-a0eb4dfb0099
MhChZw	6	c38b9eff-1851-4bd8-9a6a-415bbf5bcdb4	2067fe0d-663c-4845-b810-e8387c136100
Ubcjke	18	d1f1a4a3-7508-4874-93d3-bd6416b95c54	a10fba79-2c68-46d1-bd5a-1bf14dc39359
VLJpYh	9	d00b1c32-de91-4836-aa8e-6578dfc243f2	e5c0a974-558b-4235-ac22-69dbda3082c0
ybEKfY	11	f728be27-a59f-41a4-96e0-ffb40b00082a	cdfeab7d-99bd-47cf-8e54-9128112e15b5
aSJwxe	18	fab96037-ca3e-4bea-9af5-c7eb6c4f81f6	974c18c6-702b-48f5-9789-dfa960ec0f59
kLmdyY	6	656e613e-bde7-43e2-9f02-f22b764530f4	a19f25fd-104d-45a0-bc57-8955ad761c3e
VmmUcC	2	1f6c4478-a20f-4fe4-83db-5553fffd4335	4406b2a7-1df6-47e3-8253-a6e0e9f97d0a
PSwzkw	14	02f50c19-1262-4fca-9b6e-71fc738a59c0	7a41229a-e7cf-47f8-85a6-e6f815e03102
fQUzWj	19	38c0d8cb-9fa3-4d75-9d24-668be3be2f0b	3d29bc0f-8030-4b8e-b64a-fb27910752c3
mTHyjw	17	942363d5-e82f-4283-87fd-2b47976885ab	952b915e-9d58-4e95-90dc-9087229bb15c
npHAaU	19	c2cbf859-1348-472c-94e5-06eac5c3cc45	d56eb608-14cb-488a-a8e9-6a88d16d8eb2
fgvMcf	20	cf8726db-f915-4d02-bc3a-722b67fdc13a	639251d2-7277-4150-918f-8db7c54afc35
nKqIBv	7	9e023499-88e3-4e31-8a2e-d224e380cd7b	38110179-2327-4f61-9826-031451c8a331
OScjWY	15	0afbf9e2-3a7d-4ce9-9fb7-9714bb7366af	8b9cf219-bdd6-40b0-97d5-e5b65d0f427a
eFLjSy	20	1e5631cd-e6ef-4e31-9d3c-6cbe94e11861	69d33a86-39ec-45e6-9296-80fcae3f602a
ovOEaz	15	adde98fd-2479-49b6-b46c-977df56a9cdf	42ead0c7-2a4f-4d00-bc13-369f737c75ba
IVZkJx	2	537f6a91-89d3-4005-8fd4-0fed7db06572	1b0c5e66-7038-4f0a-a4d3-96b994af196d
BmqHKE	20	de9ca603-7be3-4eef-9932-0d8192769ab7	fff3dcc8-fe78-473a-b1ba-967082d64f6b
KDfMyb	7	1c0c3aaa-0eb8-458b-9d28-eeb9b6d538e7	97724aee-f97d-41fe-86e8-010a0208740c
caimLd	3	eba85140-76b7-4d8f-8bed-4792644af2ef	2f80e992-488c-428e-9938-902d43ea3f6d
GfaJnr	8	e6b9a4ce-2941-47fe-b043-57daede692da	db69ed1c-396a-49de-a588-045d003b93b1
dejqLQ	5	e1128acb-9cd5-4402-b642-60d7034b1ef9	a9934b69-1529-48ac-a3f5-6ae051b63b49
CkEwyj	14	d2b27754-d7df-4bac-b188-c029ddbaf2a2	7496a427-4d25-4644-98e0-88f482d2665e
tdOica	9	e1152138-5893-4516-bcb6-04bb86e4e2dd	33fbfeb3-d905-4cc6-a80d-5bfbf48a78c4
XGNozL	2	3bfed4ec-1059-4d87-8bb5-9e21cc36ed51	6b43ad01-6a8e-439a-af28-4e745b55db2a
dqOrSw	2	13419842-c40b-4caf-b634-c33e9f2359dd	902b97bc-7d6d-48b9-aaf8-90acce78410a
kwWrND	4	82a27410-4253-4218-9b9f-eff0440a39e3	632fb8f9-fdaf-40a9-8cdc-20b1c2e3379e
ftuaGH	17	985d9efc-8453-4f84-81b6-6126c46312fe	5df4c090-8355-4dc1-9050-68d15a430394
ddkoAR	14	cb6f5ccd-8929-474f-b298-df6af1378128	1099b05d-79cd-4675-9e4c-4fff543a0a0b
dhmNew	3	6151e5ac-99aa-446c-a1de-5f3dea3782cb	a0506773-2ba5-4171-bacc-c92201020873
tqablM	3	6853904e-726c-44a0-8257-9a1a546fdd3b	4b13ccd5-f4fd-40e6-9351-3c5c66d81526
LtxYbD	20	58988cea-9fa3-417e-82c5-ae6ce453fbaa	24b9ee30-b078-4100-a572-570dcf4d0130
zRmGaX	13	98d9df51-1c44-4eb4-b188-0cdcd8390f67	fac6f59e-b2c0-4788-8b7d-dda8701b5676
OnSkld	12	f9e54207-832c-40a9-a5be-8261c2a05422	b7fdb2fd-88d9-4dc5-bd32-36094840c966
HyRUSp	13	3a9d36fb-72dd-47aa-babf-b8b607855acf	6ef08021-be1a-4932-ae2b-d977bb068e09
ypQZwW	2	35809e76-2019-4ffb-b276-c72a1b366cb8	95b1bf0f-fb77-42a7-a53c-1d6844f96a3b
liVYmw	15	e601e047-3d46-41ec-84c1-f8ee85b9e65d	140b0a08-6d09-4925-95aa-20eb1c46fd7b
MKyHOT	3	20d21eb8-b331-4c42-9dec-652ba32c3f55	745c2637-6fad-4c49-a5bd-e44dc6f5f972
SZvyPy	20	1065951f-0d09-477e-8289-f882da6eb394	6a7d583b-6631-4fbe-906e-4d01de4826c8
yZXQWZ	17	1ac833d0-618e-420a-894b-c6b7690cb18b	01a19721-a8ec-46f4-85db-cef05eae7221
FownZF	11	ae5659d3-40f4-4fe9-b55e-2ac0ffe258c0	8b0d1208-a518-4084-b2f5-843369fadf31
jJwFJw	14	ab394a31-084b-446c-a5ea-c687dd1fcb4f	61408f79-2426-4198-a9e9-2dd190d30a45
SDpgGk	5	44f685dd-eb75-4d5d-89a3-ac3332d200fc	25b3c947-c5c2-4ee1-86fb-d335d25317e5
ELRbzA	19	75f5750e-9861-4e1c-b857-d9ea44d7e666	23d47365-be1b-49c5-8a9f-296127e26131
JLWcvS	20	1d58ea4f-4a13-4b8a-aa95-3bdf0f997534	1980780f-d425-450d-9586-a1e3f51e400b
rXvkLX	17	667f967b-3a1d-4924-adec-993eba19c9e9	7ac20286-030c-4dd5-91c5-1e4419762b98
nMEWTp	13	376b56e3-4fca-4be2-9bf2-8f80383034a5	e98441b0-2ca0-4ab2-9f22-4b1a31d3f0ca
QxFQxf	12	77770f68-65a7-4d8c-8894-7f735abe85ce	41b3ff18-4af9-4b5a-8696-ae8cf7b1e6a3
yBCAdk	14	df1d070b-9c52-40e4-a5e7-c11acad697aa	d8de0593-40d4-4f2c-b27e-ac50c6338679
KlBsiJ	14	966f1d09-3c13-44b7-9a63-027c94384565	1d7a6d5e-9189-404e-ac02-6de8ff4739a8
nKExSo	20	6108cf3a-7765-439f-946a-26a2441517fe	1ae0cad6-5f7d-4c58-a94d-3086bc63ec35
iLmoZs	9	d03bcfae-1306-492a-bbe1-5634064b5eba	e28ade19-218e-4406-bdc9-484416f30c00
nqGKxS	19	67970909-fba3-4af2-8862-7f8d0e3c8cb6	3db28bd6-b846-4a2e-9520-0d08065ca29e
CwdiLh	14	55f9ff69-470a-4a3d-89a8-2461d2652cd9	676b8da4-ffc3-4a68-864e-c2004925e467
UDMqkn	6	5d4268c8-418e-4cde-b56d-66fe20d34702	67dd94e9-8af8-4ec0-8373-d6ddaa3bd2d6
pFMSlk	8	d9dadc92-13b2-4dc2-b1c2-aa6a0322c754	e735ad25-19c0-440e-b052-a1da26922690
tSlRxG	3	33f5dbf0-488c-4416-be5f-753b9865da97	fd62d5c3-362c-4cba-b874-20a27837f618
IYBcbQ	19	409a33fe-6f4b-42f7-91fc-fee30575d7e2	6e3d2ff6-957b-4b25-a166-d10da233ebfa
FrVXOr	17	7e84fab4-a8a0-47ce-a0d3-8c19f2d833df	0eeb1a8a-8189-40d3-be26-47d6e2638fef
UdueJX	14	7009ab8c-54d7-4fc2-a0c8-4b5adf90e36c	ad42cd15-2c59-4933-b9ee-203a55c0db9b
iZOOup	9	3323eeee-4394-412e-bb7f-f7d8c7df68cd	5e19a338-40fa-4e93-9f1e-9defb4968e97
wwrCzU	12	160339bf-c08d-469c-8d06-7c5b4abba583	e3c9bebe-e1ac-4447-8b28-19473b874407
JORBJW	5	d5dda455-9c11-4061-823a-06ae689b3e47	04ffe48e-c86b-4086-b832-17862e9fba64
woswAq	11	a2ffcfdf-95d1-4e0d-9b6c-488e928f7d0f	b2f99af4-d229-49a2-97d5-cb0ceb8eac01
OhMsui	8	7eeaeeb7-4a75-4b8d-acfe-6214fae26311	6eb569fc-40c3-404e-b7c8-00c9c58d79f2
NLVkwg	6	9e9924c6-4aac-4332-aeb5-5dbd2292e4e7	40393e14-3ba9-44ed-bdc9-f7a0cee53d03
bRQvwM	6	c95f6994-9afd-436d-99b8-f9511a8820cb	bb1d2a83-6135-43db-86d8-e45cfb865b36
ktrEWm	19	f7e84a79-b24f-4377-84af-6c3dbe3110c6	5b692b3f-d7a9-462b-9baf-dbc06ae95f85
pledro	17	f9ecb330-a6b2-4ec2-acc4-fcb1766e153a	ea8b45ef-127a-4b52-8108-ac3ffb8fabdb
xMXurb	14	11261e3d-04e9-472a-9418-1ae6ee0deba8	c5148346-baaf-462d-b5ea-b27e164a512f
yhpRPO	18	ac06dcc0-1165-4b8f-94d6-49d7aa701ddf	1898b1d1-71cd-4414-b8c9-0d231c23dfc3
cOzsQm	20	3321b730-e943-4988-8867-6e679cfbac0a	3794f9ae-fc60-4476-8eeb-4783f02a3aa4
skjjvN	20	aeb48d97-3678-4e57-b025-550e73e79681	649fe139-c42c-4859-aebb-b49827c8a14e
thRuMY	17	89e4c0fe-ead0-42f9-ab51-e8bafd6ebc72	8a1a6ab7-2226-450b-99a3-b20c4b172051
KMAtFp	19	d6a41696-d302-468a-9fcf-dfb77e4429fe	1581440c-1405-436d-992b-9bd91ce1c922
gHNZtp	6	28998211-8049-41c7-b123-850e74280d58	72a761b2-7a5f-46d3-93d4-ed08f25edcf0
YTpvak	20	f283f129-d9b2-4a86-9325-3f500b7d038e	ad86c22d-797a-4aa1-b3c1-a075748a0eba
JHUrBg	19	2385f00d-ef9c-4f12-b35e-657796a5e606	a014f7a5-396a-45d2-bc2e-1a4c51769ea8
wZDUBw	9	c7f8f6e9-b835-48e2-83be-09470dcf7805	126a6d2a-4371-4f0b-9d7d-c1baa40ced7d
Vntnlk	18	bbe99ba6-b162-42d9-a815-050691628c31	164b4178-1497-4710-8e59-7d8a84a982a7
MJpueB	20	7d8b57ba-34de-4366-82a1-7758c7d0d4de	7dfefe10-cce0-4c4f-9b8b-9493791bf2cb
EGRvzO	8	6fb44f3e-1201-4657-992b-342c52476502	c7c59283-f7af-4877-b38e-05ca27e2e2f9
disnSZ	13	83fd1c90-c26b-4b3e-81e4-546c282d71e7	f3c23cb9-36cd-48c7-988b-de41f870bb6d
XmtaZj	18	c39ed779-06e8-4db2-9131-75d2afec1bb3	95edbb6b-574e-4093-a368-19ffd422d5bf
xFKDRw	6	84868885-63f7-440d-b435-d4045f26fa10	4b8b1ef6-edf0-47f2-b342-dbd9da8b79c6
qGATtu	4	7a40398a-454c-4522-a2a6-c77c94efe5a3	4411925d-4f11-4332-879e-1a2ed4b76ebc
ChxbxS	8	b04c8791-894e-42d0-9bd7-c35cc6a37a17	b8e74950-ca4c-43f8-9ec2-06c44f045ae5
PaNLhh	3	901e8281-8566-4bcd-9cbb-debcf220b355	f6887262-6285-46c2-8d97-6dc54838d616
MFLBZt	18	46184e13-18a3-4505-a96b-057e36cd07f5	6c99b77b-e45e-43cc-94a3-c51954b2d04b
utTzuY	1	d6131942-3e47-4fc8-96e6-61eb392fe6d9	4fb43e7e-6baa-4737-9fd7-885709133e07
oMyjmD	20	bfd6e042-3a57-4582-9b46-eac4f7c090b4	8bf727ad-d702-4fa0-ae4e-f69c1519a912
NSAxIt	10	c6bdcb6e-ced9-4871-bfb1-0e44dad8c814	acbedf51-4c30-442f-b961-2bd20f085acc
rDXfhJ	3	414950d2-8e7d-4286-b259-a129204bb8a4	c70a197f-1fd5-498b-aa3b-f98372feb8b0
gbeXIl	15	49cc4561-6e79-45b1-83ac-36147f70c425	b15793f9-9129-45e1-9ecf-59e2ae64bc27
PwGWof	10	fb8cb64a-7efc-4ad6-b686-54b5ef0ab390	0f9b0eee-2368-42d6-8142-068073e48a33
ewwkfw	14	3c464d9b-68d1-4859-8ced-6ca6569a13de	773e94f1-f6a2-49cf-b574-bb3e25a2cea1
ianyZy	16	d9d89a49-e05f-451c-a1b2-eb5423a83afe	396652ce-10ab-4e2e-819f-64ae1519ad4e
jrbUDB	2	b624677d-4a4d-4ad6-ab34-1f293a075343	a63d5860-483a-43eb-a5e0-9ab5fc2e9050
nBnnoA	7	e6bad23d-4a24-498b-aac1-ff80ebb7eb5f	fb0d7ae4-78fc-4ff6-aabd-d13418974708
YPomsi	7	7b7faa5d-f0e5-43b3-8220-973f756e985f	3b9f9f33-100c-4d18-bf45-74875be9e427
lFFrsg	17	ab0b5f8d-2f3d-4598-8434-28ec99bc0725	3a37d0ae-eb8c-4f30-b539-dd68f6b19904
fPHNLk	10	6e87795f-f1c1-4017-8006-d9b50ede43b6	38690272-db4e-4e5b-b42d-d442714496ab
rOsprJ	14	a636d660-f85a-43d7-beb4-dec58e2375f0	90d090f0-e8cd-486e-84b4-a6ff69e71c78
OeguDK	10	11633a07-9cc1-42d1-9732-c77d94032d01	86c283c5-2908-4b4c-b0c2-d7573b0c6072
AGYgGH	13	c17b75dd-d4a4-4417-ad87-2bef93d93ce0	1dfaaf45-1212-4f7c-9c00-c8d1d8ab2f73
wyxvvy	20	783cb308-2ed9-4d58-8e2e-6f847eb076e9	d9d4750a-d242-477b-9f55-2dc7ed78c3b8
UgNjuS	2	98195a50-845e-4f15-8170-ee64942f6bc0	fa408402-4352-4915-a252-2de2d760a5d1
SSfKPu	8	05f88360-165f-4085-b981-e4c1bcc2182d	b1a459d9-2d92-4847-b18c-497b2a910a45
ljidUx	11	1a2d9d90-83d7-498f-973e-50f56b010b08	a63c7616-d2d5-4f65-934f-f6241fbf84c3
iXHZxp	7	27baa066-4990-4a9b-b68c-e515686a7afa	8a37ab83-149d-48f9-b609-c12c6d2c7fc9
wICslt	18	4a4a7256-2274-4a70-8450-9c5ac292ce92	0f880515-ae5e-4346-ba0d-6c60563fed89
kDaOmE	10	3fa1f919-257a-467b-be30-27cfe940395a	a3c39c48-9a06-4204-8959-af8233d6f968
EpIcIu	1	5e4421b2-7a14-4306-836e-1799b0ad0679	dfb4c170-bdc3-43c3-8d1a-dca509d0db8f
DcoMmO	12	bdbfc2b5-c983-49bb-bac8-7d2677fec81c	eaf3b115-2adc-4eed-b5aa-71b10b99cb6a
eccnLJ	16	33d69733-88f6-4458-9a10-67fafa4ae200	1e9a04d3-c6e1-4acb-b99a-3f0e424d177e
mrorLI	5	867c12a4-c03e-4a72-93c3-0ccbfef5a94a	b804a501-2c70-4f4c-8a33-5f99a0b23a97
qlJYsw	3	f8edac4c-425a-4d0d-8e8d-26ac13ad5c09	6ac8b174-a2e1-48d0-b614-bfda03e3642a
ExIdmx	20	9db03714-6745-4f2d-abc3-af10af1690f3	99a38bc9-65d8-466b-ab1d-3f30701fd55d
AprCFT	16	270b48d2-df17-4200-b4cb-220ab320f497	91be4f41-2da8-42d8-8015-2651828f772e
iNVWcJ	4	515e7e72-9d2c-4d72-97c5-2c572d817774	74d0afd5-f6ed-4e6e-8c96-8d025f2b0263
FYzgsb	4	5685bde1-993f-4b33-86d6-ec9dc008cd95	4dfabd32-c677-4d2a-be41-76c389aa3fc8
LpEoAD	7	3346289c-caa8-4a98-827c-f12e7fe31826	3e1d615c-368e-4de3-ac68-ddaf217572f3
ztAKIG	4	888bce29-405c-432a-94be-465ec480b271	d37a882c-1e65-43d1-adb8-b944e37f80e4
uwvONf	10	3d5dae4b-4056-4ad4-a22f-1e1e8d62c65e	1152919b-c01c-48a7-a111-58a5cfe22189
EnsuOp	13	2b100bd9-ffe7-4796-a378-4f1092cfa053	0f88571c-d774-4e28-ae48-34f442cd2fd2
htrkiD	17	74134de5-2f7a-4c87-ba67-a1cedd4c5ed7	e4ed3dc4-d43e-4b2a-a13a-8d1f89545b24
cfjAWX	17	258427a1-778b-455a-bfe2-8a24b8fca138	1e0c0fb8-9ee2-417f-b8a8-f8aa36e7eac3
Fjsuqx	9	710101ee-6891-4865-933b-dab0faf3e4f5	75e47e03-6ac3-42cb-a0e9-16a14e526b60
LOxYjg	2	7adf316f-f1d2-44c1-8ca8-44706291d223	51f5aa8d-41fa-4225-aad6-25a542d7441e
CuJyoz	20	a4f9d5c3-d1f2-43b6-be63-dd745c229682	0ab44494-13f4-4a00-a53d-ee7c9acfc053
ONmEzU	6	2058fbab-1e18-461e-ac12-262f546c547d	69831540-0db7-444f-832a-ab7cb090862a
nfEEGD	16	19fad852-fe87-4722-b9f5-9c833592af24	3f26da17-d8ab-47ae-a233-5bad30482531
AuVknI	6	a57cb291-dd7a-43c2-8735-14862ca3efa5	4a1b1e63-a2aa-482d-9d77-25211c1c932a
yqCOeN	18	9e52784a-cc47-46b2-9e57-3bfcb7a02fae	f0823051-2bb7-4267-b4e7-8ab7fe7e885e
Brvaju	13	ec57941d-c58b-4ca2-b7a1-0b3e9f361036	29b643b9-c98c-4760-8115-f9dddc44ff72
ykwdCm	6	88358b02-835b-45b7-9018-7613b5370478	94d48257-8576-400a-be98-9a0f780a7059
bOOsQm	9	9acd72c5-de47-408d-beb5-ecdd47fc9e2b	3886cea9-4904-4060-9384-a65e9eb673b6
IgVyba	19	9497cb2f-5674-412b-890c-8675380ae36b	e9932431-b1ef-4724-8c68-532761b1ae1b
suNzPv	3	aca61950-7bee-4e23-b6d1-f7f15200a8db	73ca01e0-0f99-494a-9358-e70211a11a16
bnymHg	11	a9e273e9-0123-4ac3-967c-10423a96c303	cb2690dd-b3db-4e75-9fb3-d9fa7aea808f
quWoHE	16	a175fd05-2915-4d45-9cfa-9cdb8f29cb90	359a03b0-868f-4048-8332-b4df2183493d
czcHxK	7	f39ac834-b50d-4a7e-a1c9-892857b44436	2ac98da2-4547-4a1a-bbfd-9a9fdefc3a07
OquTnj	6	b65252c4-6b35-4bc3-8a5b-db63f90e1b48	531c7e44-708e-43dc-9d4d-ffcad3322d1f
QRMQPq	16	a281d580-8143-4702-93de-f2292c381429	c496ab0c-b020-4e44-8e19-3c8230d541d0
mvikkD	14	f0c23cee-7484-4a61-9f33-e7feb573f0d2	a9a15715-2d0d-45b6-93d6-f43af68b0534
WoMlrf	8	b148637f-1940-429a-872b-457cde4f6a06	ba496763-441c-4947-ba57-63bc3423b96d
YNzKxl	19	805f64e4-082f-444f-8290-b9273db2a02c	5c5791c6-6655-400d-bdc4-c8b605cd713e
flFRPR	4	3cd2af82-3018-4c7f-99f7-27d02d7833d0	baa778e0-9ab5-4774-b32c-2a63f731cb5e
nMZNAP	6	aa517c0d-a630-49f3-8055-8eb9b699ee67	2e44c353-695c-4989-b02c-6af2a52b6003
fRSPYH	6	bd36238c-d68c-4247-9211-5f9d7763f0bf	059d3577-dfd1-40ea-965f-1235616c442e
PCqKbD	15	95de906e-24fe-4153-975c-61a61f22ef26	7eaa8d47-0809-4cb7-8350-3df324aa008c
umsIBp	13	e0d8a928-d02f-4a9a-930b-c03fddef7186	1771aac7-597b-4332-99b0-529d21126e0e
hBNxfz	2	25083842-b66a-41e5-a9ee-11282f1f92c7	7c0f521a-1929-4c75-9517-ab55d83e158b
muNVNV	7	efa8907a-ba93-4e4c-a8b4-dfdf2975fb67	44ea50e8-e9d2-472d-9e8c-b540283efb87
uJTBSS	1	f5c52831-bfde-459d-b8d3-c194204ea7e5	a9d3c4f7-899d-4380-b5af-619296ba1ee7
GKRZkc	13	bb561b16-44da-4d7e-8318-d26455660d1b	7c05ca3f-665e-4633-9dac-d5f76bd2a82b
ABkeeg	10	d0e90565-d661-4c66-8ef8-d78265a4d5d5	d49638eb-2e6a-4528-97d5-1947c5ba2567
ZQHpDy	6	819af003-a604-4ad3-b3f5-980f651dfce3	1500e2cd-c5b8-4a97-b23b-1a8d1e3f87dc
MhxsWV	14	186fdfc3-1288-445a-a325-2824414dd771	ccf9a84b-710a-42dc-b4b0-d5aa93aaca5f
zRhpvH	15	36834b0d-45db-4508-baff-c4e3aac1f567	17eacc85-8041-4559-8c03-7992717bc017
uFSLYU	14	2a7bdfb8-4078-4676-b3dc-53e8de678259	8012bcad-a97c-4c8f-9c65-32b3ed23c6e7
gDNoEt	17	f16f89ff-c408-44d6-9a8a-11bed826d00d	e19770a0-263c-4635-8176-e98db4662cd4
BomsGX	13	a815a6e5-d85c-4319-b7d2-b2b361768569	d981d528-477f-4687-b705-ffe649933b44
mmflsu	7	bd1ef566-d740-4738-b54a-e5c9146ad096	a5683d64-fa7c-4e85-a550-779971ee8d14
ALlxab	19	bc9a7652-e28b-4528-b4d7-b6561bc5ca10	b953f017-df50-4c34-8c8b-d5d9b5d61944
BmyvTH	12	77cfca96-ae2d-4c01-ae23-4e32648a2d56	521b728f-8b94-4994-9953-65f3d4910c24
mMHqey	18	33e3b47a-1113-444d-be89-25d1e1888378	f6cc924e-2c87-4cb9-b715-33fd9f4ac727
wnfQDH	17	9b0ea2c1-9bf0-477a-9d9c-67083f9333ce	ab878255-b950-46dd-8545-b69cf84eb610
SlzUxv	4	c8212611-6435-4306-ac03-2ec967eb0464	b7c58916-1744-42ca-bd8f-05b14169c268
CTdJBB	10	b2a32d0a-683b-4f11-8184-bf788ecb6497	a2800296-15d6-4c38-a3aa-836f056f8005
GYvKVP	10	7aaa7140-9f14-4246-82bf-65f1337b0b80	f11129db-7377-4a2a-9fa7-952a9b63f5fe
HbHpyt	16	ce1c399e-43c4-4fd9-8210-f065c8fc18bd	a57ad468-20d4-44e1-aa69-8c8518fb505c
hQZxrD	9	42d39ce9-bd51-4b7d-8ef5-23528e94e101	5c6523e2-d9d2-401d-a28d-109c4cec2ccf
LCKxwO	14	c9fd4285-85af-4cb7-a554-5659c0c06c06	f0aacb21-5d31-47c2-abb4-0d8a6fc20497
bQniIW	9	5e0c91da-d90b-4ca1-afac-690b42b24266	69a6f42d-655a-4976-b6a7-68ab31e7750e
LbRlvZ	2	6f512b89-77a7-4c41-86b6-7387e6d629c0	4003cf5d-a4a4-41f0-b5bc-b168b76420fd
zKZxCb	2	c732ae9a-9839-4810-bfc1-3f793af950a5	0c28c11f-b004-4060-bcb5-3ab51c43893d
SGTiXJ	19	cebf6b65-843b-4be6-8480-00c3294b3ed2	e5ffb0c2-2d79-4a36-8d34-2e24fc3b0dab
sQduAR	6	41d6b7e6-8a4b-4ced-8b83-09a930512efc	fc93ec61-7540-4c5d-a668-7d012894faa5
aZaLoU	6	9b0a82d9-d9f6-49a0-a9b5-8d5d9502510e	40e7fe7d-930b-4bed-8b79-29245a50b8da
yFyvog	6	72bc4ee7-2f60-472d-8c49-ba200a08980a	fc621817-fd05-4469-bbe4-e7234cac1f19
skVNhm	1	ea07ffc1-1c4f-4914-9201-ea4e1ac538e3	37bc9213-9bdd-4c4d-83f5-98390a7f20be
liTJHO	4	e9ccfcb8-9f64-4230-9ec9-76067a6e0f32	ce24c5a7-9cde-4a6f-a1d6-2c0b28bdc5b7
fQvAVm	4	55575a71-44e9-44a6-aa60-b12f55ef2027	14e9cedc-59c9-402b-9045-f1f724b5479c
oRWHxN	9	42a81987-e555-4a9d-af5e-51b55ed47a70	9febbf39-274b-467a-82f9-7c5b2a089494
pOKcGl	3	a61ee5a1-03c7-44ed-af8e-d636b3c11aa5	a6573e47-cfce-4606-8a7b-315cde13a354
PLcdge	12	84527a12-8f8e-4341-ad32-53e07c4e900a	84fd180d-6d43-4a97-9fe6-5a4b229c4d4e
DfBPjS	7	6cb0cca2-551b-41a7-89da-69bd32ffbf21	a2df4f44-18f4-4006-a0ed-0e4795babbde
Bdflms	5	911b706a-6fde-4ea0-9d0f-9f9a79e6f93a	147d1bcb-7bcb-47b1-bb0b-24234c263640
rwJnJM	11	dded1071-7cd0-4852-9919-7ebaeedc4241	d54efd27-b4ec-43ef-a233-e7e03daaca23
UyUgcN	15	8dcc944d-6397-4720-abde-9bb66ee4570f	93d18c7a-7243-4002-9125-4b66941cace6
xGHbTs	18	2a9a2db6-a997-47ab-9da7-43a3c1a68a61	f5ec2719-d847-4f28-b728-9d34ddee812c
KOKtIk	3	086360a0-6ccb-42a0-af08-44c908d82a7e	ec33d894-b0d3-45ab-a36a-8a13546bce70
RcHEsW	14	6d6c3f81-c8c2-4b15-992d-fa29c43aede0	e7141df1-0cf6-40a3-bc46-005dd5c74cea
WiefWy	17	f0b86c9f-1156-4ef2-a123-e9d3e5a66aa1	ccfa12b6-1538-4735-88d8-08383189662c
UKWiGT	2	b2cc2fd6-2c7a-41b2-905b-6e4b00bf2b56	a1157b3d-8ab1-401c-88f3-09697e7ccc20
MSlFCf	11	d96bf0ab-37f2-48ae-990c-84a021cb645d	22af0ff7-7419-423c-827b-33edfeb6f553
QMLnpG	16	e909e024-1183-47a0-821c-4a0af5c9e35d	68215e01-1afb-49c4-9761-67ae614b5aaf
UxmQgf	8	ee0bc228-176b-4208-a1ad-db85f1b9b916	3a63cdfd-7e61-4fa1-973d-7736fec21913
WwVuPF	16	b63a9400-62d0-44f3-ab7a-e0641ee0c3a4	62e51579-d1e6-46fc-95a0-ea8e902f14d9
jQpMoi	1	f4a4a1cf-3e45-47c0-b30c-5f0c90eedf93	dae54cef-50cb-45ef-9698-e1d41492348d
uSnhQm	18	7d8f5dff-9cbc-4e13-b5fe-655ec6fb3576	63ec42bb-c80d-4664-a7a0-6825c777c335
jpcVNK	10	bd6c4a3a-231c-4edb-8806-c77a7959442c	2be4d4b0-1b8b-435f-aaf4-ff53be0031c6
ecSuzg	10	6f4c808e-e5c9-4010-92ce-7e0f62887d3e	620b87c5-aacc-4701-949e-d1a55d8dd811
vkcxAK	2	7dcd86bf-34e5-40e0-969b-e3108811c3bc	a39b0bc3-2c48-48dd-9661-6dd7e849b65d
awcFTx	18	4339b507-95db-4cef-bb7d-a77da7bc6a84	928418a7-d172-4178-8eda-4eb34ff768be
Inwclu	16	c7386e60-45c6-4821-8cd0-0f4ed7679486	a4bca1bc-4921-41ff-8f3d-e371684a6517
NEbPqE	17	4722d3e4-b276-458e-b262-1e562f4123cf	d13f84c4-a24f-4eac-8564-92c2d5c92d6d
BWuEbS	1	0eb9a8f1-3089-4d2e-ad3e-2830753dc74e	ec7c8ee7-a327-4672-a248-f327d1f1742e
ZnLZbQ	7	9b767c0f-f16c-416f-976b-5d4691af9927	2cfa875c-ed88-4db9-bbe3-9e0a5ebde54e
Ytgond	15	15a72235-84bd-4f80-8662-debe6cd5f012	5e26bc0c-51ab-4c7d-9fb0-40569d740dcb
EBeOQL	15	9737b48d-7708-4849-bf47-2ec5922047d8	ad055283-db27-497f-9c2d-805c5ec9b7f5
WSoIFk	17	890cf8ce-78d3-4e5d-9de1-12e39a4da2b2	bbbd7f98-a34e-46f9-9607-756fa2688454
ahgIpX	2	a7ee5dce-82ab-44da-8188-5b7cbdb48c19	68245b40-f1ff-4e57-9df8-b9da48c7b9a2
ngKYry	12	f55f9ada-f924-4e53-97c0-b57960496532	50324bc1-fe73-4952-b411-b7016ca7cb68
ubzsjS	18	55d1f373-965f-401e-a90a-b9d7e6c8f2f7	49491d8d-3367-49ed-8e95-49e33bb5934e
WbCGpL	12	6577e847-3a99-43e6-9cff-0c50efa76090	203f6bdd-0229-4ac6-a22c-1c816942afcb
lzFCtn	18	42f2eece-52fa-4dec-b7a2-181d9f3d7567	f7d4f571-2a17-4eea-904a-e3fda412d92c
PkapfD	18	8812c3a2-3104-4d3b-afae-a7e94fbb06cc	8dd36da8-99d7-4ac8-ab5c-d53a4893dc5d
goBixO	4	a653d893-df86-4d17-aef9-e2b324bfdd3d	de1d8f36-c377-4bfc-80d2-4f8582c73c02
LCkCeI	4	6cbf7edb-dccd-4c4c-b3fe-b57e6e297fec	afbcaa37-19bf-490f-ab82-fa041ec1b887
dRoYev	20	ccfacf81-5b98-4d7f-9cec-f1d6b9ae1948	42020894-292e-41b6-8b3c-f25e5d1b822f
hTTrWA	15	15a32201-7fc8-4235-b233-e734f860bf00	214eb771-1ec1-4e0f-82ab-7b225c3d1c9f
jyNptM	4	d722d47e-98f0-4cda-a18d-993c7e5f8fd9	98f7a74b-a8b7-40cc-abef-6f81dba60d28
SOydCb	3	f1bf2dd9-7cb7-4abd-b498-314c51942382	4b92bd2e-927f-456b-b100-8432efaf37f9
hTIhTg	20	f57e577c-a670-4fed-b800-072697091365	9e139947-8222-43a9-bd2b-c5e3876feb4d
OtTPmX	15	3b44a3f2-1202-4f08-b2ca-db362645b0cf	ac736006-ac25-4c57-ae0f-00ec920a8bc0
GDLLYU	14	b5f9a045-1d78-469a-9858-7899a3bdd40f	efd06a33-52de-44f4-a301-5cbb91eea5b6
LQVORX	18	2fb46086-5604-4a9d-a8bb-900051c2b096	39ddf644-24a4-403b-bece-6671ab93c892
bKPDzm	3	769dc051-8bac-4c83-8197-ed70ef9f73fd	f7883e5f-381c-42cf-a8c2-e06f6889068b
wyRPvu	10	10510538-0274-44f6-a054-ee7143deab1b	c7cf3693-b97e-4f59-bbce-8747801ff403
ucdXqE	19	c3b4d3ef-1d69-43ca-ae7d-5c6b95236cc9	225a31a8-ad65-4bef-8a22-3eae39b69c61
NteZqn	1	98ef3f63-7772-4bdd-a9a4-a66db5dcf4e3	4a6f0f92-0530-4c55-adf6-0c0cbbe0b60b
AUvxjN	13	aecf28ab-a9f9-4f29-a50e-87287f25d945	8d22e407-6168-4801-a74f-34b496226882
pEeoTv	17	78fa4a55-0c1e-4acd-87b8-a68f35548cf2	ddc00320-cb01-404d-952b-ae0b87c83ad5
juFNDe	4	51167ab7-20ec-41ac-80a9-949011b1a211	656f739f-9ddc-4e8b-a66a-d82fa22ccebc
RXZoSp	9	9db3af92-7d58-46fb-9fbb-9d2cd7c215cb	35732023-9173-4c17-b890-8b726cee9263
Xvjefp	15	a97ce608-cd91-49bb-a480-614e2b29a528	41f120d4-68bb-4b60-ae49-da53848c2666
AwZShp	10	1585b755-c66b-4fbb-ac98-fc5a0e584721	73ead8f9-bb82-4f9c-9ce0-814b9ea3e59b
MTTZRP	8	3a81dc18-65d9-4b6b-b782-3e43de5ff0fc	bc2bfe59-796d-40f7-850c-bc4ea0033cfc
gAprmg	19	79ce9b09-edf0-4e30-8a32-e58c7d1b2952	a3c671ed-ceb6-4876-ad78-0ce4e784ea9f
RDMyPK	3	ea8e28ba-445c-4b0c-824b-9e1382581490	5c3f681b-e0c6-42ea-9cea-29f2deccbd18
huHndH	4	3fcfb8b2-1db2-4661-8514-e81ac65161ca	189c3fb3-3986-4534-af9c-2c91f0864324
oGCxYw	12	d84373b7-68cb-45b8-9754-e1bb940d54b0	98c23b56-7140-41d2-89fd-7cfa63050307
KMLRKQ	10	031a0f49-9434-4484-a3da-702c7b01ec90	f1237f92-154d-4c69-8456-31d92c133a16
RPyyFP	10	32e697ca-614c-4f47-be99-b1dc21ffe0f6	46f16947-5792-44fe-afc6-a41eb88e9b7e
BXGLHe	16	8ae52b78-0b88-4434-8f84-4ccbbe3f3948	538682e2-6249-4248-b95c-27deab9ab6ac
sjoZHZ	9	df9d046b-b048-48ae-b48e-2e85962d5722	9e936f9c-abca-429f-ad2b-3d7a18fab6e6
ZFLTbQ	15	dd93b81c-8a7e-4925-ae89-828c29096380	87fe8444-9c43-4571-a455-407bd3865b1b
ASezvn	16	e07cbee2-ec60-420e-abaf-f4e2b14f7168	ea862ecf-fdfa-4e50-b844-14310fa0c28f
TjsonV	12	17d1f359-a7ff-4237-a92f-dc064af90306	f76541c5-dd39-45c7-86f3-62e98d18b083
LpcOuy	14	4b9f7133-e457-4f83-973c-ebe8422e2e4a	4ff27029-6940-47eb-bebe-db6b04d14e2f
GMEjsS	4	d1af6030-b0ab-490d-b258-00841e9a3e76	0e0b5e0a-9e9b-4a67-a409-0014726532ac
PFfgfX	11	d7623015-576e-48d9-abdd-72368df7377c	53712a0a-5828-41c3-9069-142c0ac73a6f
YcrXDT	2	39da7d00-2de8-4028-a056-46888386fabe	cc6c0f5d-b02c-41af-ba39-8cb88faa3528
oJGoJg	3	faf9bd19-f5bd-4f95-9a94-d3eac3335c43	13840538-1fef-43ae-9eab-6885c4632610
Gemkyy	18	9fc9647e-fb3f-4ab7-a610-73441a6d419c	006c445b-6fbe-4cec-a428-95f7e36ceb6d
QLDZoE	2	111846f0-3dd8-451b-be97-ac3dcfd3fe52	f64dd25c-06c3-4505-9eac-5cbf4ace084b
kfoIFy	12	0ef24c6f-7bff-4a47-856e-d1e541693ff4	e67a2f55-1ee4-43c4-814f-5b264e752589
nNTBOV	10	70a8bf2b-210b-45ff-afb7-50aa1369b1bd	e5cd2397-22bc-4ea7-aa2a-cad66172b077
uiJZJk	15	9eae7a0c-92e8-4fcb-97a9-ce8f5b80e8b3	d70d17c1-888f-47e3-8230-9e41f0960ced
iiddMh	14	3d63b85c-a6a3-474e-83f7-d5c38a819730	9137f22b-4ecb-418f-ac04-67ef1642f066
wgvQWS	4	c2e9e962-7231-4455-973d-27a2fa4c8485	2a3d36e6-a191-4dbc-9bd1-5eabd6bf7b25
BNXYvF	15	03ea2319-9da9-48bd-a4d0-6dee9ce1ff59	67a0818a-948d-4c54-9295-dd0f65cf654b
DdZbAN	12	effe865f-36d5-40b5-8dc9-35576fae5ad1	36335fda-2295-42da-a29f-560d5f6875cc
pZQJpy	1	5967e87f-06a1-4903-9dce-d60884f73de5	64ebb5a0-3105-47d3-8281-3c12ab18ac96
oNBzIH	14	d683cd7e-0980-4901-8247-5816b49f0451	f465f6ee-31fe-4646-b8b1-9cfa4c29e72d
jYcLKY	2	8dc66840-3da2-4263-80b1-f2729ed407bc	73607dad-2f08-405e-89da-d8a5c9af1bf9
ujswAP	11	6977953e-e54d-49bf-8d78-9d5230717b81	fb5d08b8-23da-4f7b-bf39-bc1669bce239
qhhKAV	12	66e7e9e8-a9aa-4e32-890f-2b9c93d09725	bb326a2e-20d6-4293-87df-a42fd90ab359
XVrsZk	19	f4321983-c93b-4b94-b5a5-c56630a45f33	c3da391f-49e8-45be-8c64-c35fa98f43bc
AVChiR	9	2a4b6e86-113f-4dcd-a65a-941d3e833f6d	a6c82701-52b2-408d-8ecc-bc73f8341526
ImBCNz	5	960e1e45-116c-415f-94c7-21f3c6424b4d	0cef5b45-4dbc-4b5f-9134-8fecf6f6c97b
TZMKHQ	17	e06ed662-cfca-4c05-9168-fadb4d1da276	38df1e4c-ce58-44fc-bfbf-f7a50a53fef9
yzqLNh	2	b0e255b8-1c9b-42e4-a675-324ef1278832	b19d4a9f-b52f-4248-a7da-8461a1b5939f
tHUSyM	16	0e029357-80cb-4bed-8977-dfad36eb766d	0cf89b73-78e5-4ab6-8975-f49fee3e0b10
SXQwYW	19	da7415d5-f83c-4741-a68d-0dbd2ca94b59	388e10c2-81a4-4391-9c13-a0d41dc56b17
eGBCKE	1	b0ab8f00-b0ec-4cb5-94e8-3bb801316e87	ff3e1750-0e7e-494f-9bf7-e5a83bff6869
sChmhr	8	268014aa-c215-4f3a-be50-3bf9d7aa8954	3c8d7852-5eab-4fe7-8146-d0b638aef4de
ZpogxV	5	b87bc2bf-4fd0-4736-8857-eae9e14cee65	3e27967d-ce78-4899-8f58-a1b2bda42e9a
rREyYQ	4	597d852e-8ae1-4dee-8c3b-cefb23bcf922	cf995edf-9491-48a5-8cb1-6c78238b0d92
WMjxUJ	1	b242bde6-0336-40c0-ace0-673c90fe7c76	d9bcb00e-3f9b-42ad-b544-5f5afec489d4
lDFFLu	14	79ec7c9c-ffc7-401c-aed1-facef41975b2	216fb293-4be0-419d-9ca3-9276b9d21f30
OnJWGJ	2	20da3237-953f-4ae9-a16e-cf779706b116	84332913-4a44-415a-b137-642dec8f5843
vCItDe	4	5c839a05-6245-4e5c-aa94-976d89192ba2	cf3458a2-b755-44e4-9ae2-6457031804d8
RvbNJj	18	87676a4b-7e28-435f-b8a9-93ec02ce3695	9281a09f-4979-4634-aa24-49456267077f
kAXwrX	14	5ba25415-b47d-4f4c-8ce8-53fe2788375e	b1f4b677-8bc9-4ee1-b24e-ea28a0fa62d9
zfPzIs	12	c53a8aae-5c72-4bd1-8a8d-adde7fe3f71d	20e8cc9a-ba06-4d78-b3ea-ff96a7fe7110
QGbCtZ	20	74844dd3-f645-4532-8d51-38d89520c25c	b1f965c3-38ed-415a-8c0f-742b795e1701
XCzBgK	19	2ddcfb04-9f2e-4417-a364-53cf6eb4163f	d05f6418-4573-41b0-ae00-ae617cc5fcc9
ExezNt	8	4b06787c-7ae9-479d-9b15-417333add7ee	5594c786-81fb-4b71-86ec-303f48d0aa02
mHInTw	14	a5bad9ad-36db-4232-9f26-e0c2335c9f5e	a13580c2-cb37-4475-b37e-6553148624df
iVhtZN	1	bdfc9a6f-aef0-4a4d-9fda-f69efef63f9e	88471f21-a140-47a1-a488-987a90bc03bf
xVTFgp	9	6f62aeee-b584-4355-b4eb-380f896514e9	026032ed-ee38-4739-83a4-df2b8c362d40
tHDLlj	5	92932ce1-01de-4b1c-8f2a-0d45ec0f2d94	00c04288-a52e-45f9-9630-ed78ce0f9420
Anzryb	19	d0ed4e17-7f13-44c0-8b1b-0c076c2845fd	4b4277c9-b72c-4b79-8a8e-a40daef3d019
yIczBG	8	f3c71ec3-0a64-4bd4-aa93-8765b17f24d4	9eca6dd5-e778-4870-8183-003f318c50ec
jaUIGI	18	d93790a3-a892-49fa-98a4-f584655c07d6	13ed4a13-3063-4b00-8507-9ddcfabb9197
BWVFZM	2	2f3dbcc4-47e3-4ff4-abcd-fed8246204a6	90a9ee30-d5fc-4153-bc04-e6838d450a47
ocKqWX	15	b74450ff-113b-4411-90e2-2207ea25d3b3	c0f4fb72-cd04-4097-a6f4-8a9324c08872
kcfilG	14	152d651d-e44a-4075-adf1-78fbda962d76	b4e10a11-22e9-45fc-8efb-3dc0e0efa39e
nDhJuy	19	2de8780f-44b0-4d23-b957-d157a778a340	d3a4fd4b-906f-407e-82cc-277e38924e53
UvJsbP	2	2d7aec31-7a46-44a4-a2fe-22b0b84ba1f0	019b6275-f1a7-406a-bd2c-820f8248805b
PuFJrr	17	d231b2b2-e240-45ba-804f-f304f11b247a	5757e619-8b85-4248-a89c-902d89049d4a
tksDjN	1	3309300d-5d0f-4753-abfd-48aafa3bf812	3bc7c6b5-d75b-4aa1-8633-f8167bf5c9cf
fULHSp	9	e6b9ad59-9c15-4c21-b020-ba0219bcbb98	c18303ea-5a14-49ed-8d1b-d7688d5114e9
DRVrGw	16	9adf0098-ca01-4d92-8452-05f2f0361b39	68639267-8d52-4aa1-9120-b80579c79714
YVjhvS	13	05cc960d-794c-472d-88bc-459e1d708140	c730d060-0389-4cb4-8d41-59bfdedb547d
IRViUj	4	2cec3fe3-4d86-453b-b2f5-9a9746c2d18a	c57c7cc2-f371-4a0a-9aa5-3822eafcaf0f
wBrgXd	17	9e810325-b589-444f-8362-2db7799b51eb	fa004a9d-5b4d-404c-bb75-ac8c27804a86
DuPLJA	19	cd06330b-35b1-4240-92fe-146b4b5fba21	272b0dcf-4e5d-4712-9d10-fd4c7a3fc46c
WpOBhH	19	dfb13e98-fbd6-4f52-9fca-751962341654	12a2ec43-94a6-43a4-9e44-599fc8ae7780
mtkVvM	6	69a16cf1-0f0f-4460-8fbf-82f02209cdd4	d3006668-33bc-4cf6-ac65-1ec6f46cabd4
QvFhTQ	17	e9cdad34-d18b-44b3-bb2f-c39b866c3f7a	08a2f428-c927-4570-924c-2baa441c5024
MGINeg	7	65e8db9d-4d3b-4269-b57e-9a932e195c4b	2c6c0f2d-72f1-451d-9ed4-3a2a2c4907fd
dIrwws	15	985d1285-7c2b-4338-a0d5-9e78665cc6fc	d30ea594-5d2c-4d8f-a4da-65ba0c726281
kEMiKs	12	bffd4660-b637-4fe5-8fbe-20ad5026f517	b6abd2cf-e4ee-4b66-b0a2-ef16d4747c8f
TRxPxZ	18	4a48c1b8-c7da-4eb2-8f34-a5ec4976e118	839b8123-025b-4d9f-a2c5-bcf5fb5d68c7
yyQpyJ	6	ca59722f-07ea-4056-a4c9-282d5e1c5330	3a965d28-e974-4925-acd9-15138186611c
SMnDZJ	5	984d26aa-462e-4e81-ae49-ba19ebb7ddaf	85f342fa-e25d-432f-94bb-c7055352df94
YtzGbN	16	68bf5ad6-f4a4-41b5-a05e-85b797aa90d0	79caf667-99e7-4554-84d6-b31c236bf589
OuoBSC	20	1a54e3ea-2d7b-45e3-81ee-7f9cd891a986	79dbf264-9f95-4eac-8495-23fa47e377b0
deewUk	7	c173b12a-09fc-4c66-ad04-4ce524e6153b	90fbd904-09f2-4658-8e12-613b2d460d41
VhrOVF	9	f13fbd98-aa5c-4a10-afcb-3ec359aea8ae	b36896c0-f2f5-4ca9-9c11-e492a4b0ab06
ulgnOb	2	b4b7947e-9634-4229-99a1-eadd0bb68b38	f6179f78-b4e0-49f8-af2c-97909a7112e8
GGVpEd	14	d5aa2cb7-9e75-461f-84ff-3c759e0411d2	bf77cb8b-aed5-4b86-a632-d6cc94f8b3be
iSITxN	4	3d572043-8922-41e5-a54b-b750e282594f	9cf8d14b-a8f7-46ce-9254-2fac18130945
qdOHAF	8	8125fb16-cc52-4399-8811-a08a06d74ea6	d2595ae0-4a47-4506-9aaf-845287fe7865
baZNcY	1	f8586c55-e58f-4e1b-8f28-acde11ded1d9	f7220037-bdef-443a-a4bd-0909f9b65318
CDgnTu	15	885d1bd5-bb8e-448e-88b8-aeda1e7ed3c9	90a8946e-292c-4347-904d-93141a935a15
MBNTvp	14	df54c317-837e-4dc3-a890-dc7299f6225f	d348fbca-104a-45ca-b2da-0735401b3d62
FdLlRJ	13	4bac6e89-4c23-42b2-8377-6b9c4c6cf9ca	82ae8a7d-de80-41ac-944c-561651736c30
JocQje	7	3ff18286-82fd-46d8-b313-e0480dd019bf	e664a3c4-c44b-4b70-8117-4cc91b48dc0e
ucfubk	14	d40c72df-dd46-4747-b6a0-5bdaf9847a19	e136f782-60e5-4a5e-b324-679a9eb5e8ee
nQViCv	7	14799d02-d555-43e9-96d1-f4ed1ee802bd	b8d19bba-8894-4fd9-8604-3f83c3d6d78c
XDkrga	11	f771cf34-ae82-42ae-a27f-1df1aba6fdc5	6dca4844-65f7-4f15-81e2-84070f2f5154
OcsHbx	8	a546bcc4-251d-47df-93bd-3bc5f720a4ad	f9a16228-73b4-4a94-9173-0230cfb1b1b2
LcLfId	2	f06d7ffe-a7e1-4450-8520-a401880a9903	583c3276-d566-4074-99ce-e19315d82a1c
tsTGhK	17	26d98f4b-9ab9-435a-87fb-1633b104aaf8	434d155f-6095-4310-b1ca-6a83468f7ade
eLwjQE	7	1e7eaf42-bba5-401c-88f0-c634367595a7	ecaba026-739a-41c7-a68d-4d7de8dde314
HPCtEW	11	1a2b978e-8eb3-4b41-bda6-cf766c54b16c	8fdc555f-73b5-438b-9f29-5dadf964a5e8
baABZK	15	560e6aa5-8113-40ff-83ae-ecb461ef2741	534a2ca1-eadb-407d-9cf2-f77ae0616a77
yAALaw	8	d5d8ac19-4002-4dd3-a2e5-dfa7967c43f0	8023497c-e5b9-4e9d-b504-057c7800974f
VujTyA	13	79d2835d-c5a6-4f5b-a7d8-e43c37e2f53d	96d07ae4-a553-49d1-9f8b-4d34327d79b8
NUJvOS	11	9891e3f7-514a-4c78-9826-60ee9a7bfe1c	984cd010-1492-4a50-80a4-b92a05838e1f
jSJfPw	6	17d088bc-1f91-4b33-9a79-b39b5d333d37	2d508adf-55d7-4441-88d6-5f687b88c750
DMfodw	4	2809da7c-859a-400f-9867-4a36b2327391	1719dc73-1615-4674-b7dc-1b4ed5fb1312
kNMCEN	16	51df8800-492d-4d98-9565-f7b54aa14275	07b5be38-9c5f-4a21-bcdf-a104fecb0472
atcxSG	4	22c68280-c897-4f72-8e6d-b47f80e17ff4	bc9ecb8a-dff7-4059-8e75-c5357745b709
Sixqpw	19	0083f25d-2bcb-4dd0-a998-64225366dce8	85cffb4e-1d98-476f-8666-43fd6eaffb64
anFoyI	13	027cc2bf-3e4d-40fa-8355-d2a8095d811d	3cca46c5-8ad5-4638-b13f-968e366b110f
auPpNu	6	ea5da959-9765-4b94-8d69-45e50ebde2c8	a810eb6d-76a3-498c-a2e6-655ffccb3617
uPFZYB	4	d1e9b170-cbb3-45b3-9bf5-f7e5a1d7040c	27c355a4-2cdd-458a-8532-2d065d2e4cd5
HSeTJK	16	de466185-a9fc-44ce-9c91-27f8f1739100	efc65df3-5bcd-45a6-80ca-f466f462bc4e
PtbXJS	5	5ed9fbf9-212b-409d-b9fb-aee87564aaba	21052430-39fc-4dfb-ae79-dd9c70cc1cd3
vioUON	11	d2d540b9-3b9b-4227-ba24-9c0bb8a1a215	f54f1232-4f2f-4717-95b2-4b3711983861
SWgmvk	8	c1e98f3a-ceb9-4675-9a78-6a2a4c0198af	c221f7bc-4775-45a0-baf5-5221645ca582
NtNStX	18	94f1e227-8acd-4638-a053-b3c8a4154145	bbc67358-6ff0-4dcb-a011-5ea2fe24f7bb
RrGfHL	7	c3030582-da13-4841-9a96-aab713d8f05b	eaff6b76-91f0-4eb0-9b50-d1e229c0f89c
ZkcyvU	13	a7e6f6fe-da80-46bb-a96e-4e28445223c1	f79a1f8c-3d28-4f25-a578-6060c64d9dd1
pFiESu	19	9945cf7c-d904-436f-afb5-87bf325d220b	652c3a98-d575-4932-97ae-0eb034c6998d
fRxIzd	5	6f0e7bc7-5584-42c6-8cf6-c540aa0734a9	2ad7c410-88c7-4f5a-a385-4e6e8d7a15f4
QgmFrE	10	a5e30c5a-112c-4e25-a6de-ccde1d10cc59	cf18cc5f-7009-452f-b794-a6c60695fdae
RveNmz	1	c2e036a4-dd0f-41f3-9d27-573b3a85d31e	516cb70e-9fce-4917-ac62-8f7b3bd48612
aZyDXI	8	7e2fa6a5-79b4-4921-816e-2a8d47d66fe9	a64e3b34-b3e4-413c-a700-06e69be9bce9
gadYGJ	1	0f761a0d-0efd-45e9-b758-216d56210eb9	46b3b562-0df3-4d44-af8d-942a48167e0d
KmajAl	16	af3a6999-b1af-44fa-8c20-b64d34a02ad9	f1508d01-9816-46e1-bec9-d6b94ea2d841
qdxywA	9	80b15def-852f-4f93-adcc-b2cc5acec743	998140ec-b5d7-4a48-b0b7-bcf38e423d13
jnRvEY	8	9eda5140-25f0-42aa-9b6a-6ff897b11334	c156f1ea-6237-499c-beb7-8fc2cc3b8ee9
wDgBmE	16	1460ec64-9846-4c0c-b1ce-b1784380deb8	2139c41d-03e1-40f6-bab4-614b28f3e87b
eFwqyL	9	3a584305-27a6-4498-bddc-d34cc65b2bf8	e5028862-6a25-4970-ae03-43063b5cf769
iDfdQB	5	2fef1aa7-f80e-40d7-b39d-9e737fe1fb5b	285da4bf-c9b8-4818-a33b-20413300a359
pUpDtt	16	9dc82f92-e5e8-4182-986a-0021b37c05bf	374e340b-6602-4954-b7dc-1a05617050f5
aatDHS	10	97d820dc-e3e7-47c9-8d53-375c1ba47759	0825dace-f9b5-4324-b701-655b6998bbbd
EKhfGR	12	aa4b161b-f6f6-4f46-8d83-e454ae8a0b86	b2d4d9d6-aaa9-441c-8714-72025ca4412d
PpXdxg	10	6c0d283f-a180-42dc-83aa-a81a57247279	0a537801-d19f-46dd-8e4a-3844a0e4ff64
rEeTTb	10	e4c72f06-2b9f-4706-8a7f-176aeca3b02b	2f1776b9-9270-4912-a6eb-459ede9beb7f
IkwQCX	8	1514e1e3-fd56-473c-97c1-b2b3dcd560cd	7a95d328-7724-4926-8a21-91e65de5b771
YjHmbY	6	75aada12-8cd4-49b4-8f50-1bdf4b76cbac	ba1674d1-5686-4512-a3e4-d7360655bdb2
JPTxxA	5	a02f0b0b-599d-41d7-9ad1-fb558f68f9e3	196d25ee-5cdb-4449-b1c7-3c6f0031e745
YsMlWL	5	4e85d371-1e0b-416d-b6a1-647e83cce6c4	16336298-8cb3-46e3-92fa-b20db885dcf7
HvFfVB	16	15610986-3d09-424c-8041-5c5c4f2e5d48	e9792eec-7e40-459d-a47d-a66cfc0d40f9
wOTOtD	15	c2a1885e-988f-4704-8c35-e6008d1d8525	43ef7346-f0df-4982-95bf-2e63d7d8fdad
xPjJQj	19	0b2cd8b4-6328-4f29-8022-44777cdefc7a	1f0d7876-d5d3-4ace-ac1c-28d269e0219a
OumlIf	8	c7767f1e-8a88-4dde-88e0-20fbf0cd6027	3d39cd67-2e1b-469c-be78-7ab2e8cbccdd
YRAVnI	10	b1a5674c-f4ec-4715-92ef-49fb8d9cc67a	6b5a55b3-13a7-45b6-9b03-12ea03a9f701
\.


--
-- TOC entry 3730 (class 0 OID 24993)
-- Dependencies: 227
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: bhargav
--

COPY public.employee (name, salary, unique_id) FROM stdin;
QoBfwz	78746	61b4aa33-2953-4c18-ba4d-48c0251cb73f
pSlUiR	78339	4c890d87-0967-4bb6-9082-9b26e98aaedd
qoPQNj	96950	da6d28bc-d4d9-441a-9adf-cf811d6b3ccb
NOGbJK	65830	8348cde6-8161-4b17-877a-58d9519ccd06
EtOmJd	90685	d67a200e-ec60-4b02-99e3-7f8d7db8e55c
xoeWZy	52331	49f0540b-9b91-4167-a21b-d93dfeec700c
OWlgpv	90078	6047fb2e-5a5b-482c-954b-f66fd3b4ff70
LKqkat	97891	8684480b-7477-4f4a-8104-8bb5f436974b
dAQxiw	88480	7c6bd81e-b494-4a78-be5d-511ca3540d80
OyBbfr	57078	84cfc67e-3329-4386-bd99-7a7864e68f51
lngzGP	98522	cbf4f3b3-2a13-4a7d-96b4-ec83c0076147
ruaPyC	66821	69c6ad75-32a6-4968-955c-0dd24fe82280
ADMFnD	82150	53c1b30f-0ad6-4626-9422-8347b41e2953
TFiSxY	78827	73b58129-2e3b-4b30-8579-3fdccc6b4f0d
jzJDNg	91484	e270dcbb-c0ba-4a40-b294-66b0a75e631f
ICEBKR	75641	9a925314-598d-4bf3-8285-e1ba8c3968aa
SPOaxh	79370	f7d53d89-4058-41f2-833b-2bca3acf4a1b
ojvqrX	66770	fdfa5496-d913-4594-9c2f-ff2dcccac27e
JUwYJh	58011	961cba5b-c9bb-4cbf-9e5b-7a1aef7788d6
FYEupZ	72526	14a8564f-879a-44ec-816e-85355b9c4e97
HDPPhe	86542	5aba7e35-354a-49a9-ac63-7863e8b01465
jcTezd	60579	33fa8bd3-c5f3-48d4-bad6-eb5de34c7a13
kucbQH	58307	6be00c19-4c9e-46b7-b8c4-afe4f01c63cd
HekiCD	84899	b249d575-f866-4d54-a01f-42ba06e647c1
QDPeJi	87716	de849220-ee73-4806-a0d9-fbeb65ac3fe6
pCdXBa	81534	4654fab4-83b8-414e-8931-92814f72b59c
pfVZlq	54032	4254df11-9a51-418e-a152-d43fdddfcebf
gqsqQB	78790	2748a359-f212-49fd-9b52-6e2c6656ce63
rXKZey	97701	fc8cf83a-dca1-40e2-a2c3-1f5f30ba89e6
yYAwBm	80191	8ab62a2d-5259-4097-8a4b-7b07f6897639
gZzmgw	83326	b8ccb90e-e37b-4e9f-8e80-e3588e11ee63
lxfgtc	92871	e0a1dc91-d32c-46e9-8978-24dd92f9305a
twzXAS	58934	913f410f-7ffc-489b-b1ef-8c91a9cae9ac
bKKsgQ	85354	c9119c91-9168-407a-8a71-c115ab617ad2
XqIPGk	71849	ff421c67-9688-4997-a32c-0248a859cf56
lJauWC	79232	895f6fc5-b28f-4562-9d84-b692ab5b53fe
Ijpejl	58869	75c39250-e147-4a77-83de-994cdaf0c3f6
ngYaGh	62303	23424bd8-0f0e-4825-9f3a-de1372606da8
sjmKFi	91151	5d93412b-db37-4002-9075-ee4503532b80
VcjGTf	97943	efb0ea2e-8c1e-4317-aebf-bdb1bd411296
yvfpPc	83696	29341713-b5db-492e-8a68-21fae6f246d9
aEZgQY	88914	54f46ff1-06bd-4eee-82f9-de2375781fd5
NRQxlo	98278	c6e0f279-7179-4c71-808c-12bb37ae7beb
tnwEUZ	89888	712de89b-a880-4554-a5ef-4384811f1aab
kCsZqK	64394	6c264ce0-be5a-4f55-a856-7fbb16700476
QdXjgw	99429	a0b5e450-f5ad-41d2-b47a-4d97b4256d30
XrdIlK	97205	19c52760-7798-4f9f-a02f-2fafd660dfe6
jOlbYa	66567	2aac28ee-3f30-4605-b2b5-3bc72d3175f0
pKfcBR	50465	a98273ab-ad1a-4283-b8f1-8fe72a1e3c39
QPkNEH	60570	2a8043c2-4d40-4b70-9397-903c7da89a69
jIcZTt	55698	37d97dc7-b26a-40ca-a906-d77bfb63e5af
ollwgV	68367	c3c0f2db-3d2a-4e8b-9e81-c0df80ff6af2
zwOaSE	85026	95da0a3a-5a2f-4874-a4dc-f3c77f5a8163
KveFyn	76099	1b1b484f-fce0-48f7-bee6-92efbc68a03d
mqjIVf	74776	8e2cd253-782d-49bf-b393-96d7b954bbff
jJuhqs	88002	04eae8bf-84e5-403b-a27a-f6c908e288bc
mavXAC	72718	44c51d48-9df1-40fe-8b2d-fd8c82f41379
AHGrjJ	80207	529a4bcc-75ea-453a-bae8-44175847713f
JXlqua	84932	1104407e-0591-42e3-9416-7cad0d9bcc7c
ZMkCWK	96350	e6215e32-008d-40a8-a2c3-a5e7531b9a99
FXDYgl	53483	8135ba2e-3da6-4606-bf96-d08ef39fe654
YVIIOe	97877	520de959-ced0-4842-aa8d-b14f1e2f23a6
JbgJXS	85578	1529c61d-170a-4b58-8a33-5491f9b0d3c6
ZxfYPv	80740	0a7c1712-6f35-4e9f-9ec8-6e682cba687f
DeoYue	50112	c4810795-b99b-4dd8-96fb-1c75600e09be
GBPJls	89221	97ab00fb-2d8b-47ce-ade9-ec4ec7a1e742
PQEwVL	92900	83245df5-01e8-4c77-9f2b-e1a87a89267a
frUXLu	81985	252b5c4a-0014-4bf4-914f-28b1c9ac3a66
zxQiNo	72816	786a2d10-1429-4e52-8ee8-25a8c8a94a92
thwAlW	52305	7341a2d9-d7a6-44ab-a7e1-f189faa1e85a
jeDQvM	74570	8daa8b4b-35f4-4831-a6f4-05c50d946449
JClxoF	89649	e0f88779-414f-4e9d-bea4-3d1ecda6f6db
KytENk	53514	d6052088-a412-48f2-b103-a50f0f352a7f
yvpLNk	81184	55017664-9d3e-4c30-8c29-e0372340177a
mYAgDi	83161	99d5bd3d-14d9-459f-94ca-71aa0077f922
LqoNDq	74470	6e18ef23-2fd9-4097-8a3e-6abdc525fa88
BxmkSB	60588	db4d3b66-3f8f-470f-bfe0-f2a5a998fbdf
HJwtTD	56770	d076b697-03c1-4d70-8044-95aa74cd7526
jyIgSO	95152	9c5bf999-1219-4f50-b1a7-a811e903a101
mMfjnQ	69160	d1196776-6643-4d57-a302-04e36daaa168
BzdZie	73849	b3389645-9bf6-49f1-9dcc-419564292168
ywCXye	68409	824ad95c-2c62-4b1b-b6bb-3055e48ac35a
jtxsny	64216	301caf21-e4a7-4b49-ad52-6ffebabce224
RFdRdd	79904	1a137833-580c-472f-bd4e-f03ff3a59d60
ONXJtN	95687	1d9c4cec-100c-4646-bd42-777e133d6e81
tLUWAD	86245	7de88298-3789-4d54-af2d-310b0f552311
EKYOav	88880	99871d97-e078-464a-8334-daa8d4a8cac1
pPtMYe	62006	fbce63eb-0cb9-4e77-a623-c39de8aaa812
KwAgTo	83015	6d103f8c-2e66-42a6-bb5f-9dce401b2956
RLoKGP	60790	4fcf6d91-5e61-4dc5-9820-bea5c822c078
YKZhxC	76642	a78bd95c-a897-4a76-b65e-ab910593893b
IicwHu	95635	19022b03-9303-4e7c-80c7-8335cb85c126
kCmQLi	99153	a7f0ea8c-f062-498f-9d08-521e1dbebfba
XHcbRu	93181	5b1f28bb-d189-420e-86bd-0fd90eae92e4
GMWFgo	63069	dd80bd5e-fa7c-458c-b90e-c51b2ba04b58
murbFq	60857	7ade71f7-ec77-40ab-af0e-4926a7e46536
MNfZOk	68130	33358c3d-2f90-4f96-92b5-ed5de9ab726a
HVBlXL	99278	43145ecb-eba3-48b9-99b2-8edb47b28126
frdcsP	76309	82e9a2ca-531b-4fe6-86e1-a40713bd4feb
HOyvFI	99762	e8ce7879-c21e-4092-8c58-c08102e027f6
QbBqRx	87835	b969ceb9-d606-44bc-8588-ad8c743bdac7
JlpBgc	79819	697dc5b8-79ac-42b4-b1b3-6bf7937039a4
EBhbtQ	73010	137d12e9-b4f9-47fc-a29f-cb81309e7243
JEnQWE	76244	cc66863e-3e4d-459d-8582-4928b1b0e095
taRFhI	93225	63326260-b764-40b8-a7d2-81d794aad340
dDDCZR	72331	84148172-adf3-413d-ac92-61eb33f6f62c
weIIhs	92001	8de74840-d7fc-4fdd-9327-fac69d90ea0a
WKWKyn	85733	3530d45c-0308-4929-8554-fc4caf2527db
ysGPfE	64019	475efb94-e746-40d4-847d-60437c4f0f6c
PRWIfP	91412	eeea2413-b03a-42e2-881f-cb35f1685f5c
uleVJU	63604	d89d5b36-a742-4361-9ee7-7c2bcead419d
iqCUtv	89646	8909f12e-6d4c-46d6-b288-bbbdddffc91d
sNUatV	81519	548e7640-a98d-4346-a3b8-4db9b5df133a
bDibJG	84284	98adab71-a80e-46eb-af48-ae51386aca91
NCBYIn	84254	a6287614-ebc1-44c4-b5ed-949c4bb52c42
zeolRE	68210	1d446e26-a4da-47c9-90d1-88dfed38683d
BOfJzE	55212	32ee8efd-1f4a-45f7-b0d9-bb4aac6debe8
GUgOdr	65590	2a9a1759-d4c9-4106-9be1-f1d51356fb72
NKXAUG	54071	ed4b3a4d-e71c-40dc-be4d-2770b103a856
PWpoNz	58748	aafc2c98-d51b-47ef-be66-9b764f7707e9
DmXtJk	51109	55e374b6-8c7f-4dba-ba60-cd50d3b056c9
RTotTT	64136	3f6a1e1e-ab80-4ab8-8cfa-84aea3bd1563
yrXtGW	63700	10b10f16-4245-4d00-8b8b-c17571bf4687
csxBgJ	54237	4f7d6bde-c0d4-49ef-906d-199657acab74
LRjgbl	79577	f7e03c3b-d4ae-4eb6-afec-c253d19eeaec
KDlINF	71728	2501b27c-28c7-4efa-8126-dcddbec6f851
KiKnoV	65564	8c8ad6ca-a41e-48f4-95d4-3068a2af3f78
BeibqM	64251	487ed7ff-338d-45d2-9948-332e49000dfb
KmUtKG	64338	749e7bbf-5dcb-40da-9f5b-641935da0794
HdmEBs	90744	683f6505-0a9b-49ca-8203-c56ffd0997eb
LiXsDP	60269	dc9abd47-2402-4d7d-ad50-7cd99f75253c
BCKhCy	63914	0254a9bc-96bd-45c1-b1a4-829deaceff51
bMvcUf	55051	5e1ae529-fa60-464e-9e39-12d872cb1711
HKTSXM	67192	dc846abf-67f8-42d3-88b4-27f0deafc90c
rjPzMC	85533	acc10c22-c5dc-4823-85b6-45b4120d0813
fFwwXx	62796	6ec67962-ffb1-42d8-b1c6-4113887b81c4
aZzvHo	56469	bcc208d1-ffcf-48d8-9463-30aea6bbc9a9
KvOOmd	80416	46982381-678d-4619-a7d4-d3a840ac64ff
Indzsa	91366	d7cafcd0-a83a-45d2-a64f-47d815ef6fe5
OkeimG	81980	a2e07040-c324-4418-af8e-c20769935195
gtbQaC	57787	8c5256be-10fa-4146-9198-2ff9ae08e216
RkhBMD	54886	ba473ee0-3ca3-4570-8bc4-ac6662a32680
PgvvDS	50354	ac0ed59d-496d-43ca-9838-a63bc3361bc3
FjyCLq	52229	a8a89a39-50df-4505-8941-7be2a1ee4180
PpXnMB	62626	e084f4b6-1fd9-4ce0-addd-d5ba9494e427
tXJheN	98065	4ae3e5dc-6927-4209-90df-5450c185c37c
hQyCOw	86406	d8c65c4c-3404-498a-85ba-03af2e9fa19f
TepugI	59158	72496431-ea86-4cc6-b5de-9462b69f707f
xwdPNN	98518	1f0e29e4-2d34-4ef1-bbdf-378725673042
hvKmnr	85690	e9be566e-d321-4b0f-a71f-6bba5e60efb4
yXNpCY	58774	bdd7ab53-3601-4464-8223-f1fa307a5a4d
sjZCTN	95184	188f0c76-7a92-4f4a-b4ea-296c886f29d2
tkEOJw	78336	d5c62329-8c31-4825-8797-911503c9da1c
QDuEJL	83094	0cb5ec13-cb72-4962-b392-a99e6a30c42b
YwNvhP	67224	bc98c77b-a3dd-4464-828a-765297d60fb6
loPQvE	85941	753424d5-137b-4aff-ba7d-67730594c184
hrEmtm	85419	84f30486-579c-416e-9a4e-c0b99d34709d
nUFYCg	58124	b782ccfb-37e6-4d90-9c07-e744b9abd973
HfbTjy	64439	674a24cf-1fd9-4d8d-bbdd-5c611bd93954
CWQwQH	97182	f0bf1ac7-1cfd-4b59-b1a1-1bdca845ae8e
pniCgK	50097	675feafa-1cd4-4cee-98b5-59185de48c04
XIXcED	71337	9cb8026a-32fc-48e2-9792-1144e8d3b0f2
BqtuXn	87661	22baa27f-9a80-40c6-9955-3a4875e5577e
gpNcDZ	95334	bed7afc7-b875-4983-ba19-0c30be241497
NJhWCQ	50659	ccd77a81-f05d-41c1-bc6c-97e85852aa3f
BskcZN	62425	54f8183d-85d5-4626-98fb-5773fce6b2a4
EqYRoR	95615	c4f07128-14fa-4b2c-bc37-ce7e18582b8b
vaBkXU	71903	a5e9b737-7daf-405b-9cf8-f7084ef52421
rkqxlx	94872	33045ade-613e-48c9-81ba-c88958ccd3b3
PUzQHo	99785	3ba556c2-41eb-458a-81c7-47a4589a161f
YHAhCh	91175	1c61a477-307f-47bb-99be-13eba88a16ca
PSsOyp	90971	a363f55f-7be7-4004-8444-3b406a1e5fc9
zDKfla	79347	b23e3d29-4aa1-4bcc-8f13-cc808e9db447
WqAliZ	54220	f91a98ab-5b8e-4d43-a4be-6ae5908e43c0
NGKmoS	57768	c45348c2-002e-4c19-ba05-bdf72a9c2872
YslOCB	74730	f1671fe5-c652-4b32-a17a-6bcaaf9058e2
PedjMb	98273	5ec86796-8d05-4fd1-99a5-be88d5ee959e
RpsJNW	67427	1c18b648-b045-4de1-88b7-d351c9d9c175
vpIETU	71514	0aa58abf-9276-4d04-bea9-f389feea59c4
hATroc	85888	ee6aa671-501b-4174-aa95-a7fa47479b52
KbGYwV	89260	baf2c089-7718-4ab5-9d34-cfeb89316a12
xhITkl	67687	a825ad1c-b174-4b67-922c-d87e829bb341
PZEyYw	78489	e6f11f6b-49e0-4b20-b82c-10a853adbdcd
tOiBli	89166	0870819f-5c97-4298-9ae9-91d8dc9a0c57
fxguzJ	74045	5bdcb398-3ef7-4cc7-89b8-d8fb5255df4a
KbXafb	67111	82ba2cda-9ab8-436a-86f0-8a54bbdc3b5a
BGslWl	50040	eefebb83-bbed-4c0c-83b4-0d3b325389a1
vGMvzY	97570	8813160d-6d43-41d4-8de3-373916356cfd
NtWtDT	99610	0c59cb73-ba4a-4ef1-bd2f-002372f6c6ee
ToYiHI	60404	e9b1a2ec-1cbb-4a19-aff4-1f11a409c4c0
LqjluR	60840	375bf27c-c3d0-4c48-be3c-a315f2ff3d88
GyZeLQ	94020	78cc9de2-4036-4e28-8600-9aa33cca4624
SgykZI	65969	466dfd6d-7a37-4c01-9414-4ee025867bcc
otefXx	58903	fb0a138c-8eda-47de-a6c5-94206b6a4b12
nyktuO	52462	8e0f739b-bce5-4059-a4c6-ebdb6a93c399
LiAnfG	92798	851a8245-1750-482b-8045-75f6cd7e2977
GDqYmL	50668	26d9a28c-56e7-4a8e-81b9-3dbcc9c62e8a
Zuqrdm	79592	15595d6f-ee3f-49a1-a8ed-3fd0a540b78f
VJgjzJ	90980	d1a28d9c-8871-4c92-8ec9-073dc52fb79e
rSdnzF	92961	9ac4de52-acca-4b39-a434-b5e2f074c632
JMTjJN	88254	6a70ecff-9b81-49d4-a750-2e92bf144d9b
mBCyCU	57738	1acf60d9-34f5-4c3e-bb16-4cda040ee2d8
PyhPoT	93628	918a91e5-43be-4cee-b2f2-c36e9c019f4f
zCmAWa	62164	2dc4b578-3ce8-40d6-bcb1-854f820e123c
RPmNgt	70924	65683276-68ec-4af5-b8cc-aedebc2e0217
hXcelF	79530	37f5bcdc-f088-421b-a09f-585e6562cdc6
RbohHV	92662	14997356-1147-4fcd-b8b0-b87ffa60eda0
duwtNt	56758	daa68502-2fd7-4899-9463-b56125492439
sBGfTJ	75762	d53f0604-30cf-42ad-87d3-59e97828d230
noUccB	92101	fc83bc0c-9c57-4bc3-9a1d-510a2e46f1a3
rrpKXT	95769	bfff5bc4-e0f9-4d82-abc6-dc8e7aa8d0fc
llLzUd	70657	8fd72811-6727-446a-96a1-f22b305a446f
Uqwypw	74995	030ae377-25d7-4901-a172-9329ea669822
dxfofF	82115	0992dda8-253d-4f0c-9732-9463a41eaf4a
Oluqfp	61061	f7f78e93-5ffb-421b-8e84-540cfeb8f14a
tYtiId	93288	9e2187de-5616-41fe-81ce-0afa13484ed8
Eqraay	62984	fbd6fa5b-3fad-4b5f-8a05-1471921eef4b
vnbDkt	81988	715d02dc-962f-4631-9ebb-576b04034646
VIBJZG	97635	596c98f8-208e-4811-81ce-9bd2cc2a1d07
xuHQUc	52081	dd6c71eb-a32d-403b-bbb6-8209fbb5202f
CKtTfC	94854	732c4ce9-db18-43fa-92d3-75b94c3b6449
OPwHmU	61864	c21dd518-e97f-476b-9c1c-a0c724553f6f
IQnfhz	60914	8f5b07ae-5bd5-45a5-bb34-ddcadda6b390
UtYHCQ	85925	665b7c6f-0207-4222-b740-2190fbb2e7a8
KaVeho	72314	83862776-82e1-450c-9a8b-f0d224fcc167
KjXdBr	62802	e233a07d-c2ee-4e96-b751-596f49887d66
OsSEOU	87547	10b52f50-d068-47bb-bf5d-251b7003abb9
LYhqga	78553	0bf8c56a-f6b0-4c65-96fe-079004269962
hRKIrw	66428	d90a3450-b24c-4700-aa1a-bda1190f766f
HiyjAG	70874	b5ba953e-eedb-43ad-a0c1-646f666fcf46
dXwIWf	99386	9f43d851-c907-44ad-8642-f2635540058a
diFWAs	57512	16a05b53-dbaa-49b6-a201-ea30c8034417
owGtqb	98356	c83c7f2c-4c3a-4c67-a0ff-2eff574a8f9c
acwSzG	57017	f199808d-6aa3-4d29-92c0-5f3173c248b1
SzxDob	95195	952ca780-c739-4bb8-9a89-5cdc4336d08f
HVfPTg	89127	819e9579-1777-4b73-934b-104c9c11ed5b
muQMZL	68184	4dbd9078-07a3-4ebc-a6fc-39b080d82a91
ZmtTkX	93900	25baca12-f02c-49ee-aef7-a7dfc5e441f3
UUPKxO	63845	6f5f40fb-ba7b-43bd-8e59-f34134aab9bb
tFeJxm	59126	5251f50d-14d1-4872-a2c5-ed55afae9fbf
UxaLxg	63556	c06d48de-ce14-4374-8483-9dbc352b40c2
XuPFkH	98179	0e62d98c-e9ce-46a6-b0b8-36663a88ea67
iBlOdZ	99124	9648bb2c-d637-4190-88d1-af88735489ad
YsiFVn	50870	0ad3877b-3f20-4224-9ad4-5fb999a997be
SwpJMT	84202	78643e39-ba6d-4286-86eb-124bf5633621
nwSNBu	83171	703b619a-a72d-42b6-be66-2a166ec0544c
sOuMKn	92301	db113f19-47f8-4bb4-963d-bc3e8ac8aea7
iEYXAs	61180	33ea825c-c513-4002-ae9c-f91afc931cf5
zZtYxt	59508	07fee25d-d326-415e-9ff9-64ddc066a926
WlisVF	80677	312f119e-dc6d-4ce0-8c0f-4d627e11f41e
zRaGPP	51359	343f6bfd-43df-4439-b9bd-489d40c00948
YqrLlB	87829	d189e084-8939-4715-8182-b914486b3cf6
MKuYCN	84648	750a248b-f891-44c2-9889-9200244db701
qEFuyu	92725	561472a6-b8c2-496d-b224-8e32d95ed2f9
nCJicA	54887	03be95e2-99bf-4c82-a2d9-8b17d7dbe8f1
xxXEnN	98926	6f84bd82-a79f-40fc-b5f2-77a3ab9e0488
QZprsw	57288	213348a2-243e-47fc-83cc-8a1d1180dd6d
lyTFYR	70468	be98261a-33fd-4d83-a5ec-48bb386624f3
OWoXAl	88786	1be1a2da-84b5-4393-9c2f-e518fdb0c274
JwSMBA	56572	77034206-6b7b-490a-8372-f76754f6784a
cmGPBs	66839	be03429d-4041-4bbe-9296-d03992633bf5
CTpnFV	95889	24312458-b7bf-44cc-9aa5-3057291a6511
TrMtjE	65745	49a52814-6f88-453a-8da7-9ab0f7d90df1
pvFDEW	60715	3df16322-a354-4e67-ac1c-5907bca3f2c7
liWvSQ	98748	340429e4-6fee-4c99-aad1-136167545ee0
Udeati	83357	10c5a04a-3e8f-4e61-a977-8c2c495f2cbc
XaVWHp	57962	301e0998-06ef-4aa7-a5db-25da61d6a71f
mNAQti	68664	7187b608-d3e0-4e20-886d-cb6163b7baf9
qvzqgn	73900	9a5b3c6d-81f9-4dd7-bb81-0ffaaccd1f00
QjFzqM	62277	2239c238-9c4b-4bb4-98ae-e5de0d6dc02d
LAvsME	77388	f931e07b-cecc-413c-bd32-8fd10e05b3c5
LzWXeb	54225	47089ab2-f4d0-4112-8d48-0da62ecd16f4
uNYcoY	51146	c6d82f8b-815c-4d8d-9c6e-1100855537de
BOdZSL	86711	5df3e037-71d6-417e-a7cd-f613dc3fd500
sCqzoo	56387	7cf1ff18-9b55-49b0-9d57-e32cbd3fd989
JfrXJH	74227	5a2783a7-b720-4060-b686-210dbc20319c
pzaWTH	79711	7112bbd1-8937-418f-b9f6-4527c291b29b
kQJZkh	51376	5ee78f8a-8aa9-4613-aed8-35a9ee611c18
XbuqAG	98931	ecabc9e8-ee9e-4117-9ef6-c03b3f004876
CjNroh	50317	517d3603-aea8-40f1-82e2-97996269027e
AykRhX	66991	47bd61fe-5b2a-458e-b01b-33cbb28e6113
hPNsXf	61622	963990df-ed66-4532-93f6-f39488ed4d76
ghOgzd	97020	ca5f938b-f741-4b13-8e5a-69128f81ee97
XXZKgP	68311	e9959aac-7a85-4af3-b5e1-95ce0868c501
cmcDVm	72318	38fb6857-1f00-4b35-ac42-e20996d89b90
NGDPPy	65111	bba26fff-8b0d-4a52-8362-dd5172056425
bRmNuH	51903	d3f90ace-b8b2-4af0-a3d3-974e833642b0
XDWPxG	51521	1a69f219-8e5a-4010-949c-c915168fba5b
fJHmBX	60160	eaf68f42-ee5b-426f-b403-071bd9407cd9
xqFcnk	96236	ef8c2fe6-b7d1-4f19-bf9f-34b06f88abd9
mgNYwL	63154	fd60c9d0-01d4-4034-9876-e9cad93f8532
gbGFoe	54100	bcbd4c5c-6a48-4ea1-94b7-19cdf4943d28
tJOmlP	75663	82e63f8e-3695-4b91-9425-161eae1ea29f
BNsfPT	82049	177601ca-0e76-4356-8cd3-2d0ca4521a77
nKutjf	53253	44f91773-0b38-4079-aa95-8d7beefd7900
GUnhvz	70673	7fb39ec4-6ee8-4131-9d69-fcee0c0d7643
DozyDc	79389	5db92b92-17e3-4c05-bcf3-8499d7961721
buLiWd	58105	5dc3018e-7ce2-4c74-a423-c66d2984a909
nHxAwJ	95513	8d0de0c2-8554-4aba-a9fb-5dbdfd14dbde
LdAGzq	88404	178634a9-ae36-453d-aa63-cac38b6d2bc3
uSTZjH	73051	01055142-7c6e-4186-8a56-0ff9cb329268
LISUqQ	79671	23ab8d51-31d3-478c-9bdc-e390552fc040
OXMPOg	69274	d69bf4ed-246e-46f3-b68c-9688c3725939
bTpcvu	63029	e54ca26c-bbc1-4c90-bb5b-98f8b9490186
dVJxWC	84630	19ccb362-a5d9-4737-a9c1-f7d3ad53edba
hLnWPc	60888	f70b3886-a9f4-42de-bed0-7e38706ee41a
XtREPy	69229	9bb8cab3-d7c1-4c3b-8988-c5b4f00799e6
FoUdZq	57944	836f24c8-10e3-473e-b4a4-445802a94ed6
OclKoE	86430	39c0f9af-eeea-4fd1-9cc7-b00f1bf93ace
bTnUMZ	76904	34ff1920-90a4-4a80-bc16-adf92b1ed9e0
QlfHju	76657	3db689f1-8aea-4db6-80ca-309a2ee74cfe
VnTQKn	75052	74747153-18bf-41d2-ba88-3d88ffd02d62
neZtsb	67715	b0c0d445-2eff-461d-9de5-f60d4050582d
iSteAc	79618	d346b8f3-c63c-4b18-9990-5f8789847ea9
TJAFqR	71914	3016fb31-574e-4cda-9357-5f71a4072151
gjggSj	56937	b072ecd1-e532-4e80-8ae8-d26a20421957
WdIFta	74364	7a514856-11b4-417f-9dec-2bb796bf63de
CvisEh	98511	a4053235-63ab-449b-a925-b8f2b5714bd6
SpBFAW	70042	701c80e8-283e-4004-8c1e-448acb08f986
beCoXM	73374	c57836c4-1e81-4c32-8baa-dd477f7b2864
Tmuhva	59398	6b2ed0dd-e89a-4ee0-8e09-fde955ffd7f6
ENpIqH	67396	8767ac2b-843c-4fb9-8999-a48a77c2590e
qQHtxq	94772	a648a64d-2875-4426-b73e-380ba5d8a077
tBHpdq	62331	4d063c0a-2be0-4372-9840-bc55a70e9de6
DTzPCv	95282	7f38e1bf-db5e-4525-a6ab-7dc7087fa132
krFFzi	93488	e6078704-3940-4fbf-b6b9-eb9811682daa
OSeWTx	62192	8c8e22ab-997c-4a78-8cd3-21385f1b0e0c
hBhpNx	98973	bf1c611f-23ef-47c1-a053-f18976804cd8
oHxKYA	52853	8489ee76-7598-4bcb-a027-b788cb34fa0e
tmiCoX	59707	06d7d311-14d2-4f07-a47f-7353c42431b9
SiQkPZ	81266	23bc25a9-9a05-44a7-8875-4dcbac7a8922
aGnrnc	89771	17525618-d870-417d-a971-14b3de2a0235
zszBch	50163	937b74da-6dc4-4315-8cc6-5565ee5f1431
AvPEKN	69997	daffec34-1754-4464-bda4-46b21ba27bd1
fiHNBh	90703	7c589474-9a33-4679-a8c8-1e70f792d892
eOYmfB	97263	83e34059-e535-4e7d-884a-0247846ede24
MCttFN	81992	6411c145-09f3-4c31-b9cf-2a0b075f8bc3
azXPlN	98510	b44e16ca-6255-44b6-bd44-6f4e9cc31ced
cRHwDO	63638	4ca179d3-ba18-41d4-87b3-166487b6f2e0
MHTGqf	84511	63f6957a-5830-4eef-9028-9547f067e368
UyeeGX	50478	e8a9e993-b799-4a88-9e78-1aa10513727f
ijdWAQ	79985	dd12e669-7228-4909-b288-374522798599
JyjwrF	55186	b1792f17-7d46-4fa9-8e18-9ec85cb62e3a
WLawLx	67006	3c214fdf-2713-4eac-a8e2-dcfe54e4da9c
gNrKni	51920	ad6bdf78-7f80-4359-9e83-cd68fca665b3
OFZLfv	56852	ddbd2059-26dc-4dbc-935e-fc82d4015264
cmVbPQ	70974	1dfae224-86f1-4263-aa8f-15d45d0161cf
otGVSM	94332	1d77d15c-cafc-4fd4-bb95-bdf695758be2
kajokC	94963	380f683f-e1de-449c-b0cc-ace2952fffbc
hiidlU	84797	a02d72a7-7b99-4319-944b-b31b4599d87b
EPWdbb	78736	3d9ac60c-b374-483f-aac2-f24ea3d6ee8f
fZyJXj	98606	01a76fa6-5074-44dc-80bd-c1b0cdaee77c
zKJswo	69377	f0a05ddb-0699-4a3e-9a1c-beb39e5fac48
lPGxSq	91477	7a8d0a46-0404-4cec-b6ef-3cb08af6f7f4
IFmFWE	79781	b79746d0-b688-464f-a5a0-fc27e0965d7e
TqhkiR	97861	6f1f8b7e-19f4-4503-a19c-602a6d79d099
HeipWN	87301	bb10691d-0a2a-4569-bf5b-43ce1c757737
qwjUuY	50593	b053d345-2b93-4fe5-a7a1-f592fd8c9740
PeQQiP	95332	0dcfb5b8-1998-487c-b88b-a064340ec1b0
IZopby	94941	788554bd-0313-4a99-ac27-e082907c8a0b
yGMPEn	53942	1c2013f5-9bee-4a98-a08e-f8390679d0c5
rPdWrL	61116	d698fa2d-4b5c-458a-a70d-9c3e405a7186
TPlrru	69655	29cbcbf5-938e-41f3-bedc-0bad738834dd
wPdPQx	89197	e296f9d2-6336-4932-ba07-679dc4c583e1
xvtGdH	73934	5d61a1cd-80ae-48ac-857f-2cc5dcb13894
uHznNq	58571	c0acf906-c64c-413b-b629-05ef9ce32168
BAYJur	61994	5c66ef95-cc95-4e42-858a-5c0a77049723
UYVKuR	94195	7ba2271c-e40c-4e98-935f-8d90540097f4
yvFeYk	61585	6cf2a374-984b-4b8b-8a7e-efc9b1fda83c
yuJuHi	65953	63e9c592-3ac8-4f03-95ac-250be4d9a465
xVZsyy	96983	a86e1e3f-52ef-4513-9f5c-b6e1e29df035
AfBZiM	85970	22bb7ee5-dee7-473a-804d-82dddf49c963
kYtrSO	85668	685fe3f3-0ad3-4eb4-a009-8e430bf81249
MaGjPi	78969	60b7af62-1746-4169-a6e5-1218bd8008c0
XfviwU	99397	b547b6d0-0c3a-41ff-b337-1b047275cb05
ZllZzc	78604	c217820d-7b18-48e8-86ac-2964f10f8757
leloHL	53413	966a005d-f123-468d-a0e8-efd0fe13cd46
PSrQnY	65851	2d4d02db-a667-4c2a-8961-8ceae61e3df4
hlwYtM	96657	ac0ed9ce-9511-4d53-b830-720f5ec60a6e
QeENOi	82438	a03b2d82-8569-4329-a680-e8b2dac1285c
YxvPWc	72632	62c52822-2bce-46d8-a51d-91374552dd92
NIdxae	70479	36967710-6184-4c20-9404-6ecf18ad7751
NjFcDc	98677	00bbd3f1-ebae-461c-90b4-696b715df55a
ghTnut	98808	2947c80e-9745-4c7c-95c5-2935914cd771
thSyDc	53794	c5ef75e0-3a5d-43f4-8620-bd0c5c7df9e4
KtAhje	89123	ae8c0a4b-caa5-4a0b-bb76-cac0f5bf8b93
jxEsBc	65127	4e1cc71e-cee0-4621-9585-d207f2c05089
IQgjTD	87141	71f7e1a3-ea09-488f-b18c-c9a242a2a5b6
qCPnfm	83775	efc96fbc-0484-4ac0-a28f-f204fd58a9c0
qpVfjk	70502	26a0af4b-4225-4358-b522-27f0db492cd2
RUtMyy	74568	fb8d8691-ad39-4b08-8a6c-ae70eb285ac6
kLXlZW	51405	078921dc-d9fc-4d75-b8c4-76668f9eec88
EQBrKB	76831	df91dcb2-d8b4-405f-a309-c9bca04bdd70
OHbQWo	61380	056a668c-d830-4f7f-adef-ce796f875647
hsqWVu	51475	edf6f0e5-4cb7-4bc9-a0ea-ca4fa8018386
GiWmXZ	74134	e185f388-0854-4cd2-bd41-8be169a1e105
kAuXzp	62729	e116cb54-071d-444d-9389-10d3025db63a
lyrLIh	74540	77b57d5f-7a4a-4d28-8220-624bc0c1f1e9
YuxdRB	77433	1506f8f5-a2cb-4de1-97a6-c069c55b4b0b
AoENcf	68182	1b2178da-88f9-46e3-b444-5ab91dce7ad8
tfKHoy	50663	dd5a6626-ca38-4f14-834a-c60f6cf200b6
PefFSm	97052	c118d334-314b-4794-a8bb-793c8542cb0b
xnvEMC	61199	fb940623-c1f7-4006-8d7c-ba5d1453fa85
gEVXNx	92183	cbad3294-f52a-497c-9620-63db20d178d1
mzOIUu	99928	1df9b9c2-4167-4670-98ea-ea5f4bbdb728
uzCLLj	65888	f90caa42-8943-4f2a-946e-a544cadf416c
mLBVzy	80961	699ac1e8-bcfb-402c-9cbe-39dddc44eb79
HVTjIL	62869	5f7ad40f-1610-48e4-b88c-7516c29ba0b6
XAsCiJ	97683	f64177c8-dd61-4fe2-9b71-e592bb9eff88
EvbuIp	97726	63b97552-8aea-497a-a115-c28cd01649b9
XuKNuc	77290	8cc8e254-f859-4c8f-8769-2fe19568f0e6
cGnpYk	62543	18b0a1b3-d031-4508-ac2d-33cae3522a11
zyIXjE	56146	784e9ad4-da88-4af2-9fba-b4add141ec76
UEmUOe	80864	9377daf5-d8fe-4be5-9ee9-70bef8407fa5
tPzCgP	87048	6df0f4e3-4dca-490d-8170-e64f24e39741
oVomjg	90969	0140636e-4e29-4afe-a678-d4c2612d06fb
XyNyNL	76192	6613fc22-c0e5-4a2d-8805-b0c21d0a463e
OKDtUk	73336	9035f847-480b-48c1-bde0-454ca1154c47
YhSnRY	76960	76f1e961-1020-45e9-87c8-326897be7e2d
oYPerb	72364	56ca7e6d-310d-421d-ab61-a7ee2c1dc388
BZfLMl	55888	821e0eda-24c1-45d5-81dc-189fc1e13e26
rJESGS	80067	fe1744bb-e65f-4c1f-abdb-45c9a8894328
gRnYqc	63407	2d3c8dc4-3aa4-4e56-ac3d-e48bcefa2828
wTTygX	72221	dcca24c7-a864-44a1-96b1-1ba06705568a
gLHuTy	97348	8a3c522c-89a2-4caf-8787-e70b1aa6dbc2
HeORwH	91758	be057b99-edc0-447c-8064-554be798369c
PVkJAI	70700	15d25686-967c-4f39-ac67-4e7ec81bf062
aPgHXu	55291	7634735e-a40e-4f23-8e9a-5ad09152d606
pVDHgc	70662	8a0e5f70-4636-4255-b326-27197c7919be
CbhclS	59254	c819c83e-a3eb-498a-81da-745e20598f22
HURMHZ	89231	4d993610-6687-4424-85e9-32f5048bc8b0
XhJawH	95666	598683f8-1876-4634-a0e8-a85829975b47
LokLIi	97360	835c779e-6f5a-45d9-b752-2b534ef58cc2
aVCHCc	98677	f90ac3b0-bb8f-45df-9f35-7511b7e0539e
EkxGAT	53949	ea732c4d-0f85-48ce-940f-c297db3935b8
czOekW	98329	d53d2d61-bc8c-4359-8955-e82e7f49dfb8
sKedcq	98061	aee8fa88-c798-4622-9de6-6d330da42a20
blckOC	76333	bf2f491b-670e-4377-833f-ee8323e0b619
MTulDC	80637	bba27918-5611-45e6-8849-5634f441a6c8
HhhYjv	87279	68d13586-80e3-417b-a9ba-4acdb70948ed
iOjnmj	79799	61a3fcc8-4d66-4ff2-a6c4-67f5962b1719
UMVxnQ	56956	9fe73d4d-5346-40df-a2af-38f5ac983bd8
lILXQy	96023	5b647fd3-2653-48b1-809e-6c579e40d238
bKAkKA	95802	295425af-a35a-43ba-854e-786cb300f6a3
DbnjBV	57277	23a01a02-63e3-4db8-9372-634a9fd0e988
DunKRn	72379	0d87b0f2-fb44-4403-af49-efa8f00ecb58
zREiRh	95237	1ed46897-1e0b-485d-a0fb-a32b7c417dfb
dgyvLg	91382	41157a87-f51e-4c88-b3da-08376c73194d
raznzl	92263	3d7c1487-6279-42ec-8ac7-4c3fee2591aa
cKgqQr	69455	07eaa3bf-7a4a-4853-985b-e406e36ea985
hKCBsL	63443	1b3be70c-166e-4b07-bdb3-bb1f1d8c96ee
ThDBAx	63429	e246cdef-f973-4ccd-bec9-9f6b2e4fa778
RhAHTT	96491	dd93603c-c626-4db7-811e-342521563e7f
aoeCNf	89290	55f2b647-32ae-4ed7-9f48-520483d562d4
ADIgqc	69557	b24a87be-4579-4de4-8451-81ee7290788b
BgZeks	53976	4ad8f98c-96de-411b-afc6-100dee481b00
inxIaR	69154	99e8694f-f0ca-475f-8608-de47db8e3202
xjhway	73342	026594eb-ebc7-415b-8a57-e45a9dd2ecee
WYLPUA	71416	1a0eed65-c841-452e-bfbe-89a82820c522
SytteH	50262	66300e5b-dc45-47a1-9816-9e5f8c59b499
uzKiGN	82481	0753cdcb-5148-43b2-9e3c-eb7c72bd8a9f
SXVbjr	50867	fffb3d0f-54ba-4a24-bfc5-71b3c66ee07e
tbAvwD	91647	e8ed276a-9f3f-46ee-9079-e14a0860fbd8
hWNBHO	50489	51ce2e35-1cbe-4ea8-90a8-5d80f7a8c4b9
sJVlGp	67876	686ec47b-72d2-42da-903a-d4d63954e5bb
MQZsVq	98536	e432d191-2d21-42c3-9947-7e5f87625a12
ZOkpnU	77415	d9c72448-2d74-4897-bf8b-2d83e64127e6
rJNXfV	74607	b51599f7-9bbd-4e2b-9d45-c1fc8bec7189
yRIouJ	87540	aadd7847-73f9-416b-bdea-7653de74d1bf
FBnOTS	90543	c68dc299-02c5-4d1f-b309-06c6d051261e
UuwaeV	90802	5a1e4d0f-a7f3-4581-aa8c-6eabdfa84272
VOrkQm	89303	d32470db-449a-4ff4-be9a-c9da16f5edd9
WRwwsX	78451	7d3dc052-6ab0-435e-a971-fecb83822543
EmSrFf	92151	a26c1d69-768e-43f4-b34a-9f6a3138a03d
vbxaju	58287	365fd3dd-4b12-4466-8344-fcabfc0a8578
JSoUnv	65502	c7d63f3a-58df-4c60-9a1f-b12c3335ed78
oUkfIY	98475	b606a509-b737-4ef7-8de6-6b8afd6193bd
yKMqss	70649	91f5b01d-3379-437f-8b1c-2e6a6ff1338a
JBYuWr	84071	3f41da95-3868-489f-9d2d-0d35ca914f4c
LEaLUr	74350	e290aa05-88cb-4638-abfd-21cd8fad8f81
DiELmZ	96610	0434a94a-8bd9-4ebd-b6f6-ce29196bcbea
BkhCiG	65639	cf6ec69f-5b07-4d36-b08a-c571f207c047
yjSIho	50338	4d7446f0-927d-4db9-949a-af4033628268
CiHnKh	87416	ed7917b4-1d05-43c4-b426-3f651513cc5d
dNmXjp	94009	9820e0a4-0985-46cf-81d0-e3c3adf23ebd
QoVPFj	69323	929de1d6-82f5-48ae-a2f5-0018b4f73ba5
CgRTkk	80889	1ea17a8c-32b7-4cd4-824f-b16153f23dd8
QlRjQd	77367	4cef35c3-1751-4717-91dc-436b82ebbea4
xhBzeu	93503	99851795-1573-4903-8802-e0b4bb4754e8
hzhJxu	61266	3f7a1fb7-16b3-4ce6-82e8-40c70a9f5617
bDVEJB	58106	5daf1521-e7ea-43ec-8e43-490a320afc1e
vPxLZH	65416	2c5f5503-8dde-40b7-8c00-05b78789e807
nbHUjl	75264	5f1e86ca-75d6-4a2f-81d8-df312edba51f
KPAoRq	55847	9d8652d1-564d-4463-b4fb-8944f2128936
ytRijo	50121	cbc4d577-e333-4b13-bb92-bdb278d23c8c
QgwZFr	84214	44ea74a3-f2c6-40bc-bccf-c24ee77297f3
mbkYNy	89132	ea7edd75-4abf-4d15-876a-9adfb9db2e51
AaOVPl	72228	3ce5eda6-22ac-4c78-b588-e156c610c4df
hGBZJf	60553	68eeb553-6983-49a4-802e-27fc7902a8ed
pzlePw	81905	ae95bd75-8d3d-4fd6-88ea-70c5071e2ebe
jfcsCs	85404	adffdbc8-133d-4660-801f-f8fcc29051d8
yFNAfc	72546	e7565807-ab59-4764-b6a5-8c59b80dcc37
HpmJli	76427	ffe4d708-693b-48bf-a8eb-7c236b45fc52
pSMvRS	85593	ccb2ad57-1bff-4f8b-b3aa-20e0df7a5e88
nbuTDN	81969	64f70378-7f67-459c-a98f-160bfe7f73c8
YUDZZQ	94476	86c4027f-2acb-421c-a890-a10f0c4435ca
hGRvrB	84580	93cead82-f90a-46d8-bf76-52a9d9cfec2a
TgvElg	93758	04ea4008-0dd6-45c4-bccd-7cf8f358453b
nsXrXn	97016	c4b6101b-4500-4fa0-b009-fd5c2ab199b5
gWAZJN	59321	74497210-c0d8-456e-b9e0-c1681ef067f0
ellJEe	89039	39b55c88-ec40-4f00-acda-91d64392312f
kMBntH	99567	740bc2ac-bb51-4ef6-b635-fcc175517a61
YyziZt	80805	070380c4-ae07-4195-b76b-2c46a610d754
dEsYSz	83281	0a013f9d-ceb4-4af7-bc44-cf80d477e6e1
EGkXXg	97950	3bd65775-41d3-4a82-aba6-df6c010aa440
vuaFWb	99411	e1d2d88f-96d1-4198-94c4-db6f9de44c18
BRHyUy	92019	296f65d6-14e8-4139-a7d0-1d91988f4bd3
SEsJxj	61836	367d2e00-5a17-4085-a009-3889bb9157ca
WvnHhR	75891	53f930d4-77fb-4a48-8e88-4f143b42ff57
KkdiaM	83626	bd77b7c2-452b-4b89-9a52-2044e638c9b3
ayGRbX	64421	712c96d1-ea16-4f63-b9b1-8098ca862e41
RbPzDS	55274	111e6b9f-9ccf-4f49-bd98-c604f81dde37
sJiyuN	59115	ddb491ef-6f45-45be-bd2a-2c03910f7064
CnSboV	71513	fb6d372b-f6ea-4c05-94d0-f06a06956d9f
HwpPQk	66253	b7647ded-e1d0-4c45-8486-e7f6b9febf07
mPqOco	92436	f50f929e-d2fb-4388-a7ad-f0a1d60b62f0
ogHydV	63153	4efcddd5-1998-4bec-8045-2b5d903fb00d
mwqhRX	51323	97354230-02df-4a28-bae6-29b9a0453a98
ihvSXJ	84562	b1477567-adc5-47e3-aa66-caddebbf4240
DQXvFE	89777	200d9e86-5b4a-44a2-8357-221715fe210f
CIKqlP	71538	297d9396-bd07-4180-b05f-a39841e30374
RmxUyG	60899	189088ae-2c25-4123-b75d-fecd4ae67868
axLHvQ	94165	b4d92048-34f2-47d3-b3ae-6fc92d7de3a4
fMtZBy	55596	d5e90f3c-6e54-48fd-82d0-7bd007295a41
PFUkoX	70030	105965e9-921f-4804-9d10-c102885af134
NOkQzG	78640	c9f316e4-1b62-46a0-af92-291fce6f4f0d
KDzfCw	53033	0ff6231e-c75d-41a9-8b17-4b6ef82fb841
hGYiXJ	63225	f9c79070-f796-4191-a50f-1997fc35b036
nRXhgq	93275	99288ff4-36ef-4855-ab02-46eccc27ce5c
MqFeIp	72894	e8ac26c0-21db-457c-adb8-34c43d3cac6f
QxArka	92721	c9c43bd5-8fe4-4d3c-9202-c60215d9861b
ltxLEC	64398	02facb8a-dd62-45b0-a3a5-9ea43c88e7db
uKXCpM	58453	f2a128a7-34c2-4eb3-b424-a97276ca5684
URCNXM	75655	331d89e8-4c29-4c69-8adb-a1d38fd89e13
xJKNck	70487	0c4a700e-9bd8-4fcd-8a94-ab5594acdf5e
WMwOAg	89922	de5d6043-0ed6-4dde-b0ad-eddf29f479e6
nZuBgU	54284	3d9a0896-ebe7-42b2-82f8-1ef8b5eccc27
TEpayi	75095	6a2e4ac5-4aa0-4640-82ed-5b753e7e9aa6
dMMlxM	69391	8a3f60d6-8187-4466-8ef3-0b275fcb6b86
qSiTPm	66214	50456d0d-b8ef-426f-9cad-53f9d466f152
WhcxxX	87354	18cbaf75-0c3f-455c-8204-90a417ec07d1
NzinwY	50773	99f2f06b-219c-48a5-a975-89eec4bbe5a2
AnsnHS	52269	5ba0b5ce-6011-493f-a51a-c6d585b4ba05
UZcVsO	75032	b5ecc004-07b4-4326-bd0a-3f5e9d276747
wjYjls	64398	0ae493f8-5955-4a97-9e6b-e606407b3f69
kNqBne	51741	0fc15c63-38f0-45a5-a22f-516279674d2e
tbinjB	66556	4629e83d-decb-414a-87ab-31b66ef8ffbd
zWUoAM	64455	b3d5751e-6a34-428d-8074-a9fd59ded28a
fXQXWW	65619	8bf2e5d2-433c-47cb-a475-06b4f7fe4147
QeciRK	58301	2d7a643f-5e03-4406-a49a-f3e5db1509da
wFSwCP	63418	0be3d5b4-7414-4537-94c6-e8f22f976f83
cLRqUb	76202	478593a2-54cf-4aec-8a92-c83e4b09d549
CuecSY	62073	ec8ac227-b11e-45a2-a537-734bfa14ac37
HmIQVM	66835	3ed08e27-baba-4df0-9a52-c36f93eca966
iwRPOR	71683	2cded64d-cdef-4d52-86d7-380632b1720c
fOqdGE	67817	e2f3d964-d66b-46b6-8599-ca4401a3589d
DuqEwz	72206	32e08847-6b40-4657-9085-4dead76ae1aa
AYqecM	91195	9687b4b9-53b7-477f-9100-76775c9b2a3a
KNHPtE	87932	43719772-bf73-4d2b-bcd1-94ae794d4673
liwXUG	91199	c79c6163-fb52-4f7e-95c5-3acd5ca0a18e
aoSCdf	77193	a8fb59d5-c8de-4aa6-b9e2-f1a36aeced1f
WQZTvY	57813	64128c86-43f2-4d07-b735-a95e3c01b458
OFMqlc	65172	f5fee358-bb0d-4cc3-9740-9d55f8e5ae90
sdQMfy	79186	49bc2e68-2863-45db-8c55-e303cf36eedf
ChDXQw	82014	85fd24c1-2d43-495d-b275-a01bf4f6230c
UvgIJc	63074	d108ed82-035a-4072-b75e-c9dde8733da3
rAUSsm	73684	4e0048b4-919f-4d1a-9c57-78bf6819e192
qXaxKq	81135	aff3b0e9-da46-483d-aa80-0dd827ef56e8
Otsfyz	70277	d40e64bd-7012-498f-9297-5f7c6e632b52
pKFrdN	64295	5c6932ba-71c5-498f-a3b4-e1ba1566d058
tUkZMn	67361	6ff7ee95-71fc-4883-9e09-ce5b3dd67fcd
BIakhs	74889	89f9930e-9c3a-46e5-9794-4c800f74cf1f
mZiXxb	76410	17fba5db-ac88-41d6-98b5-3bc424ee451b
pnuUsB	76417	f8f821f9-7c95-4c7f-95a4-34c1cedbe2b7
XUWmUW	69655	ad01dccc-aab7-4e95-a52c-ad4d569b3413
ZweIKW	69621	c31239b7-4928-4127-927b-e53dda04b2c9
pzKRcS	71198	db5b4a51-c6b6-403d-8305-84fa05574ec1
TBdxwB	74933	7ac35616-d153-497f-9a58-c19488877508
QObDkb	91266	9d8560d7-342a-4fe6-a8a8-d7879c2ac5bc
XgXBgK	50910	e33a7306-11c8-4893-80b0-a5a9e9119deb
TFgLPs	61199	0f282131-7397-407c-8e85-de84de28fb11
clKgwT	52627	5abb64bb-fc14-4da9-848c-1f0fbea6a7c9
OvYVsJ	82472	572ada38-09ff-4b7b-9af8-79b322178ced
MoKpuW	60062	33b0e4b3-e0e0-4176-b8fa-c5a346755415
iIzAxN	57004	b90e5ca4-18e2-4768-832b-190fbd20ce92
eqVtSR	84518	bc2b3b4d-6823-447f-a6f6-c82a66964092
VRadba	72682	4f38290e-4959-4ea9-89f8-e7a6eb3350b4
XRoUQX	99371	ad77d1de-9806-4b78-87da-f44c6ad9989d
usmbfT	87107	973b0b26-f35c-44ae-bc76-10c96f93dfea
xqwOAG	93634	d33147fb-5805-45d5-82b8-7f683befbd04
GBqfKP	71672	349b3f2c-49a8-4195-ace6-303dffce0979
ORizgr	67725	584f0560-41ef-4157-9ec4-292db5776584
nEfEsL	56938	71698e2c-0342-4249-a313-e8ae4fd0bca5
RewAFM	88260	dde62b44-138d-4b83-bfac-b3036796315d
nSxGTl	64421	8a75ef77-7f09-470e-81e1-17cf47bc7a58
MXsUDb	98554	e2550675-05a7-483c-a4f5-879b6f35dcfd
qLJuSF	86805	7a06bec8-e6fe-4d93-9bff-170373a684f4
xiRtNL	61733	75b1e32f-de9a-439f-8d43-f311d4216adc
xNPfDq	82929	80c32a37-74a4-4108-a271-c1d4a64df149
iuuXHj	52461	76c1356f-84d1-4e6d-8945-736ff64e7eb3
PkulEN	69544	cd9a79a4-8570-48bb-9b0c-71bae50142b2
PDgCAn	82460	5cfbcf9b-d9fc-4091-bdb0-1294c1ad8a00
cnhodR	90765	d66795cc-20ee-46a0-a533-ecbb4ef9ed97
VYyisQ	66569	9c3a793e-273b-45a9-b59e-b16d05e2f5f2
NUbVZY	72462	c6ebb6db-3cf5-4b5b-91c2-2eeb94f110c8
clvYqH	56415	66346fe0-3837-45f5-82e0-407df0c6f806
MhChZw	70956	c38b9eff-1851-4bd8-9a6a-415bbf5bcdb4
Ubcjke	70659	d1f1a4a3-7508-4874-93d3-bd6416b95c54
VLJpYh	94215	d00b1c32-de91-4836-aa8e-6578dfc243f2
ybEKfY	84265	f728be27-a59f-41a4-96e0-ffb40b00082a
aSJwxe	74137	fab96037-ca3e-4bea-9af5-c7eb6c4f81f6
kLmdyY	95181	656e613e-bde7-43e2-9f02-f22b764530f4
VmmUcC	57082	1f6c4478-a20f-4fe4-83db-5553fffd4335
PSwzkw	55643	02f50c19-1262-4fca-9b6e-71fc738a59c0
fQUzWj	68425	38c0d8cb-9fa3-4d75-9d24-668be3be2f0b
mTHyjw	56687	942363d5-e82f-4283-87fd-2b47976885ab
npHAaU	78800	c2cbf859-1348-472c-94e5-06eac5c3cc45
fgvMcf	91065	cf8726db-f915-4d02-bc3a-722b67fdc13a
nKqIBv	99097	9e023499-88e3-4e31-8a2e-d224e380cd7b
OScjWY	56021	0afbf9e2-3a7d-4ce9-9fb7-9714bb7366af
eFLjSy	85595	1e5631cd-e6ef-4e31-9d3c-6cbe94e11861
ovOEaz	96937	adde98fd-2479-49b6-b46c-977df56a9cdf
IVZkJx	96221	537f6a91-89d3-4005-8fd4-0fed7db06572
BmqHKE	86651	de9ca603-7be3-4eef-9932-0d8192769ab7
KDfMyb	98811	1c0c3aaa-0eb8-458b-9d28-eeb9b6d538e7
caimLd	84105	eba85140-76b7-4d8f-8bed-4792644af2ef
GfaJnr	78480	e6b9a4ce-2941-47fe-b043-57daede692da
dejqLQ	98592	e1128acb-9cd5-4402-b642-60d7034b1ef9
CkEwyj	74444	d2b27754-d7df-4bac-b188-c029ddbaf2a2
tdOica	98193	e1152138-5893-4516-bcb6-04bb86e4e2dd
XGNozL	88158	3bfed4ec-1059-4d87-8bb5-9e21cc36ed51
dqOrSw	77750	13419842-c40b-4caf-b634-c33e9f2359dd
kwWrND	70249	82a27410-4253-4218-9b9f-eff0440a39e3
ftuaGH	78033	985d9efc-8453-4f84-81b6-6126c46312fe
ddkoAR	68859	cb6f5ccd-8929-474f-b298-df6af1378128
dhmNew	64514	6151e5ac-99aa-446c-a1de-5f3dea3782cb
tqablM	91917	6853904e-726c-44a0-8257-9a1a546fdd3b
LtxYbD	54328	58988cea-9fa3-417e-82c5-ae6ce453fbaa
zRmGaX	83856	98d9df51-1c44-4eb4-b188-0cdcd8390f67
OnSkld	59157	f9e54207-832c-40a9-a5be-8261c2a05422
HyRUSp	67443	3a9d36fb-72dd-47aa-babf-b8b607855acf
ypQZwW	75468	35809e76-2019-4ffb-b276-c72a1b366cb8
liVYmw	90186	e601e047-3d46-41ec-84c1-f8ee85b9e65d
MKyHOT	80427	20d21eb8-b331-4c42-9dec-652ba32c3f55
SZvyPy	83365	1065951f-0d09-477e-8289-f882da6eb394
yZXQWZ	60559	1ac833d0-618e-420a-894b-c6b7690cb18b
FownZF	90374	ae5659d3-40f4-4fe9-b55e-2ac0ffe258c0
jJwFJw	56350	ab394a31-084b-446c-a5ea-c687dd1fcb4f
SDpgGk	81537	44f685dd-eb75-4d5d-89a3-ac3332d200fc
ELRbzA	57032	75f5750e-9861-4e1c-b857-d9ea44d7e666
JLWcvS	61510	1d58ea4f-4a13-4b8a-aa95-3bdf0f997534
rXvkLX	65026	667f967b-3a1d-4924-adec-993eba19c9e9
nMEWTp	71509	376b56e3-4fca-4be2-9bf2-8f80383034a5
QxFQxf	90048	77770f68-65a7-4d8c-8894-7f735abe85ce
yBCAdk	76965	df1d070b-9c52-40e4-a5e7-c11acad697aa
KlBsiJ	75232	966f1d09-3c13-44b7-9a63-027c94384565
nKExSo	81542	6108cf3a-7765-439f-946a-26a2441517fe
iLmoZs	99505	d03bcfae-1306-492a-bbe1-5634064b5eba
nqGKxS	65665	67970909-fba3-4af2-8862-7f8d0e3c8cb6
CwdiLh	62161	55f9ff69-470a-4a3d-89a8-2461d2652cd9
UDMqkn	62411	5d4268c8-418e-4cde-b56d-66fe20d34702
pFMSlk	61761	d9dadc92-13b2-4dc2-b1c2-aa6a0322c754
tSlRxG	53061	33f5dbf0-488c-4416-be5f-753b9865da97
IYBcbQ	58592	409a33fe-6f4b-42f7-91fc-fee30575d7e2
FrVXOr	78071	7e84fab4-a8a0-47ce-a0d3-8c19f2d833df
UdueJX	71893	7009ab8c-54d7-4fc2-a0c8-4b5adf90e36c
iZOOup	79923	3323eeee-4394-412e-bb7f-f7d8c7df68cd
wwrCzU	97254	160339bf-c08d-469c-8d06-7c5b4abba583
JORBJW	83676	d5dda455-9c11-4061-823a-06ae689b3e47
woswAq	54277	a2ffcfdf-95d1-4e0d-9b6c-488e928f7d0f
OhMsui	61333	7eeaeeb7-4a75-4b8d-acfe-6214fae26311
NLVkwg	69590	9e9924c6-4aac-4332-aeb5-5dbd2292e4e7
bRQvwM	75362	c95f6994-9afd-436d-99b8-f9511a8820cb
ktrEWm	67797	f7e84a79-b24f-4377-84af-6c3dbe3110c6
pledro	61328	f9ecb330-a6b2-4ec2-acc4-fcb1766e153a
xMXurb	67738	11261e3d-04e9-472a-9418-1ae6ee0deba8
yhpRPO	70514	ac06dcc0-1165-4b8f-94d6-49d7aa701ddf
cOzsQm	74188	3321b730-e943-4988-8867-6e679cfbac0a
skjjvN	80199	aeb48d97-3678-4e57-b025-550e73e79681
thRuMY	97507	89e4c0fe-ead0-42f9-ab51-e8bafd6ebc72
KMAtFp	64177	d6a41696-d302-468a-9fcf-dfb77e4429fe
gHNZtp	81778	28998211-8049-41c7-b123-850e74280d58
YTpvak	97550	f283f129-d9b2-4a86-9325-3f500b7d038e
JHUrBg	76588	2385f00d-ef9c-4f12-b35e-657796a5e606
wZDUBw	77027	c7f8f6e9-b835-48e2-83be-09470dcf7805
Vntnlk	64305	bbe99ba6-b162-42d9-a815-050691628c31
MJpueB	63654	7d8b57ba-34de-4366-82a1-7758c7d0d4de
EGRvzO	80386	6fb44f3e-1201-4657-992b-342c52476502
disnSZ	68922	83fd1c90-c26b-4b3e-81e4-546c282d71e7
XmtaZj	58117	c39ed779-06e8-4db2-9131-75d2afec1bb3
xFKDRw	97584	84868885-63f7-440d-b435-d4045f26fa10
qGATtu	69552	7a40398a-454c-4522-a2a6-c77c94efe5a3
ChxbxS	89470	b04c8791-894e-42d0-9bd7-c35cc6a37a17
PaNLhh	77875	901e8281-8566-4bcd-9cbb-debcf220b355
MFLBZt	94891	46184e13-18a3-4505-a96b-057e36cd07f5
utTzuY	91669	d6131942-3e47-4fc8-96e6-61eb392fe6d9
oMyjmD	75438	bfd6e042-3a57-4582-9b46-eac4f7c090b4
NSAxIt	73333	c6bdcb6e-ced9-4871-bfb1-0e44dad8c814
rDXfhJ	85770	414950d2-8e7d-4286-b259-a129204bb8a4
gbeXIl	73872	49cc4561-6e79-45b1-83ac-36147f70c425
PwGWof	59675	fb8cb64a-7efc-4ad6-b686-54b5ef0ab390
ewwkfw	92451	3c464d9b-68d1-4859-8ced-6ca6569a13de
ianyZy	65101	d9d89a49-e05f-451c-a1b2-eb5423a83afe
jrbUDB	71677	b624677d-4a4d-4ad6-ab34-1f293a075343
nBnnoA	90029	e6bad23d-4a24-498b-aac1-ff80ebb7eb5f
YPomsi	96291	7b7faa5d-f0e5-43b3-8220-973f756e985f
lFFrsg	74726	ab0b5f8d-2f3d-4598-8434-28ec99bc0725
fPHNLk	56268	6e87795f-f1c1-4017-8006-d9b50ede43b6
rOsprJ	61742	a636d660-f85a-43d7-beb4-dec58e2375f0
OeguDK	85336	11633a07-9cc1-42d1-9732-c77d94032d01
AGYgGH	78194	c17b75dd-d4a4-4417-ad87-2bef93d93ce0
wyxvvy	78847	783cb308-2ed9-4d58-8e2e-6f847eb076e9
UgNjuS	99803	98195a50-845e-4f15-8170-ee64942f6bc0
SSfKPu	68675	05f88360-165f-4085-b981-e4c1bcc2182d
ljidUx	84562	1a2d9d90-83d7-498f-973e-50f56b010b08
iXHZxp	98305	27baa066-4990-4a9b-b68c-e515686a7afa
wICslt	61694	4a4a7256-2274-4a70-8450-9c5ac292ce92
kDaOmE	98704	3fa1f919-257a-467b-be30-27cfe940395a
EpIcIu	68755	5e4421b2-7a14-4306-836e-1799b0ad0679
DcoMmO	50826	bdbfc2b5-c983-49bb-bac8-7d2677fec81c
eccnLJ	57916	33d69733-88f6-4458-9a10-67fafa4ae200
mrorLI	88637	867c12a4-c03e-4a72-93c3-0ccbfef5a94a
qlJYsw	86256	f8edac4c-425a-4d0d-8e8d-26ac13ad5c09
ExIdmx	52064	9db03714-6745-4f2d-abc3-af10af1690f3
AprCFT	52239	270b48d2-df17-4200-b4cb-220ab320f497
iNVWcJ	78878	515e7e72-9d2c-4d72-97c5-2c572d817774
FYzgsb	94284	5685bde1-993f-4b33-86d6-ec9dc008cd95
LpEoAD	92954	3346289c-caa8-4a98-827c-f12e7fe31826
ztAKIG	65966	888bce29-405c-432a-94be-465ec480b271
uwvONf	66402	3d5dae4b-4056-4ad4-a22f-1e1e8d62c65e
EnsuOp	64673	2b100bd9-ffe7-4796-a378-4f1092cfa053
htrkiD	74213	74134de5-2f7a-4c87-ba67-a1cedd4c5ed7
cfjAWX	66691	258427a1-778b-455a-bfe2-8a24b8fca138
Fjsuqx	94186	710101ee-6891-4865-933b-dab0faf3e4f5
LOxYjg	80678	7adf316f-f1d2-44c1-8ca8-44706291d223
CuJyoz	97891	a4f9d5c3-d1f2-43b6-be63-dd745c229682
ONmEzU	86294	2058fbab-1e18-461e-ac12-262f546c547d
nfEEGD	53815	19fad852-fe87-4722-b9f5-9c833592af24
AuVknI	92371	a57cb291-dd7a-43c2-8735-14862ca3efa5
yqCOeN	78544	9e52784a-cc47-46b2-9e57-3bfcb7a02fae
Brvaju	80978	ec57941d-c58b-4ca2-b7a1-0b3e9f361036
ykwdCm	54277	88358b02-835b-45b7-9018-7613b5370478
bOOsQm	70352	9acd72c5-de47-408d-beb5-ecdd47fc9e2b
IgVyba	56725	9497cb2f-5674-412b-890c-8675380ae36b
suNzPv	93756	aca61950-7bee-4e23-b6d1-f7f15200a8db
bnymHg	66635	a9e273e9-0123-4ac3-967c-10423a96c303
quWoHE	87809	a175fd05-2915-4d45-9cfa-9cdb8f29cb90
czcHxK	90496	f39ac834-b50d-4a7e-a1c9-892857b44436
OquTnj	63237	b65252c4-6b35-4bc3-8a5b-db63f90e1b48
QRMQPq	50437	a281d580-8143-4702-93de-f2292c381429
mvikkD	79014	f0c23cee-7484-4a61-9f33-e7feb573f0d2
WoMlrf	94519	b148637f-1940-429a-872b-457cde4f6a06
YNzKxl	91940	805f64e4-082f-444f-8290-b9273db2a02c
flFRPR	92749	3cd2af82-3018-4c7f-99f7-27d02d7833d0
nMZNAP	62300	aa517c0d-a630-49f3-8055-8eb9b699ee67
fRSPYH	72008	bd36238c-d68c-4247-9211-5f9d7763f0bf
PCqKbD	62824	95de906e-24fe-4153-975c-61a61f22ef26
umsIBp	91004	e0d8a928-d02f-4a9a-930b-c03fddef7186
hBNxfz	67982	25083842-b66a-41e5-a9ee-11282f1f92c7
muNVNV	68627	efa8907a-ba93-4e4c-a8b4-dfdf2975fb67
uJTBSS	93660	f5c52831-bfde-459d-b8d3-c194204ea7e5
GKRZkc	95945	bb561b16-44da-4d7e-8318-d26455660d1b
ABkeeg	76237	d0e90565-d661-4c66-8ef8-d78265a4d5d5
ZQHpDy	66441	819af003-a604-4ad3-b3f5-980f651dfce3
MhxsWV	75494	186fdfc3-1288-445a-a325-2824414dd771
zRhpvH	72458	36834b0d-45db-4508-baff-c4e3aac1f567
uFSLYU	67101	2a7bdfb8-4078-4676-b3dc-53e8de678259
gDNoEt	89114	f16f89ff-c408-44d6-9a8a-11bed826d00d
BomsGX	80313	a815a6e5-d85c-4319-b7d2-b2b361768569
mmflsu	57981	bd1ef566-d740-4738-b54a-e5c9146ad096
ALlxab	74433	bc9a7652-e28b-4528-b4d7-b6561bc5ca10
BmyvTH	72990	77cfca96-ae2d-4c01-ae23-4e32648a2d56
mMHqey	81045	33e3b47a-1113-444d-be89-25d1e1888378
wnfQDH	74588	9b0ea2c1-9bf0-477a-9d9c-67083f9333ce
SlzUxv	62549	c8212611-6435-4306-ac03-2ec967eb0464
CTdJBB	96821	b2a32d0a-683b-4f11-8184-bf788ecb6497
GYvKVP	68245	7aaa7140-9f14-4246-82bf-65f1337b0b80
HbHpyt	69413	ce1c399e-43c4-4fd9-8210-f065c8fc18bd
hQZxrD	71751	42d39ce9-bd51-4b7d-8ef5-23528e94e101
LCKxwO	54193	c9fd4285-85af-4cb7-a554-5659c0c06c06
bQniIW	87656	5e0c91da-d90b-4ca1-afac-690b42b24266
LbRlvZ	62932	6f512b89-77a7-4c41-86b6-7387e6d629c0
zKZxCb	68753	c732ae9a-9839-4810-bfc1-3f793af950a5
SGTiXJ	91909	cebf6b65-843b-4be6-8480-00c3294b3ed2
sQduAR	50164	41d6b7e6-8a4b-4ced-8b83-09a930512efc
aZaLoU	91596	9b0a82d9-d9f6-49a0-a9b5-8d5d9502510e
yFyvog	95985	72bc4ee7-2f60-472d-8c49-ba200a08980a
skVNhm	75102	ea07ffc1-1c4f-4914-9201-ea4e1ac538e3
liTJHO	70062	e9ccfcb8-9f64-4230-9ec9-76067a6e0f32
fQvAVm	98257	55575a71-44e9-44a6-aa60-b12f55ef2027
oRWHxN	77568	42a81987-e555-4a9d-af5e-51b55ed47a70
pOKcGl	79072	a61ee5a1-03c7-44ed-af8e-d636b3c11aa5
PLcdge	74691	84527a12-8f8e-4341-ad32-53e07c4e900a
DfBPjS	56714	6cb0cca2-551b-41a7-89da-69bd32ffbf21
Bdflms	98377	911b706a-6fde-4ea0-9d0f-9f9a79e6f93a
rwJnJM	72703	dded1071-7cd0-4852-9919-7ebaeedc4241
UyUgcN	79221	8dcc944d-6397-4720-abde-9bb66ee4570f
xGHbTs	78623	2a9a2db6-a997-47ab-9da7-43a3c1a68a61
KOKtIk	66353	086360a0-6ccb-42a0-af08-44c908d82a7e
RcHEsW	73779	6d6c3f81-c8c2-4b15-992d-fa29c43aede0
WiefWy	51193	f0b86c9f-1156-4ef2-a123-e9d3e5a66aa1
UKWiGT	80315	b2cc2fd6-2c7a-41b2-905b-6e4b00bf2b56
MSlFCf	65870	d96bf0ab-37f2-48ae-990c-84a021cb645d
QMLnpG	92923	e909e024-1183-47a0-821c-4a0af5c9e35d
UxmQgf	69550	ee0bc228-176b-4208-a1ad-db85f1b9b916
WwVuPF	80001	b63a9400-62d0-44f3-ab7a-e0641ee0c3a4
jQpMoi	59459	f4a4a1cf-3e45-47c0-b30c-5f0c90eedf93
uSnhQm	59694	7d8f5dff-9cbc-4e13-b5fe-655ec6fb3576
jpcVNK	88972	bd6c4a3a-231c-4edb-8806-c77a7959442c
ecSuzg	99955	6f4c808e-e5c9-4010-92ce-7e0f62887d3e
vkcxAK	57310	7dcd86bf-34e5-40e0-969b-e3108811c3bc
awcFTx	53903	4339b507-95db-4cef-bb7d-a77da7bc6a84
Inwclu	56542	c7386e60-45c6-4821-8cd0-0f4ed7679486
NEbPqE	52039	4722d3e4-b276-458e-b262-1e562f4123cf
BWuEbS	79895	0eb9a8f1-3089-4d2e-ad3e-2830753dc74e
ZnLZbQ	60550	9b767c0f-f16c-416f-976b-5d4691af9927
Ytgond	73187	15a72235-84bd-4f80-8662-debe6cd5f012
EBeOQL	89661	9737b48d-7708-4849-bf47-2ec5922047d8
WSoIFk	64365	890cf8ce-78d3-4e5d-9de1-12e39a4da2b2
ahgIpX	56271	a7ee5dce-82ab-44da-8188-5b7cbdb48c19
ngKYry	78131	f55f9ada-f924-4e53-97c0-b57960496532
ubzsjS	70467	55d1f373-965f-401e-a90a-b9d7e6c8f2f7
WbCGpL	99580	6577e847-3a99-43e6-9cff-0c50efa76090
lzFCtn	95214	42f2eece-52fa-4dec-b7a2-181d9f3d7567
PkapfD	64653	8812c3a2-3104-4d3b-afae-a7e94fbb06cc
goBixO	80777	a653d893-df86-4d17-aef9-e2b324bfdd3d
LCkCeI	66222	6cbf7edb-dccd-4c4c-b3fe-b57e6e297fec
dRoYev	66737	ccfacf81-5b98-4d7f-9cec-f1d6b9ae1948
hTTrWA	81873	15a32201-7fc8-4235-b233-e734f860bf00
jyNptM	51999	d722d47e-98f0-4cda-a18d-993c7e5f8fd9
SOydCb	99234	f1bf2dd9-7cb7-4abd-b498-314c51942382
hTIhTg	91611	f57e577c-a670-4fed-b800-072697091365
OtTPmX	94990	3b44a3f2-1202-4f08-b2ca-db362645b0cf
GDLLYU	80277	b5f9a045-1d78-469a-9858-7899a3bdd40f
LQVORX	74547	2fb46086-5604-4a9d-a8bb-900051c2b096
bKPDzm	80391	769dc051-8bac-4c83-8197-ed70ef9f73fd
wyRPvu	80511	10510538-0274-44f6-a054-ee7143deab1b
ucdXqE	57233	c3b4d3ef-1d69-43ca-ae7d-5c6b95236cc9
NteZqn	74551	98ef3f63-7772-4bdd-a9a4-a66db5dcf4e3
AUvxjN	79508	aecf28ab-a9f9-4f29-a50e-87287f25d945
pEeoTv	62634	78fa4a55-0c1e-4acd-87b8-a68f35548cf2
juFNDe	60662	51167ab7-20ec-41ac-80a9-949011b1a211
RXZoSp	73255	9db3af92-7d58-46fb-9fbb-9d2cd7c215cb
Xvjefp	96117	a97ce608-cd91-49bb-a480-614e2b29a528
AwZShp	59450	1585b755-c66b-4fbb-ac98-fc5a0e584721
MTTZRP	55262	3a81dc18-65d9-4b6b-b782-3e43de5ff0fc
gAprmg	53778	79ce9b09-edf0-4e30-8a32-e58c7d1b2952
RDMyPK	61614	ea8e28ba-445c-4b0c-824b-9e1382581490
huHndH	85083	3fcfb8b2-1db2-4661-8514-e81ac65161ca
oGCxYw	91631	d84373b7-68cb-45b8-9754-e1bb940d54b0
KMLRKQ	71191	031a0f49-9434-4484-a3da-702c7b01ec90
RPyyFP	54780	32e697ca-614c-4f47-be99-b1dc21ffe0f6
BXGLHe	65323	8ae52b78-0b88-4434-8f84-4ccbbe3f3948
sjoZHZ	52358	df9d046b-b048-48ae-b48e-2e85962d5722
ZFLTbQ	85848	dd93b81c-8a7e-4925-ae89-828c29096380
ASezvn	58528	e07cbee2-ec60-420e-abaf-f4e2b14f7168
TjsonV	64035	17d1f359-a7ff-4237-a92f-dc064af90306
LpcOuy	97306	4b9f7133-e457-4f83-973c-ebe8422e2e4a
GMEjsS	95840	d1af6030-b0ab-490d-b258-00841e9a3e76
PFfgfX	98671	d7623015-576e-48d9-abdd-72368df7377c
YcrXDT	57339	39da7d00-2de8-4028-a056-46888386fabe
oJGoJg	67516	faf9bd19-f5bd-4f95-9a94-d3eac3335c43
Gemkyy	53993	9fc9647e-fb3f-4ab7-a610-73441a6d419c
QLDZoE	99226	111846f0-3dd8-451b-be97-ac3dcfd3fe52
kfoIFy	71389	0ef24c6f-7bff-4a47-856e-d1e541693ff4
nNTBOV	70844	70a8bf2b-210b-45ff-afb7-50aa1369b1bd
uiJZJk	75781	9eae7a0c-92e8-4fcb-97a9-ce8f5b80e8b3
iiddMh	99853	3d63b85c-a6a3-474e-83f7-d5c38a819730
wgvQWS	62360	c2e9e962-7231-4455-973d-27a2fa4c8485
BNXYvF	94367	03ea2319-9da9-48bd-a4d0-6dee9ce1ff59
DdZbAN	56216	effe865f-36d5-40b5-8dc9-35576fae5ad1
pZQJpy	73968	5967e87f-06a1-4903-9dce-d60884f73de5
oNBzIH	60372	d683cd7e-0980-4901-8247-5816b49f0451
jYcLKY	60462	8dc66840-3da2-4263-80b1-f2729ed407bc
ujswAP	86265	6977953e-e54d-49bf-8d78-9d5230717b81
qhhKAV	56102	66e7e9e8-a9aa-4e32-890f-2b9c93d09725
XVrsZk	52375	f4321983-c93b-4b94-b5a5-c56630a45f33
AVChiR	54435	2a4b6e86-113f-4dcd-a65a-941d3e833f6d
ImBCNz	58391	960e1e45-116c-415f-94c7-21f3c6424b4d
TZMKHQ	53452	e06ed662-cfca-4c05-9168-fadb4d1da276
yzqLNh	96075	b0e255b8-1c9b-42e4-a675-324ef1278832
tHUSyM	85669	0e029357-80cb-4bed-8977-dfad36eb766d
SXQwYW	65032	da7415d5-f83c-4741-a68d-0dbd2ca94b59
eGBCKE	62712	b0ab8f00-b0ec-4cb5-94e8-3bb801316e87
sChmhr	85200	268014aa-c215-4f3a-be50-3bf9d7aa8954
ZpogxV	62669	b87bc2bf-4fd0-4736-8857-eae9e14cee65
rREyYQ	81657	597d852e-8ae1-4dee-8c3b-cefb23bcf922
WMjxUJ	93423	b242bde6-0336-40c0-ace0-673c90fe7c76
lDFFLu	55499	79ec7c9c-ffc7-401c-aed1-facef41975b2
OnJWGJ	90933	20da3237-953f-4ae9-a16e-cf779706b116
vCItDe	69270	5c839a05-6245-4e5c-aa94-976d89192ba2
RvbNJj	85899	87676a4b-7e28-435f-b8a9-93ec02ce3695
kAXwrX	54974	5ba25415-b47d-4f4c-8ce8-53fe2788375e
zfPzIs	82704	c53a8aae-5c72-4bd1-8a8d-adde7fe3f71d
QGbCtZ	89123	74844dd3-f645-4532-8d51-38d89520c25c
XCzBgK	66777	2ddcfb04-9f2e-4417-a364-53cf6eb4163f
ExezNt	74220	4b06787c-7ae9-479d-9b15-417333add7ee
mHInTw	66371	a5bad9ad-36db-4232-9f26-e0c2335c9f5e
iVhtZN	55138	bdfc9a6f-aef0-4a4d-9fda-f69efef63f9e
xVTFgp	64684	6f62aeee-b584-4355-b4eb-380f896514e9
tHDLlj	69128	92932ce1-01de-4b1c-8f2a-0d45ec0f2d94
Anzryb	66357	d0ed4e17-7f13-44c0-8b1b-0c076c2845fd
yIczBG	71280	f3c71ec3-0a64-4bd4-aa93-8765b17f24d4
jaUIGI	98877	d93790a3-a892-49fa-98a4-f584655c07d6
BWVFZM	51102	2f3dbcc4-47e3-4ff4-abcd-fed8246204a6
ocKqWX	51830	b74450ff-113b-4411-90e2-2207ea25d3b3
kcfilG	72578	152d651d-e44a-4075-adf1-78fbda962d76
nDhJuy	92451	2de8780f-44b0-4d23-b957-d157a778a340
UvJsbP	68233	2d7aec31-7a46-44a4-a2fe-22b0b84ba1f0
PuFJrr	64690	d231b2b2-e240-45ba-804f-f304f11b247a
tksDjN	77008	3309300d-5d0f-4753-abfd-48aafa3bf812
fULHSp	74696	e6b9ad59-9c15-4c21-b020-ba0219bcbb98
DRVrGw	82572	9adf0098-ca01-4d92-8452-05f2f0361b39
YVjhvS	89035	05cc960d-794c-472d-88bc-459e1d708140
IRViUj	95442	2cec3fe3-4d86-453b-b2f5-9a9746c2d18a
wBrgXd	95781	9e810325-b589-444f-8362-2db7799b51eb
DuPLJA	91547	cd06330b-35b1-4240-92fe-146b4b5fba21
WpOBhH	68255	dfb13e98-fbd6-4f52-9fca-751962341654
mtkVvM	74981	69a16cf1-0f0f-4460-8fbf-82f02209cdd4
QvFhTQ	54495	e9cdad34-d18b-44b3-bb2f-c39b866c3f7a
MGINeg	96211	65e8db9d-4d3b-4269-b57e-9a932e195c4b
dIrwws	81056	985d1285-7c2b-4338-a0d5-9e78665cc6fc
kEMiKs	98955	bffd4660-b637-4fe5-8fbe-20ad5026f517
TRxPxZ	73647	4a48c1b8-c7da-4eb2-8f34-a5ec4976e118
yyQpyJ	83579	ca59722f-07ea-4056-a4c9-282d5e1c5330
SMnDZJ	52953	984d26aa-462e-4e81-ae49-ba19ebb7ddaf
YtzGbN	55083	68bf5ad6-f4a4-41b5-a05e-85b797aa90d0
OuoBSC	58661	1a54e3ea-2d7b-45e3-81ee-7f9cd891a986
deewUk	53027	c173b12a-09fc-4c66-ad04-4ce524e6153b
VhrOVF	77362	f13fbd98-aa5c-4a10-afcb-3ec359aea8ae
ulgnOb	85960	b4b7947e-9634-4229-99a1-eadd0bb68b38
GGVpEd	79629	d5aa2cb7-9e75-461f-84ff-3c759e0411d2
iSITxN	56013	3d572043-8922-41e5-a54b-b750e282594f
qdOHAF	75716	8125fb16-cc52-4399-8811-a08a06d74ea6
baZNcY	69938	f8586c55-e58f-4e1b-8f28-acde11ded1d9
CDgnTu	59024	885d1bd5-bb8e-448e-88b8-aeda1e7ed3c9
MBNTvp	71629	df54c317-837e-4dc3-a890-dc7299f6225f
FdLlRJ	89252	4bac6e89-4c23-42b2-8377-6b9c4c6cf9ca
JocQje	73431	3ff18286-82fd-46d8-b313-e0480dd019bf
ucfubk	89509	d40c72df-dd46-4747-b6a0-5bdaf9847a19
nQViCv	75242	14799d02-d555-43e9-96d1-f4ed1ee802bd
XDkrga	85982	f771cf34-ae82-42ae-a27f-1df1aba6fdc5
OcsHbx	54924	a546bcc4-251d-47df-93bd-3bc5f720a4ad
LcLfId	65084	f06d7ffe-a7e1-4450-8520-a401880a9903
tsTGhK	51132	26d98f4b-9ab9-435a-87fb-1633b104aaf8
eLwjQE	77177	1e7eaf42-bba5-401c-88f0-c634367595a7
HPCtEW	84990	1a2b978e-8eb3-4b41-bda6-cf766c54b16c
baABZK	94471	560e6aa5-8113-40ff-83ae-ecb461ef2741
yAALaw	61473	d5d8ac19-4002-4dd3-a2e5-dfa7967c43f0
VujTyA	55714	79d2835d-c5a6-4f5b-a7d8-e43c37e2f53d
NUJvOS	97003	9891e3f7-514a-4c78-9826-60ee9a7bfe1c
jSJfPw	87746	17d088bc-1f91-4b33-9a79-b39b5d333d37
DMfodw	84365	2809da7c-859a-400f-9867-4a36b2327391
kNMCEN	69224	51df8800-492d-4d98-9565-f7b54aa14275
atcxSG	98482	22c68280-c897-4f72-8e6d-b47f80e17ff4
Sixqpw	99889	0083f25d-2bcb-4dd0-a998-64225366dce8
anFoyI	86489	027cc2bf-3e4d-40fa-8355-d2a8095d811d
auPpNu	68225	ea5da959-9765-4b94-8d69-45e50ebde2c8
uPFZYB	79199	d1e9b170-cbb3-45b3-9bf5-f7e5a1d7040c
HSeTJK	82892	de466185-a9fc-44ce-9c91-27f8f1739100
PtbXJS	86267	5ed9fbf9-212b-409d-b9fb-aee87564aaba
vioUON	74790	d2d540b9-3b9b-4227-ba24-9c0bb8a1a215
SWgmvk	73545	c1e98f3a-ceb9-4675-9a78-6a2a4c0198af
NtNStX	96768	94f1e227-8acd-4638-a053-b3c8a4154145
RrGfHL	98484	c3030582-da13-4841-9a96-aab713d8f05b
ZkcyvU	81798	a7e6f6fe-da80-46bb-a96e-4e28445223c1
pFiESu	99637	9945cf7c-d904-436f-afb5-87bf325d220b
fRxIzd	91783	6f0e7bc7-5584-42c6-8cf6-c540aa0734a9
QgmFrE	51609	a5e30c5a-112c-4e25-a6de-ccde1d10cc59
RveNmz	88144	c2e036a4-dd0f-41f3-9d27-573b3a85d31e
aZyDXI	99856	7e2fa6a5-79b4-4921-816e-2a8d47d66fe9
gadYGJ	91715	0f761a0d-0efd-45e9-b758-216d56210eb9
KmajAl	78157	af3a6999-b1af-44fa-8c20-b64d34a02ad9
qdxywA	50745	80b15def-852f-4f93-adcc-b2cc5acec743
jnRvEY	57011	9eda5140-25f0-42aa-9b6a-6ff897b11334
wDgBmE	74070	1460ec64-9846-4c0c-b1ce-b1784380deb8
eFwqyL	50159	3a584305-27a6-4498-bddc-d34cc65b2bf8
iDfdQB	78006	2fef1aa7-f80e-40d7-b39d-9e737fe1fb5b
pUpDtt	85393	9dc82f92-e5e8-4182-986a-0021b37c05bf
aatDHS	61345	97d820dc-e3e7-47c9-8d53-375c1ba47759
EKhfGR	87522	aa4b161b-f6f6-4f46-8d83-e454ae8a0b86
PpXdxg	61002	6c0d283f-a180-42dc-83aa-a81a57247279
rEeTTb	82219	e4c72f06-2b9f-4706-8a7f-176aeca3b02b
IkwQCX	87890	1514e1e3-fd56-473c-97c1-b2b3dcd560cd
YjHmbY	67316	75aada12-8cd4-49b4-8f50-1bdf4b76cbac
JPTxxA	82245	a02f0b0b-599d-41d7-9ad1-fb558f68f9e3
YsMlWL	95724	4e85d371-1e0b-416d-b6a1-647e83cce6c4
HvFfVB	62735	15610986-3d09-424c-8041-5c5c4f2e5d48
wOTOtD	58292	c2a1885e-988f-4704-8c35-e6008d1d8525
xPjJQj	72833	0b2cd8b4-6328-4f29-8022-44777cdefc7a
OumlIf	61011	c7767f1e-8a88-4dde-88e0-20fbf0cd6027
YRAVnI	59294	b1a5674c-f4ec-4715-92ef-49fb8d9cc67a
\.


--
-- TOC entry 3729 (class 0 OID 24819)
-- Dependencies: 226
-- Data for Name: inrelationwithschedule; Type: TABLE DATA; Schema: public; Owner: bhargav
--

COPY public.inrelationwithschedule (user_id, age) FROM stdin;
\.


--
-- TOC entry 3722 (class 0 OID 16403)
-- Dependencies: 219
-- Data for Name: jogi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogi (name, age, job, id) FROM stdin;
\.


--
-- TOC entry 3727 (class 0 OID 24805)
-- Dependencies: 224
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: bhargav
--

COPY public.schedule (name, id, country, "timestamp", gender, unique_value) FROM stdin;
\.


--
-- TOC entry 3724 (class 0 OID 16412)
-- Dependencies: 221
-- Data for Name: whatever; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.whatever (name, id, email, password) FROM stdin;
\.


--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 222
-- Name: User12_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bhargav
--

SELECT pg_catalog.setval('public."User12_user_id_seq"', 1, false);


--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 216
-- Name: bhargav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bhargav_id_seq', 1, false);


--
-- TOC entry 3745 (class 0 OID 0)
-- Dependencies: 225
-- Name: inrelationwithschedule_age_seq; Type: SEQUENCE SET; Schema: public; Owner: bhargav
--

SELECT pg_catalog.setval('public.inrelationwithschedule_age_seq', 1, false);


--
-- TOC entry 3746 (class 0 OID 0)
-- Dependencies: 218
-- Name: jogi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jogi_id_seq', 1, false);


--
-- TOC entry 3747 (class 0 OID 0)
-- Dependencies: 220
-- Name: whatever_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.whatever_id_seq', 1, false);


--
-- TOC entry 3565 (class 2606 OID 16469)
-- Name: User12 User12_pkey; Type: CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public."User12"
    ADD CONSTRAINT "User12_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 3557 (class 2606 OID 16401)
-- Name: bhargav bhargav_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bhargav
    ADD CONSTRAINT bhargav_pkey PRIMARY KEY (id);


--
-- TOC entry 3573 (class 2606 OID 25006)
-- Name: emp emp_pkey; Type: CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empuni_id);


--
-- TOC entry 3571 (class 2606 OID 24999)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (unique_id);


--
-- TOC entry 3569 (class 2606 OID 24824)
-- Name: inrelationwithschedule inrelationwithschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.inrelationwithschedule
    ADD CONSTRAINT inrelationwithschedule_pkey PRIMARY KEY (age);


--
-- TOC entry 3559 (class 2606 OID 16410)
-- Name: jogi jogi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogi
    ADD CONSTRAINT jogi_pkey PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 24811)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3561 (class 2606 OID 16421)
-- Name: whatever whatever_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.whatever
    ADD CONSTRAINT whatever_email_key UNIQUE (email);


--
-- TOC entry 3563 (class 2606 OID 16419)
-- Name: whatever whatever_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.whatever
    ADD CONSTRAINT whatever_pkey PRIMARY KEY (id);


--
-- TOC entry 3575 (class 2606 OID 25007)
-- Name: emp foregin; Type: FK CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT foregin FOREIGN KEY (unique_id) REFERENCES public.employee(unique_id) NOT VALID;


--
-- TOC entry 3574 (class 2606 OID 24825)
-- Name: inrelationwithschedule unique_id; Type: FK CONSTRAINT; Schema: public; Owner: bhargav
--

ALTER TABLE ONLY public.inrelationwithschedule
    ADD CONSTRAINT unique_id FOREIGN KEY (user_id) REFERENCES public.schedule(id);


-- Completed on 2024-09-08 12:27:05 EDT

--
-- PostgreSQL database dump complete
--

