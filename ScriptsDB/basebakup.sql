--
-- PostgreSQL database dump
--

\restrict 18fOKjYvV4YqRjtRFtEGhv83fRyFxRw2obUcpNFHAHzULbD8cVCenaZwgqw8r8u

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 18.1

-- Started on 2026-03-10 22:14:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 223 (class 1259 OID 16434)
-- Name: accesos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.accesos (
    id integer NOT NULL,
    usuario_id integer,
    puerta_id integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    resultado character varying(20)
);


ALTER TABLE public.accesos OWNER TO admin;

--
-- TOC entry 222 (class 1259 OID 16433)
-- Name: accesos_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.accesos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accesos_id_seq OWNER TO admin;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 222
-- Name: accesos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.accesos_id_seq OWNED BY public.accesos.id;


--
-- TOC entry 215 (class 1259 OID 16386)
-- Name: areas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.areas OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 16385)
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.areas_id_seq OWNER TO admin;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 214
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- TOC entry 221 (class 1259 OID 16417)
-- Name: permisos_area_puerta; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.permisos_area_puerta (
    id integer NOT NULL,
    area_id integer,
    puerta_id integer
);


ALTER TABLE public.permisos_area_puerta OWNER TO admin;

--
-- TOC entry 220 (class 1259 OID 16416)
-- Name: permisos_area_puerta_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.permisos_area_puerta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permisos_area_puerta_id_seq OWNER TO admin;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 220
-- Name: permisos_area_puerta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.permisos_area_puerta_id_seq OWNED BY public.permisos_area_puerta.id;


--
-- TOC entry 217 (class 1259 OID 16393)
-- Name: puertas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.puertas (
    id integer NOT NULL,
    nombre character varying(100),
    ubicacion character varying(100)
);


ALTER TABLE public.puertas OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16392)
-- Name: puertas_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.puertas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.puertas_id_seq OWNER TO admin;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 216
-- Name: puertas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.puertas_id_seq OWNED BY public.puertas.id;


--
-- TOC entry 219 (class 1259 OID 16400)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    cedula character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    cargo character varying(100),
    tarjeta bigint,
    area_id integer,
    estado boolean DEFAULT true
);


ALTER TABLE public.usuarios OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 16399)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO admin;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3288 (class 2604 OID 16437)
-- Name: accesos id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.accesos ALTER COLUMN id SET DEFAULT nextval('public.accesos_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 16389)
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 16420)
-- Name: permisos_area_puerta id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permisos_area_puerta ALTER COLUMN id SET DEFAULT nextval('public.permisos_area_puerta_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 16396)
-- Name: puertas id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.puertas ALTER COLUMN id SET DEFAULT nextval('public.puertas_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 16403)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3303 (class 2606 OID 16440)
-- Name: accesos accesos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 16391)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16422)
-- Name: permisos_area_puerta permisos_area_puerta_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permisos_area_puerta
    ADD CONSTRAINT permisos_area_puerta_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 16398)
-- Name: puertas puertas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.puertas
    ADD CONSTRAINT puertas_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 16408)
-- Name: usuarios usuarios_cedula_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cedula_key UNIQUE (cedula);


--
-- TOC entry 3297 (class 2606 OID 16406)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 16410)
-- Name: usuarios usuarios_tarjeta_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_tarjeta_key UNIQUE (tarjeta);


--
-- TOC entry 3307 (class 2606 OID 16446)
-- Name: accesos accesos_puerta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_puerta_id_fkey FOREIGN KEY (puerta_id) REFERENCES public.puertas(id);


--
-- TOC entry 3308 (class 2606 OID 16441)
-- Name: accesos accesos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 3305 (class 2606 OID 16423)
-- Name: permisos_area_puerta permisos_area_puerta_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permisos_area_puerta
    ADD CONSTRAINT permisos_area_puerta_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- TOC entry 3306 (class 2606 OID 16428)
-- Name: permisos_area_puerta permisos_area_puerta_puerta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permisos_area_puerta
    ADD CONSTRAINT permisos_area_puerta_puerta_id_fkey FOREIGN KEY (puerta_id) REFERENCES public.puertas(id);


--
-- TOC entry 3304 (class 2606 OID 16411)
-- Name: usuarios usuarios_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas(id);


-- Completed on 2026-03-10 22:14:29

--
-- PostgreSQL database dump complete
--

\unrestrict 18fOKjYvV4YqRjtRFtEGhv83fRyFxRw2obUcpNFHAHzULbD8cVCenaZwgqw8r8u

