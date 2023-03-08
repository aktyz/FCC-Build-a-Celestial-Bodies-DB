--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    is_life_there boolean NOT NULL,
    age_in_billion_years numeric(10,3),
    diameter_light_years integer
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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    is_water_there boolean
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
    name character varying(30) NOT NULL,
    is_life_there boolean NOT NULL,
    star_id integer NOT NULL,
    is_water_there boolean
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
-- Name: stage_of_star_evolution; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stage_of_star_evolution (
    stage_of_star_evolution_id integer NOT NULL,
    name character varying(120) NOT NULL,
    description text
);


ALTER TABLE public.stage_of_star_evolution OWNER TO freecodecamp;

--
-- Name: stage_of_star_evolution_stage_of_star_evolution_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stage_of_star_evolution_stage_of_star_evolution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stage_of_star_evolution_stage_of_star_evolution_id_seq OWNER TO freecodecamp;

--
-- Name: stage_of_star_evolution_stage_of_star_evolution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stage_of_star_evolution_stage_of_star_evolution_id_seq OWNED BY public.stage_of_star_evolution.stage_of_star_evolution_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    stage_of_star_evolution_id integer NOT NULL,
    age_in_billion_years numeric(10,3),
    distance_from_sun_in_ly integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: stage_of_star_evolution stage_of_star_evolution_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stage_of_star_evolution ALTER COLUMN stage_of_star_evolution_id SET DEFAULT nextval('public.stage_of_star_evolution_stage_of_star_evolution_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Peekaboo', false, 13.800, 1200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 10.000, 152000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', false, NULL, 32200);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', false, NULL, 18900);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', true, 13.600, 87400);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', false, 0.079, 61100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1,'Moon','Our moon',3,NULL);
INSERT INTO public.moon VALUES (2,'Ganymede','This Jupiter s natural satellite is larger than Mercury',5,NULL);
INSERT INTO public.moon VALUES (3,'Titan','This Saturn s natural satellite is larger than Mercury',6,NULL);
INSERT INTO public.moon VALUES (4,'Callisto',NULL,5,NULL);
INSERT INTO public.moon VALUES (5,'Deimos',NULL,4,NULL);
INSERT INTO public.moon VALUES (6,'Phobos',NULL,4,NULL);
INSERT INTO public.moon VALUES (7,'IO',NULL,5,NULL);
INSERT INTO public.moon VALUES (8,'Europa',NULL,5,NULL);
INSERT INTO public.moon VALUES (9,'Amalthea',NULL,5,NULL);
INSERT INTO public.moon VALUES (10,'Himalia',NULL,5,NULL);
INSERT INTO public.moon VALUES (11,'Elara',NULL,5,NULL);
INSERT INTO public.moon VALUES (12,'Pasiphae',NULL,5,NULL);
INSERT INTO public.moon VALUES (13,'Sinope',NULL,5,NULL);
INSERT INTO public.moon VALUES (14,'Lysithea',NULL,5,NULL);
INSERT INTO public.moon VALUES (15,'Carme',NULL,5,NULL);
INSERT INTO public.moon VALUES (16,'Ananke',NULL,5,NULL);
INSERT INTO public.moon VALUES (17,'Leda',NULL,5,NULL);
INSERT INTO public.moon VALUES (18,'Thebe',NULL,5,NULL);
INSERT INTO public.moon VALUES (19,'Adrastea',NULL,5,NULL);
INSERT INTO public.moon VALUES (20,'Metis',NULL,5,NULL);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1,'Mercury',false,1,false);
INSERT INTO public.planet VALUES (2,'Venus',false,1,false);
INSERT INTO public.planet VALUES (3,'Earth',true,1,true);
INSERT INTO public.planet VALUES (4,'Mars',true,1,true);
INSERT INTO public.planet VALUES (5,'Jupiter',false,1,false);
INSERT INTO public.planet VALUES (6,'Saturn',false,1,false);
INSERT INTO public.planet VALUES (7,'Uranus',false,1,false);
INSERT INTO public.planet VALUES (8,'Neptune',false,1,false);
INSERT INTO public.planet VALUES (9,'Pluto',false,1,false);
INSERT INTO public.planet VALUES (10,'Ceres',false,1,false);
INSERT INTO public.planet VALUES (11,'Orcus',false,1,false);
INSERT INTO public.planet VALUES (12,'Haumea',false,1,false);

--
-- Data for Name: stage_of_star_evolution; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stage_of_star_evolution VALUES (1, 'BIRTH', 'As per wikipedia Stellar Evolution article has two subphases: Molecular Cloud and Open Cluster');
INSERT INTO public.stage_of_star_evolution VALUES (2, 'MAIN SEQUENCE', 'Either as: Massive Star, Low-mass Star or Brown Dwarf');
INSERT INTO public.stage_of_star_evolution VALUES (3, 'OLD AGE', 'Massive Star will evolve into Red Supergiant and Low-mass Star into Red Giant');
INSERT INTO public.stage_of_star_evolution VALUES (4, 'DEATH', 'Many different types, depending on size: Planetary Nebula, White Dwarf, Binary White Dwarf, Type Ia Supernova, Nova, Type II Supernova, Supernova Remnant');
INSERT INTO public.stage_of_star_evolution VALUES (5, 'REMNANT', 'Depending on size of the original star: Black Dwarf, Neutron Star to Pulsar, Black Hole to X-ray Emission');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 2, 4.500, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 2, 2, 0.060, NULL);
INSERT INTO public.star VALUES (3, 'Beta Andromedae', 2, 3, 1.800, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 5, 4, 0.225, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 5, 2, 0.450, NULL);
INSERT INTO public.star VALUES (7, 'UY Scuti', 5, 3, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: stage_of_star_evolution_stage_of_star_evolution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stage_of_star_evolution_stage_of_star_evolution_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: stage_of_star_evolution stage_of_star_evolution_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stage_of_star_evolution
    ADD CONSTRAINT stage_of_star_evolution_name_key UNIQUE (name);


--
-- Name: stage_of_star_evolution stage_of_star_evolution_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stage_of_star_evolution
    ADD CONSTRAINT stage_of_star_evolution_pkey PRIMARY KEY (stage_of_star_evolution_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: star star_stage_of_star_evolution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_stage_of_star_evolution_id_fkey FOREIGN KEY (stage_of_star_evolution_id) REFERENCES public.stage_of_star_evolution(stage_of_star_evolution_id);


--
-- PostgreSQL database dump complete
--

