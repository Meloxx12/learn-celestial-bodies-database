--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_from_earth integer NOT NULL,
    has_life boolean NOT NULL,
    weather text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    weather text,
    has_crater text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    distance_from_earth integer NOT NULL,
    radiation numeric(2,2) NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    weahter text,
    poblation text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 200000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Berenices', 3500, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'NGC', 4500, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Dragin', 8500, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Nebulosa', 6500, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Celes', 4900, true, NULL);
INSERT INTO public.galaxy VALUES (7, 'Furion', 700, false, NULL);
INSERT INTO public.galaxy VALUES (8, 'Huytion', 1700, true, NULL);
INSERT INTO public.galaxy VALUES (9, 'Reses-FRF', 6420, true, NULL);
INSERT INTO public.galaxy VALUES (10, 'Nebulosa Gm', 4400, false, NULL);
INSERT INTO public.galaxy VALUES (11, 'Nebul', 145, true, NULL);
INSERT INTO public.galaxy VALUES (12, 'Nebulosa Tkm', 409, false, NULL);
INSERT INTO public.galaxy VALUES (13, 'Tebun', 100, true, NULL);
INSERT INTO public.galaxy VALUES (14, 'Nebulosa Gm', 4400, false, NULL);
INSERT INTO public.galaxy VALUES (15, 'Nebulxx', 14, true, NULL);
INSERT INTO public.galaxy VALUES (16, 'Neulosa Tkm', 43, false, NULL);
INSERT INTO public.galaxy VALUES (17, 'Tebun', 123, true, NULL);
INSERT INTO public.galaxy VALUES (18, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (19, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (20, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (21, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (22, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (23, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (24, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (25, 'karia', 7895, false, NULL);
INSERT INTO public.galaxy VALUES (26, 'karia', 7895, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'luna', 7, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'satus', 8, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'belentos', 9, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'luna2', 10, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'luna2', 11, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'luna2', 12, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'luna2', 13, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'luna2', 14, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'luna2', 15, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'luna2', 16, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'luna2', 17, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'luna2', 18, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'kit', 19, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'kit', 20, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'kit', 21, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'kit', 22, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'kit', 23, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'kit', 24, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'kit', 25, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'kit', 26, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'earth', 2500, 0.98, true, 4);
INSERT INTO public.planet VALUES (8, 'mercurio', 3000, 0.56, false, 5);
INSERT INTO public.planet VALUES (9, 'venus', 312, 0.44, false, 7);
INSERT INTO public.planet VALUES (10, 'jupiter', 450, 0.22, true, 8);
INSERT INTO public.planet VALUES (11, 'jupiter', 450, 0.22, true, 9);
INSERT INTO public.planet VALUES (12, 'jupiter-mhg', 455, 0.23, true, 10);
INSERT INTO public.planet VALUES (13, 'venus2', 55, 0.49, false, 11);
INSERT INTO public.planet VALUES (14, 'venus-msf', 559, 0.12, false, 12);
INSERT INTO public.planet VALUES (15, 'pluton', 559, 0.16, false, 13);
INSERT INTO public.planet VALUES (16, 'pluton-cc', 65, 0.11, false, 14);
INSERT INTO public.planet VALUES (17, 'plut-lo', 655, 0.76, true, 15);
INSERT INTO public.planet VALUES (18, 'plut-lox', 755, 0.36, true, 16);
INSERT INTO public.planet VALUES (19, 'kiop', 124, 0.11, true, 17);
INSERT INTO public.planet VALUES (20, 'kiop', 124, 0.11, true, 18);
INSERT INTO public.planet VALUES (21, 'kiop', 124, 0.11, true, 19);
INSERT INTO public.planet VALUES (22, 'kiop', 124, 0.11, true, 20);
INSERT INTO public.planet VALUES (23, 'kiop', 124, 0.11, true, 21);
INSERT INTO public.planet VALUES (24, 'kiop', 124, 0.11, true, 22);
INSERT INTO public.planet VALUES (25, 'kiop', 124, 0.11, true, 23);
INSERT INTO public.planet VALUES (26, 'kiop', 124, 0.11, true, 24);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'gaseoso', 'Muy grande');
INSERT INTO public.planet_types VALUES (2, 'Nebuloso', 'Pequeño');
INSERT INTO public.planet_types VALUES (3, 'Terroso', 'Mediano');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'marte', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'jupiter', 5, NULL, NULL);
INSERT INTO public.star VALUES (6, 'gaminides', 6, NULL, NULL);
INSERT INTO public.star VALUES (7, 'hupion', 6, NULL, NULL);
INSERT INTO public.star VALUES (8, 'saporifia', 7, NULL, NULL);
INSERT INTO public.star VALUES (9, 'solsticio', 8, NULL, NULL);
INSERT INTO public.star VALUES (10, 'vemun', 10, NULL, NULL);
INSERT INTO public.star VALUES (11, 'bemun', 11, NULL, NULL);
INSERT INTO public.star VALUES (12, 'tuen', 12, NULL, NULL);
INSERT INTO public.star VALUES (13, 'xemun', 13, NULL, NULL);
INSERT INTO public.star VALUES (14, 'gemun', 14, NULL, NULL);
INSERT INTO public.star VALUES (15, 'kemun', 15, NULL, NULL);
INSERT INTO public.star VALUES (16, 'tuenxx', 16, NULL, NULL);
INSERT INTO public.star VALUES (17, 'femun', 17, NULL, NULL);
INSERT INTO public.star VALUES (18, 'grepit', 18, NULL, NULL);
INSERT INTO public.star VALUES (19, 'grepit', 19, NULL, NULL);
INSERT INTO public.star VALUES (20, 'grepit', 20, NULL, NULL);
INSERT INTO public.star VALUES (21, 'grepit', 21, NULL, NULL);
INSERT INTO public.star VALUES (22, 'grepit', 22, NULL, NULL);
INSERT INTO public.star VALUES (23, 'grepit', 23, NULL, NULL);
INSERT INTO public.star VALUES (24, 'grepit', 24, NULL, NULL);
INSERT INTO public.star VALUES (25, 'grepit', 25, NULL, NULL);
INSERT INTO public.star VALUES (26, 'grepit', 26, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 7, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 8, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_types_id_key UNIQUE (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

