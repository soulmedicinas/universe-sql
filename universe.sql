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
    name character varying(30),
    type character varying(40),
    commute_in_lightyear_millions integer NOT NULL,
    galaxy_id integer NOT NULL,
    expanse_k_ly numeric(4,1)
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
    has_water boolean,
    planet_id integer NOT NULL,
    orbit_length_in_days numeric(6,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    main_features text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(70),
    magnitude numeric(4,2),
    type character varying(60)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('M104 Sombrero', 'unclassified', 31, 1, 105.0);
INSERT INTO public.galaxy VALUES ('M100', 'grand design intermediate sprial', 55, 2, 107.0);
INSERT INTO public.galaxy VALUES ('M51a', 'interacting grand design spiral galaxy', 24, 3, 76.9);
INSERT INTO public.galaxy VALUES ('M95', 'barred spiral', 33, 4, 70.0);
INSERT INTO public.galaxy VALUES ('NGC 3621', 'field spiral', 22, 5, 216.9);
INSERT INTO public.galaxy VALUES ('M81 Bodes Galaxy', 'grand design spiral', 12, 6, 96.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', true, 4, 15.1);
INSERT INTO public.moon VALUES (2, 'Enceladus', true, 4, 0.3);
INSERT INTO public.moon VALUES (3, 'Iapetus', true, 4, 79.0);
INSERT INTO public.moon VALUES (4, 'Rhea', false, 4, 4.5);
INSERT INTO public.moon VALUES (5, 'Phobos', false, 5, 27.3);
INSERT INTO public.moon VALUES (6, 'Deimos', false, 5, 1.3);
INSERT INTO public.moon VALUES (7, 'Miranda', true, 6, 1.4);
INSERT INTO public.moon VALUES (8, 'Titania', true, 6, 8.7);
INSERT INTO public.moon VALUES (9, 'Triton', true, 7, 5.9);
INSERT INTO public.moon VALUES (10, 'Naiad', true, 7, 1.3);
INSERT INTO public.moon VALUES (11, 'Thalassa', true, 7, 0.3);
INSERT INTO public.moon VALUES (12, 'Despina', true, 7, 0.3);
INSERT INTO public.moon VALUES (13, 'Galatea', true, 7, 1690.0);
INSERT INTO public.moon VALUES (14, 'Larissa', true, 7, 0.6);
INSERT INTO public.moon VALUES (15, 'Hippocamp', true, 7, 1.0);
INSERT INTO public.moon VALUES (16, 'Proteus', true, 7, 1.1);
INSERT INTO public.moon VALUES (17, 'Nereid', true, 7, 360.1);
INSERT INTO public.moon VALUES (18, 'Halimede', true, 7, 1879.0);
INSERT INTO public.moon VALUES (19, 'Basquiat', true, 11, 2061.3);
INSERT INTO public.moon VALUES (20, 'Kahlo', true, 12, 3447.8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, '88-day orbit, 2nd-densest planet, smallest in the SS', 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, '10-hour days, Great Red Spot, 11.8 earth-year orbit', 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'counter-rotation, one year is 225 days, hottest temps', 2);
INSERT INTO public.planet VALUES (4, 'Saturn', false, '74.9 earth-year orbit, large ring system, 150 moons', 2);
INSERT INTO public.planet VALUES (5, 'Mars', false, 'red oxide dust, Olympus Mons, blue sunsets', 3);
INSERT INTO public.planet VALUES (6, 'Uransus', false, '165 earth-year orbit, faint rings, 14 moons', 3);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 'counter-rotation, coldest temps, 27 moons', 4);
INSERT INTO public.planet VALUES (8, 'P88', true, '6 active volcanoes, 3 moons, smells like strawberries', 4);
INSERT INTO public.planet VALUES (9, 'P193', true, 'iron crystal core, 2,000 freshwater lakes, dinosaur-sized cats', 4);
INSERT INTO public.planet VALUES (10, 'P82', true, 'green daylight skies, 4 oceans, human-like inhabitants', 5);
INSERT INTO public.planet VALUES (11, 'P17', false, 'shimmering quartz craters, 12 earth-year orbit, 13 moons', 5);
INSERT INTO public.planet VALUES (12, 'Vivii', false, '44-deg axial tilt, electrical storms, 7 moons', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Alpha Canum Venaticorum', 5.60, 'binary');
INSERT INTO public.star VALUES (2, 2, 'Alpha Virginis', 0.97, 'spectroscopic binary');
INSERT INTO public.star VALUES (3, 3, 'Epsilon Bootis', 2.37, 'binary');
INSERT INTO public.star VALUES (4, 4, 'Alpha Leonis', 1.40, 'quadruple');
INSERT INTO public.star VALUES (5, 5, 'Alpha Ursae Minoris', 2.00, 'triple');
INSERT INTO public.star VALUES (6, 6, 'Gamma Pegasi', 2.80, 'spectral');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


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
-- Name: planet planet_start_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_start_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

