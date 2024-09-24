--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-24 10:50:52

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
-- TOC entry 219 (class 1259 OID 16416)
-- Name: atividade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atividade (
    id_atividade integer NOT NULL,
    prontuario integer,
    nomeatividade character varying(100),
    datacadastro date
);


ALTER TABLE public.atividade OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16415)
-- Name: atividade_id_atividade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atividade_id_atividade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atividade_id_atividade_seq OWNER TO postgres;

--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 218
-- Name: atividade_id_atividade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atividade_id_atividade_seq OWNED BY public.atividade.id_atividade;


--
-- TOC entry 217 (class 1259 OID 16404)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id_endereco integer NOT NULL,
    prontuario integer,
    rua character varying(100),
    numero integer,
    bairro character varying(50),
    municipio character varying(50),
    cep character(8)
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16403)
-- Name: endereco_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_id_endereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.endereco_id_endereco_seq OWNER TO postgres;

--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 216
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_id_endereco_seq OWNED BY public.endereco.id_endereco;


--
-- TOC entry 215 (class 1259 OID 16398)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    prontuario integer NOT NULL,
    nome character varying(100),
    sexo character(1),
    prioritario boolean,
    datanascimento date,
    idade integer,
    faixaetaria character varying(50),
    patologiacomorbidade character varying(255),
    pcd boolean,
    cpf character(11),
    rg character(10),
    telefone character(15)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 4644 (class 2604 OID 16419)
-- Name: atividade id_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade ALTER COLUMN id_atividade SET DEFAULT nextval('public.atividade_id_atividade_seq'::regclass);


--
-- TOC entry 4643 (class 2604 OID 16407)
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- TOC entry 4800 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: atividade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atividade (id_atividade, prontuario, nomeatividade, datacadastro) FROM stdin;
1	1	Yoga	2024-09-01
\.


--
-- TOC entry 4798 (class 0 OID 16404)
-- Dependencies: 217
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.endereco (id_endereco, prontuario, rua, numero, bairro, municipio, cep) FROM stdin;
1	1	Rua das Flores	123	Centro	Santarém	68040000
2	1	Rua das Flores	123	Centro	Santarém	68040000
\.


--
-- TOC entry 4796 (class 0 OID 16398)
-- Dependencies: 215
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (prontuario, nome, sexo, prioritario, datanascimento, idade, faixaetaria, patologiacomorbidade, pcd, cpf, rg, telefone) FROM stdin;
1	João Silva	M	t	1980-05-10	44	40-49	Diabetes	f	12345678901	1234567   	11987654321    
\.


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 218
-- Name: atividade_id_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atividade_id_atividade_seq', 1, true);


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 216
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 2, true);


--
-- TOC entry 4650 (class 2606 OID 16421)
-- Name: atividade atividade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT atividade_pkey PRIMARY KEY (id_atividade);


--
-- TOC entry 4648 (class 2606 OID 16409)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 4646 (class 2606 OID 16402)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (prontuario);


--
-- TOC entry 4652 (class 2606 OID 16422)
-- Name: atividade atividade_prontuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT atividade_prontuario_fkey FOREIGN KEY (prontuario) REFERENCES public.usuario(prontuario);


--
-- TOC entry 4651 (class 2606 OID 16410)
-- Name: endereco endereco_prontuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_prontuario_fkey FOREIGN KEY (prontuario) REFERENCES public.usuario(prontuario);


-- Completed on 2024-09-24 10:50:52

--
-- PostgreSQL database dump complete
--

