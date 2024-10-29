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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.data (
    username character varying(22),
    best_game integer DEFAULT 0,
    games_played integer DEFAULT 0
);


ALTER TABLE public.data OWNER TO freecodecamp;

--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.data VALUES ('fortunat', 0, 0);
INSERT INTO public.data VALUES ('user_1730176459409', 0, 0);
INSERT INTO public.data VALUES ('user_1730176459408', 0, 0);
INSERT INTO public.data VALUES ('user_1730176556491', 0, 0);
INSERT INTO public.data VALUES ('user_1730176556490', 0, 0);
INSERT INTO public.data VALUES ('stephane', 0, 0);
INSERT INTO public.data VALUES ('rick', 0, 0);
INSERT INTO public.data VALUES ('jak', 0, 0);
INSERT INTO public.data VALUES ('user_1730176745064', 0, 0);
INSERT INTO public.data VALUES ('user_1730176745063', 0, 0);
INSERT INTO public.data VALUES ('user_1730176811502', 0, 0);
INSERT INTO public.data VALUES ('user_1730176811501', 0, 0);


--
-- PostgreSQL database dump complete
--

