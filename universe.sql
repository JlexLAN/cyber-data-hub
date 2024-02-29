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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    event_date date NOT NULL,
    description text,
    location text
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric,
    is_active boolean NOT NULL,
    type text,
    description text,
    distance_light_years integer
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
    diameter integer,
    is_in_habitable_zone boolean NOT NULL,
    planet_id integer,
    orbital_period numeric,
    surface_features text
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
    radius integer,
    has_atmosphere boolean NOT NULL,
    is_habitable boolean NOT NULL,
    star_id integer,
    orbital_period numeric,
    terrain text
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
    temperature integer,
    is_main_sequence boolean NOT NULL,
    galaxy_id integer,
    luminosity numeric,
    composition text
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
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_event_id_seq'::regclass);


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
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'Solar Eclipse', '2024-04-08', 'Total solar eclipse visible in North America', 'United States');
INSERT INTO public.celestial_event VALUES (2, 'Perseid Meteor Shower', '2024-08-12', 'Annual meteor shower known for its bright meteors', 'Northern Hemisphere');
INSERT INTO public.celestial_event VALUES (3, 'Transit of Mercury', '2024-11-13', 'Mercury passing directly between the Earth and the Sun', 'Various');
INSERT INTO public.celestial_event VALUES (4, 'Comet Observation', '2024-09-20', 'Close approach of comet C/2024 R2 (ATLAS)', 'Global');
INSERT INTO public.celestial_event VALUES (5, 'Lunar Eclipse', '2024-05-16', 'Partial lunar eclipse visible in Europe, Africa, Asia, and Australia', 'Various');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 'spiral', 'The galaxy containing our solar system', 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, true, 'spiral', 'The closest spiral galaxy to the Milky Way', 200000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 80000, false, 'spiral', 'A spiral galaxy notable for its prominent spiral arms', 300000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 90000, true, 'spiral', 'A spiral galaxy with a prominent bulge resembling a sombrero hat', 250000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 70000, false, 'spiral', 'A small spiral galaxy in the Local Group', 150000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 85000, true, 'spiral', 'A spiral galaxy with a prominent pinwheel structure', 180000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 22, false, 2, 0.3, 'Heavily cratered surface');
INSERT INTO public.moon VALUES (2, 'Deimos', 12, false, 2, 1.3, 'Heavily cratered surface');
INSERT INTO public.moon VALUES (3, 'Ganymede', 5262, false, 4, 7.2, 'Complex terrain with impact craters, grooves, and ridges');
INSERT INTO public.moon VALUES (4, 'Titan', 5150, false, 5, 15.9, 'Methane lakes, sand dunes, and icy plains');
INSERT INTO public.moon VALUES (5, 'Triton', 2707, false, 6, 5.9, 'Cryovolcanoes, ridges, and impact craters');
INSERT INTO public.moon VALUES (6, 'Europa', 3121, true, 7, 3.5, 'Smooth plains, fractures, and possible subsurface ocean');
INSERT INTO public.moon VALUES (7, 'Callisto', 4800, false, 7, 16.7, 'Heavily cratered surface with few signs of geological activity');
INSERT INTO public.moon VALUES (8, 'Io', 3637, false, 7, 1.8, 'Volcanic surface with sulfur deposits and lava flows');
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, true, 5, 1.4, 'Geysers of water vapor and icy surface');
INSERT INTO public.moon VALUES (10, 'Titania', 1578, false, 7, 8.7, 'Impact craters and fault lines');
INSERT INTO public.moon VALUES (11, 'Miranda', 235, true, 6, 1.4, 'Complex terrain with canyons and scarps');
INSERT INTO public.moon VALUES (12, 'Ariel', 1160, false, 8, 2.5, 'Smooth plains and fractured terrain');
INSERT INTO public.moon VALUES (13, 'Umbriel', 1170, false, 8, 4.1, 'Dark, heavily cratered surface');
INSERT INTO public.moon VALUES (14, 'Tethys', 1060, true, 9, 1.9, 'Icy surface with large impact craters');
INSERT INTO public.moon VALUES (15, 'Rhea', 1528, true, 9, 4.5, 'Bright, heavily cratered surface');
INSERT INTO public.moon VALUES (16, 'Dione', 1122, true, 9, 2.7, 'Bright, fractured surface with linear features');
INSERT INTO public.moon VALUES (17, 'Iapetus', 1436, false, 9, 79, 'Two-toned surface with a bright trailing hemisphere and a dark leading hemisphere');
INSERT INTO public.moon VALUES (18, 'Charon', 1207, false, 10, 6.4, 'Geologically diverse terrain with cliffs, troughs, and plains');
INSERT INTO public.moon VALUES (19, 'Ceres', 939, false, 11, 4.6, 'Rocky surface with a mixture of craters and smooth areas');
INSERT INTO public.moon VALUES (20, 'Plutos Moon', 1187, false, 12, 6.4, 'Surface covered in water ice and methane ice with craters and cliffs');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371, true, true, 1, 365.25, 'Diverse terrain including oceans, mountains, and plains');
INSERT INTO public.planet VALUES (2, 'Mars', 3389, false, false, 1, 687, 'Rocky terrain with evidence of ancient riverbeds and valleys');
INSERT INTO public.planet VALUES (3, 'Venus', 6052, true, false, 1, 224.7, 'Volcanic terrain with a dense atmosphere of carbon dioxide');
INSERT INTO public.planet VALUES (4, 'Jupiter', 69911, true, false, 1, 4331, 'Gas giant composed mainly of hydrogen and helium');
INSERT INTO public.planet VALUES (5, 'Saturn', 58232, true, false, 1, 10747, 'Gas giant with prominent rings made of ice particles and dust');
INSERT INTO public.planet VALUES (6, 'Neptune', 24622, true, false, 1, 60190, 'Ice giant with a blue hue due to methane in its atmosphere');
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, true, false, 1, 30660, 'Ice giant with a tilted axis of rotation');
INSERT INTO public.planet VALUES (8, 'Mercury', 2439, false, false, 1, 88, 'Rocky terrain with extreme temperature variations');
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 6371, true, true, 1, 130, 'Terrestrial planet within the habitable zone of its star');
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 149820, false, false, 1, 3.5, 'Hot Jupiter with a close orbit to its star');
INSERT INTO public.planet VALUES (11, 'Gliese 581 c', 7879, true, true, 1, 12.9, 'Terrestrial planet within the habitable zone of its star');
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 16241, false, false, 1, 4.2, 'Hot Jupiter with a close orbit to its star');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, true, 1, 1.0, 'Mainly composed of hydrogen and helium');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3042, true, 1, 0.001, 'Low-mass star with a high proportion of red dwarf stars');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5790, true, 1, 1.5, 'Binary star system with a similar composition to the Sun');
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 5260, true, 1, 1.1, 'Binary star system with a similar composition to the Sun');
INSERT INTO public.star VALUES (5, 'Sirius', 9940, true, 1, 23.6, 'Brightest star in the night sky, primarily composed of hydrogen and helium');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 3600, false, 1, 135000, 'Red supergiant star, nearing the end of its life cycle');
INSERT INTO public.star VALUES (7, 'Vega', 9602, true, 1, 40.1, 'Main-sequence star with a relatively high rotation speed');


--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_event_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: celestial_event celestial_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_name_key UNIQUE (name);


--
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

