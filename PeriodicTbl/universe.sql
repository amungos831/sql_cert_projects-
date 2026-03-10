--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    diameter_km integer,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    diameter_km integer,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric
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
-- Name: rings; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rings (
    rings_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    discovery_year integer,
    period_years numeric,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.rings OWNER TO freecodecamp;

--
-- Name: rings_rings_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rings_rings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rings_rings_id_seq OWNER TO freecodecamp;

--
-- Name: rings_rings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rings_rings_id_seq OWNED BY public.rings.rings_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    mass_solar_masses numeric,
    is_main_sequence boolean NOT NULL
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
-- Name: rings rings_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rings ALTER COLUMN rings_id SET DEFAULT nextval('public.rings_rings_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13650, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 'Spiral', 10010, 2.537, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group', 'Spiral', 12020, 3.2, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy', 'Spiral', 403, 23, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual galaxy', 'Spiral', 9050, 29, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Giant elliptical galaxy', 'Elliptical', 12080, 53, false);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Radio galaxy', 'Lenticular', 12060, 13, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earths moon', 4510, 3474, true, 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Mars moon', 4510, 22, false, 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Mars moon', 4510, 12, false, 1.3);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic moon of Jupiter', 4510, 3643, true, 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon of Jupiter', 4510, 3122, true, 3.5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in solar system', 4510, 5268, true, 7.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Jupiter moon', 4510, 4820, true, 16.7);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Largest moon of Saturn', 4505, 5150, true, 15.9);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Saturn moon', 4505, 1527, true, 4.5);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 'Saturn moon', 4505, 1123, true, 2.7);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 'Saturn moon', 4505, 1062, true, 1.9);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 'Icy moon with geysers', 4502, 504, true, 1.4);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 'Saturn moon', 4502, 396, true, 0.9);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 'Uranus moon', 4502, 471, true, 1.4);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 'Uranus moon', 4508, 1158, true, 2.5);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 'Uranus moon', 4508, 1169, true, 4.1);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 'Uranus moon', 4508, 1578, true, 8.7);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 'Uranus moon', 4508, 1523, true, 13.5);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 'Neptune moon', 4508, 2707, true, 5.9);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 'Neptune moon', 4508, 340, false, 360);
INSERT INTO public.moon VALUES (21, 'Charon', 16, 'Pluto''s moon', 4508, 1212, true, 6.4);
INSERT INTO public.moon VALUES (22, 'Hydra', 16, 'Pluto moon', 4508, 50, false, 38.2);
INSERT INTO public.moon VALUES (23, 'Nix', 16, 'Pluto moon', 4508, 45, false, 24.9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Smallest planet', 4600, 4879, false, true, 77);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet', 4600, 12104, false, true, 41);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our planet', 4600, 12742, true, true, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Red planet', 4600, 6779, false, true, 78);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet', 4600, 139820, false, true, 628);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Ringed planet', 4600, 116460, false, true, 1277);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 4600, 50724, false, true, 2720);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Windy planet', 4600, 49244, false, true, 4340);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet in habitable zone', 4850, 14000, false, true, 4.2);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 'Exoplanet', 4850, 15000, false, true, 4.2);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 3, 'Hypothetical planet', 8, 200000, false, true, 640);
INSERT INTO public.planet VALUES (12, 'Sirius b', 4, 'White dwarf companion', 242, 12000, false, true, 8.6);
INSERT INTO public.planet VALUES (13, 'Vega b', 5, 'Exoplanet candidate', 455, 20000, false, true, 25);
INSERT INTO public.planet VALUES (14, 'Polaris b', 6, 'Exoplanet', 70, 30000, false, true, 430);
INSERT INTO public.planet VALUES (15, 'Mirach b', 7, 'Exoplanet', 1000, 25000, false, true, 2000);
INSERT INTO public.planet VALUES (16, 'Alpheratz b', 8, 'Exoplanet', 60, 22000, false, true, 97);
INSERT INTO public.planet VALUES (17, 'Pluto', 1, 'Dwarf planet', 4600, 2377, false, true, 7500);


--
-- Data for Name: rings; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rings VALUES (1, 'Rings of Jupiter', 'Discovered by Voyager 1', 1979, 628, true);
INSERT INTO public.rings VALUES (2, 'Rings of Saturn', 'Discovered by Galileo Galilei', 1610, 1277, true);
INSERT INTO public.rings VALUES (3, 'Rings of Uranus', 'Discovered by James L. Elliot', 1977, 2720, false);
INSERT INTO public.rings VALUES (4, 'Rings of Neptune', 'Conclusive discovery by Voyager 2', 1989, 4340, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our star', 4601, 1.0, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest star to Sun', 4859, 0.12, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant', 8, 20, false);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'Brightest star in night sky', 243, 2.0, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Bright star in Lyra', 456, 2.1, true);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 'North Star', 70, 5.4, false);
INSERT INTO public.star VALUES (7, 'Mirach', 2, 'Star in Andromeda', 1001, 3.0, true);
INSERT INTO public.star VALUES (8, 'Alpheratz', 2, 'Star in Andromeda', 64, 3.0, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: rings_rings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rings_rings_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: rings rings_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rings
    ADD CONSTRAINT rings_name_key UNIQUE (name);


--
-- Name: rings rings_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rings
    ADD CONSTRAINT rings_pkey PRIMARY KEY (rings_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

