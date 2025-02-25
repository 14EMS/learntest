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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30),
    size numeric NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size numeric,
    planetqty integer NOT NULL,
    starqty integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    habitable boolean,
    pl integer NOT NULL,
    size numeric NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    habitable boolean,
    moonqty integer,
    size numeric NOT NULL,
    pl integer NOT NULL,
    star_id integer,
    color text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    planetqty integer NOT NULL,
    size numeric NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 8765, 1);
INSERT INTO public.comet VALUES (2, 'Swift-Tuttle', 9876, 2);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 1234, 3);
INSERT INTO public.comet VALUES (4, 'Encke', 2345, 4);
INSERT INTO public.comet VALUES (5, 'Wild 2', 3456, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 325, 78, 5);
INSERT INTO public.galaxy VALUES (2, 'Alpha Centauri', 59, 203, 78);
INSERT INTO public.galaxy VALUES (3, 'Out Momon', 1, 2, 3);
INSERT INTO public.galaxy VALUES (4, 'Out Papa', 4, 5, 6);
INSERT INTO public.galaxy VALUES (5, 'Out Nenen', 7, 8, 9);
INSERT INTO public.galaxy VALUES (6, 'Out Ser', 10, 11, 12);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 123, 4567, 1);
INSERT INTO public.moon VALUES (2, 'Europa', false, 456, 7890, 2);
INSERT INTO public.moon VALUES (3, 'Titan', true, 789, 1234, 3);
INSERT INTO public.moon VALUES (4, 'Phobos', false, 234, 5678, 4);
INSERT INTO public.moon VALUES (5, 'Deimos', true, 567, 9012, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 890, 2345, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 345, 6789, 7);
INSERT INTO public.moon VALUES (8, 'Io', false, 678, 1234, 8);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 123, 5678, 9);
INSERT INTO public.moon VALUES (10, 'Rhea', false, 456, 9012, 10);
INSERT INTO public.moon VALUES (11, 'Oberon', true, 789, 2345, 11);
INSERT INTO public.moon VALUES (12, 'Triton', false, 234, 6789, 12);
INSERT INTO public.moon VALUES (13, 'Umbriel', true, 567, 1234, 13);
INSERT INTO public.moon VALUES (14, 'Ariel', false, 890, 5678, 14);
INSERT INTO public.moon VALUES (15, 'Dione', true, 345, 9012, 15);
INSERT INTO public.moon VALUES (16, 'Mimas', false, 678, 2345, 16);
INSERT INTO public.moon VALUES (17, 'Miranda', true, 123, 6789, 17);
INSERT INTO public.moon VALUES (18, 'Tethys', false, 456, 1234, 18);
INSERT INTO public.moon VALUES (19, 'Hyperion', true, 789, 5678, 19);
INSERT INTO public.moon VALUES (20, 'Charon', false, 234, 9012, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Zeta', true, 2, 12345, 56789, 1, 'Blue');
INSERT INTO public.planet VALUES (2, 'Aurora', false, 5, 9876, 1234, 2, 'Red');
INSERT INTO public.planet VALUES (3, 'Nebula', true, 1, 23456, 34567, 3, 'Green');
INSERT INTO public.planet VALUES (4, 'Ceres', false, 3, 8765, 5678, 4, 'Yellow');
INSERT INTO public.planet VALUES (5, 'Andromeda', true, 0, 34567, 45678, 5, 'Purple');
INSERT INTO public.planet VALUES (6, 'Triton', false, 4, 5678, 6789, 6, 'Orange');
INSERT INTO public.planet VALUES (7, 'Elysium', true, 2, 45678, 56789, 1, 'Cyan');
INSERT INTO public.planet VALUES (8, 'Orion', false, 1, 6789, 7890, 2, 'Magenta');
INSERT INTO public.planet VALUES (9, 'Lyra', true, 3, 56789, 8901, 3, 'Teal');
INSERT INTO public.planet VALUES (10, 'Atlas', false, 5, 8901, 9012, 4, 'Violet');
INSERT INTO public.planet VALUES (11, 'Perseus', true, 0, 9012, 1234, 5, 'Indigo');
INSERT INTO public.planet VALUES (12, 'Hyperion', false, 2, 1234, 2345, 6, 'Pink');
INSERT INTO public.planet VALUES (13, 'Vega', true, 4, 2345, 3456, 1, 'Gold');
INSERT INTO public.planet VALUES (14, 'Draco', false, 1, 3456, 4567, 2, 'Silver');
INSERT INTO public.planet VALUES (15, 'Orpheus', true, 3, 4567, 5678, 3, 'Bronze');
INSERT INTO public.planet VALUES (16, 'Rhea', false, 5, 5678, 6789, 4, 'Azure');
INSERT INTO public.planet VALUES (17, 'Titania', true, 1, 6789, 7890, 5, 'Rose');
INSERT INTO public.planet VALUES (18, 'Zephyr', false, 2, 7890, 8901, 6, 'Jade');
INSERT INTO public.planet VALUES (19, 'Calypso', true, 4, 8901, 9012, 1, 'Pearl');
INSERT INTO public.planet VALUES (20, 'Auriga', false, 0, 9012, 1234, 2, 'Emerald');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 9, 48, 1);
INSERT INTO public.star VALUES (2, 'X', 8, 257, 2);
INSERT INTO public.star VALUES (3, 'Y', 6, 21, 3);
INSERT INTO public.star VALUES (4, 'Z', 7, 65, 4);
INSERT INTO public.star VALUES (5, 'W', 2, 98, 5);
INSERT INTO public.star VALUES (6, 'Vi', 8, 96, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 20, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_inplanet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_inplanet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_instar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_instar_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_ingalaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_ingalaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

