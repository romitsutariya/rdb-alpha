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
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_type character varying(100),
    distance_from_earth numeric(15,4),
    estimated_stars integer,
    age_in_millions_of_years integer
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
    has_life boolean NOT NULL,
    has_subsurface_ocean boolean DEFAULT false NOT NULL,
    discovery_year integer,
    temperature_k integer,
    age_in_millions_of_years integer
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
    planet_type character varying(50),
    mass_earth_relative numeric(15,4),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    temperature_k integer,
    age_in_millions_of_years integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    mass_solar_relative numeric(10,4),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    temperature_k integer,
    age_in_millions_of_years integer
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20),
    temperature_k integer,
    mass_solar_relative numeric(10,4),
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of Earth', true, true, 'Spiral', 0.0000, 100000000, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', false, true, 'Spiral', 2537000.0000, 1000000000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', false, true, 'Spiral', 3000000.0000, 40000000, 12000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral galaxy', false, true, 'Spiral', 23000000.0000, 100000000, 14000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual galaxy with bright nucleus', false, true, 'Elliptical', 29000000.0000, 80000000, 13000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Supergiant elliptical galaxy', false, true, 'Elliptical', 53000000.0000, 1200000000, 13500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth’s only natural satellite', false, false, -1000000, 220, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Larger moon of Mars', false, false, 1877, 233, 4500);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smaller moon of Mars', false, false, 1877, 233, 4500);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Most volcanically active body', false, false, 1610, 130, 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon with subsurface ocean', false, true, 1610, 102, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the Solar System', false, true, 1610, 110, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered moon', false, true, 1610, 134, 4500);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Thick atmosphere and methane lakes', false, true, 1655, 94, 4500);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Cryovolcanic moon', false, true, 1789, 75, 4500);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Moon with large impact crater', false, false, 1789, 64, 4500);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 'Retrograde orbit moon', false, true, 1846, 38, 4500);
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 'Highly eccentric orbit moon', false, false, 1949, 48, 4500);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 'Moon with extreme terrain', false, false, 1948, 60, 4500);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'Bright icy surface moon', false, true, 1851, 60, 4500);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Dark surface moon', false, false, 1851, 75, 4500);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 'Outer major moon of Uranus', false, false, 1787, 75, 4500);
INSERT INTO public.moon VALUES (17, 'Charon', 9, 'Largest moon of Pluto-like planet', false, false, 1978, 53, 4500);
INSERT INTO public.moon VALUES (18, 'Kepler-22b I', 10, 'Hypothetical exomoon', false, false, 2011, 250, 4000);
INSERT INTO public.moon VALUES (19, 'WASP-12b I', 12, 'Hypothetical exomoon', false, false, 2014, 1000, 2000);
INSERT INTO public.moon VALUES (20, 'HD 209458 b I', 11, 'Hypothetical exomoon', false, false, 2015, 900, 3000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Smallest planet in the Solar System', 'Terrestrial', 0.0550, false, true, 440, 4500);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet in the Solar System', 'Terrestrial', 0.8150, false, true, 737, 4500);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Only known planet with life', 'Terrestrial', 1.0000, true, true, 288, 4500);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Known as the Red Planet', 'Terrestrial', 0.1070, false, true, 210, 4500);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in the Solar System', 'Gas Giant', 317.8000, false, true, 165, 4500);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant with prominent rings', 'Gas Giant', 95.2000, false, true, 134, 4500);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant with extreme axial tilt', 'Ice Giant', 14.5000, false, true, 76, 4500);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Farthest known planet from the Sun', 'Ice Giant', 17.1000, false, true, 72, 4500);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet orbiting Proxima Centauri', 'Terrestrial', 1.2700, false, true, 234, 4800);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 3, 'Potentially habitable exoplanet', 'Super-Earth', 2.4000, false, true, 295, 4000);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 'First detected transiting exoplanet', 'Gas Giant', 220.0000, false, true, 1450, 3000);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 5, 'Ultra-hot Jupiter exoplanet', 'Gas Giant', 450.0000, false, true, 2500, 2000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star at the center of the Solar System', 1, 1.0000, true, true, 5778, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest known star to the Sun', 1, 0.1221, false, true, 3042, 4800);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in the night sky', 1, 2.0200, false, true, 9940, 242);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star', 1, 11.6000, false, true, 3500, 10000);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue supergiant star', 1, 21.0000, false, true, 12100, 8000);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 'Brightest star in Andromeda galaxy', 2, 3.6000, false, true, 13800, 60);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun', 1, 'G2V', 5778, 1.0000, true, true);
INSERT INTO public.sun VALUES (2, 'Alpha Andromedae A', 2, 'B8IVp', 13800, 3.6000, true, false);
INSERT INTO public.sun VALUES (3, 'Triangulum Star A', 3, 'K5V', 4400, 0.6700, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


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
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


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
-- Name: sun sun_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

