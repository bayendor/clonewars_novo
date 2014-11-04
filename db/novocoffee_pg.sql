--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: products; Type: TABLE; Schema: public; Owner: David; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    region character varying,
    type character varying,
    description text,
    price integer,
    img character varying
);


ALTER TABLE public.products OWNER TO "David";

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: David
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO "David";

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: David
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: David
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: David
--

COPY products (id, name, region, type, description, price, img) FROM stdin;
1	Kiamwangi	Africa	regular	 	2000	Kiamwangi
2	Belekatu	Africa	regular	 	1600	belekatu.web_.pair
3	Anyetsu	Africa	regular	Developed in conjunction with producer Ninety Plus Coffee, Anyetsu is an exclusive Novo brand. Always a fruit forward, sun-dried Ethiopian coffee, nuances can range from floral to chocolate to banana and beyond. Always delicious, at least according to this guy.	1600	africa_anyetsu.png
4	Novo Decaf Espresso	Africa	espresso	 	1450	africa_novo-decaf-espresso.png
5	Anyetsu Espresso	Africa	espresso	Developed in conjunction with producer Ninety Plus Coffee, Anyetsu is an exclusive Novo brand. Always a fruit forward, sun-dried Ethiopian coffee, nuances can range from floral to chocolate to banana and beyond. Anyetsu Espresso is roasted a little longer and is developed especially for brewing as an espresso.	16	africa_anyetsu-espresso.png
6	Novo Decaf	Africa	decaf	 	1450	africa_novo-decaf.png
7	Hachira	Africa	regular	 	2800	africa_hachira.png
8	El Aguila Bourbon	Central America	regular	 	1600	Bourbon_website1.png
9	El Aguila Pacamara	Central America	regular	 	1800	Pacamara_website1.png
10	Ojo de Agua	Central America	regular	 	1400	OjoDeAgua.png
11	Finca Isnul	Central America	regular	 	1400	FincaIsnul1.png
12	4 Mujeres	Central America	regular	 	1500	4mujeres1.png
13	Hartmann Honey	Central America	regular	 	1500	HarmannHoney.png
14	Hartmann Geisha	Central America	regular	 	3200	geisha.web_2.png
15	El Banco	Central America	regular	We’re sorry, this product is unavailable. Novo’s El Banco comes from our friend Luis Araujo’s farm in eastern El Salvador. Why the piggy bank, you ask? The El Banco coffee trees, found on a tiny plot of land at 1,450 meters,  are the original source or “seed bank” of the pacamara varietal. This varietal is now commonly found throughout Central and South America. Unfortunately, due to the devastating coffee leaf rust, the 2013 El Banco coffee crop from the Araujo farm was destroyed and we aren’t able to offer it this year.	1600	ca-el_banco.png
16	Mundani	Central America	regular	We’re sorry, this product is unavailable. Down the hill from the tiny El Banco plot on Luis Araujo’s farm lies another small lot of pacamara coffee trees (a hybrid of the giant-bean maragogipe and pacas). This lot, found on Luis’s farm in eastern El Salvador, lies at 1,400 meters and  is dominated by Mundani shade trees. Unfortunately, due to coffee leaf rust, the 2013 crop of Mundani coffee has been destroyed.	1450	ca_mundani.png
17	Ulos Batak	Pacific	regular	 	1500	pacific_ulos-batak.png
18	Espresso Del Fuego	 	espresso blend	 	1450	blend_espresso-del-fuego.png
19	Espresso Novo		espresso blend	Our house espresso – designed, roasted, and blended for all around drinkability. Well balanced, great straight or with milk. Blend components usually consist of coffees from Ethiopia, Panama, and Colombia, with an occasional fresh guest.	1600	blend_espresso-novo.png
20	Four Leftys	 	blend	 	1350	blend-four_leftys.png
21	Espresso Novo Mug	 	accessories	Imported from expert Italian porcelain manufacturer d’Ancap and crafted outside of Sona, Italy, these highly durable and exceptionally lovely mugs feature the Espresso Novo logo. d’ANCAP is recognized as one of the finest producers of coffee and espresso vessels in the world. These mugs are paired with a saucer and are available in traditional espresso (75 mL or ~2.5 oz), cappuccino (180 mL or ~6 oz), and latte (350 mL or ~12 oz) sizes.	1500	mug.jpg
22	The Variety	 	accessories	A great holiday gift for the coffee lover. Three 4 oz. packages of coffee hand-picked by our roasters and shipped on the first Tuesday of every month for 3 months, 6 months, or one year.	5985	Novo-Glenarm-Opening-High-res019.jpg
23	The Single	 	accessories	Deliciousness at your door: a great holiday idea.One 12 oz bag of of coffee hand-picked by our roasters and shipped on the first Tuesday of every month for 3 months, 6 months, or one year.	5985	Novo-Glenarm-Opening-High-res019.jpg
24	The Double	 	accessories	The coffee lover needs options. Two 12 oz bags of of coffee hand-picked by our roasters and shipped on the first Tuesday of every month for 3 months, 6 months, or one year.	10185	Novo-Glenarm-Opening-High-res019.jpg
25	Ritual Chocolate Anyetsu bar	 	 	This delightful bar, handcrafted by our next door neighbors and expert chocolatiers Ritual Chocolate, is made with single estate Balao chocolate and our very own Anyetsu coffee. The cacao hails from the Camino Verde farm in Balao, Ecuador, a lush growing region nestled between the Pacific Ocean and the Andes Mountains. The pairing of Balao and Anyetsu results in rich coffee and chocolate flavors, revealing notes of blueberry and honeycomb.	675	ritual-chocolate-bar.jpg
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: David
--

SELECT pg_catalog.setval('products_id_seq', 1, false);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: David; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: David
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "David";
GRANT ALL ON SCHEMA public TO "David";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

