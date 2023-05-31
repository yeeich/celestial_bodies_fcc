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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    area_in_sqdeg numeric(7,3),
    quadrant character varying(5)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(15),
    light_years_from_earth integer,
    description text
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
    planet_id integer NOT NULL,
    distance_from_planet_in_km integer,
    diameter_in_km numeric(8,2),
    orbital_period_in_days numeric(6,2)
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
    star_id integer NOT NULL,
    orbital_period_in_years numeric(10,2),
    rotation_period_in_days numeric(6,2),
    has_rings boolean,
    has_life boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer NOT NULL,
    brightness numeric(6,2)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 722.278, 'NQ1');
INSERT INTO public.constellation VALUES (2, 'Aquarius', 979.854, 'SQ4');
INSERT INTO public.constellation VALUES (3, 'Aries', 441.395, 'NQ1');
INSERT INTO public.constellation VALUES (4, 'Cancer', 505.872, 'NQ2');
INSERT INTO public.constellation VALUES (5, 'Canes Venatici', 465.194, 'NQ3');
INSERT INTO public.constellation VALUES (6, 'Canis Major', 380.118, 'SQ2');
INSERT INTO public.constellation VALUES (7, 'Canis Minor', 183.367, 'NQ2');
INSERT INTO public.constellation VALUES (8, 'Capricornus', 413.947, 'SQ4');
INSERT INTO public.constellation VALUES (9, 'Centaurus', 1060.422, 'SQ3');
INSERT INTO public.constellation VALUES (10, 'Coma Berenices', 386.475, 'NQ3');
INSERT INTO public.constellation VALUES (11, 'Corvus', 183.801, 'SQ3');
INSERT INTO public.constellation VALUES (12, 'Crater', 282.398, 'SQ2');
INSERT INTO public.constellation VALUES (13, 'Delphinus', 188.549, 'NQ4');
INSERT INTO public.constellation VALUES (14, 'Dorado', 179.173, 'SQ1');
INSERT INTO public.constellation VALUES (15, 'Fornax', 397.502, 'SQ1');
INSERT INTO public.constellation VALUES (16, 'Gemini', 513.761, 'NQ2');
INSERT INTO public.constellation VALUES (17, 'Hercules', 1225.148, 'NQ3');
INSERT INTO public.constellation VALUES (18, 'Leo', 946.964, 'NQ2');
INSERT INTO public.constellation VALUES (19, 'Libra', 538.052, 'SQ3');
INSERT INTO public.constellation VALUES (20, 'Orion', 594.120, 'NQ1');
INSERT INTO public.constellation VALUES (21, 'Pegasus', 1120.794, 'NQ4');
INSERT INTO public.constellation VALUES (22, 'Perseus', 614.997, 'NQ1');
INSERT INTO public.constellation VALUES (23, 'Phoenix', 469.319, 'SQ1');
INSERT INTO public.constellation VALUES (24, 'Pisces', 889.417, 'NQ1');
INSERT INTO public.constellation VALUES (25, 'Sagittarius', 867.432, 'SQ4');
INSERT INTO public.constellation VALUES (26, 'Scorpius', 496.783, 'SQ3');
INSERT INTO public.constellation VALUES (27, 'Sculptor', 474.764, 'SQ1');
INSERT INTO public.constellation VALUES (28, 'Taurus', 797.249, 'NQ1');
INSERT INTO public.constellation VALUES (29, 'Ursa Major', 1279.660, 'NQ2');
INSERT INTO public.constellation VALUES (30, 'Ursa Minor', 255.864, 'NQ3');
INSERT INTO public.constellation VALUES (31, 'Virgo', 1294.428, 'SQ3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'Our own galaxy, it is said to look like a band of light');
INSERT INTO public.galaxy VALUES (2, 'Medusa Merger', 'Spiral', 128800000, 'Named after the snakes in the Greek myth of Medusa');
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', 'Ring', 500000000, 'It looks a bit like a cartwheel');
INSERT INTO public.galaxy VALUES (4, 'Little Sombrero', 'Spiral', 42600000, 'It looks like a sombrero, but it is smaller than the Sombrero Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Spiral', 17300000, 'It looks like an eye with a dark stripe underneath');
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'Spiral', 2500000, 'In mythology, Andromeda is the daughter of the kings of Ethiopia and is said to be more beautiful than the Nereids. She became queen of Greece when she married Perseus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, 3475.00, 27.32);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 23460, 12.40, 1.26);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 9270, 22.50, 0.32);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 1883000, 4800.00, 16.69);
INSERT INTO public.moon VALUES (5, 'Ananke', 5, 21200000, 20.00, 631.00);
INSERT INTO public.moon VALUES (6, 'Elara', 5, 11737000, 80.00, 259.65);
INSERT INTO public.moon VALUES (7, 'Erinome', 5, 23279000, 3.20, 672.00);
INSERT INTO public.moon VALUES (8, 'Europa', 5, 670900, 3126.00, 3.55);
INSERT INTO public.moon VALUES (9, 'Albiorix', 6, 16392000, 30.00, 783.00);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 377400, 1120.00, 2.74);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 238020, 498.00, 1.37);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 3561300, 1436.00, 79.32);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 185520, 398.00, 0.94);
INSERT INTO public.moon VALUES (14, 'Pan', 6, 133630, 19.32, 0.56);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 191240, 1160.00, 2.52);
INSERT INTO public.moon VALUES (16, 'Caliban', 7, 7200000, 80.00, 579.50);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 582600, 1526.00, 13.46);
INSERT INTO public.moon VALUES (18, 'Galatea', 8, 52500, 140.00, 0.33);
INSERT INTO public.moon VALUES (19, 'Neso', 8, 47279670, 60.00, 9007.10);
INSERT INTO public.moon VALUES (20, 'Thalassa', 8, 50000, 90.00, 0.31);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.24, 58.65, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.62, 243.02, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.00, 1.00, false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.88, 1.03, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 11.86, 0.41, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 29.45, 0.44, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 84.02, 0.72, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 164.79, 0.67, true, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 247.90, 6.39, false, false);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 559.00, 15.79, NULL, false);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, 4.60, 0.38, false, false);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, 283.80, 0.16, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 25, -26.74);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 25, -1.46);
INSERT INTO public.star VALUES (3, 'Alpheratz', 6, 1, 2.07);
INSERT INTO public.star VALUES (4, 'Sadiradra', 6, 1, 3.27);
INSERT INTO public.star VALUES (5, 'Dubhe', 2, 29, 1.79);
INSERT INTO public.star VALUES (6, 'Phad', 2, 29, 2.44);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 31, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--