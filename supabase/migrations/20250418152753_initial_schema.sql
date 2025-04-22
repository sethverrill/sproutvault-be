--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Homebrew)
-- Dumped by pg_dump version 14.15 (Homebrew)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: children; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.children (
    id bigint NOT NULL,
    name character varying,
    birthdate date,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: children_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.children_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: children_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.children_id_seq OWNED BY public.children.id;


--
-- Name: daycare_hours; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.daycare_hours (
    id bigint NOT NULL,
    daycare_provider_id bigint NOT NULL,
    child_id bigint NOT NULL,
    date date,
    start_time time without time zone,
    end_time time without time zone,
    duration interval,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: daycare_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.daycare_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: daycare_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.daycare_hours_id_seq OWNED BY public.daycare_hours.id;


--
-- Name: daycare_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.daycare_providers (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    provider_type integer DEFAULT 0 NOT NULL,
    other_description character varying
);


--
-- Name: daycare_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.daycare_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: daycare_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.daycare_providers_id_seq OWNED BY public.daycare_providers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: children id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.children ALTER COLUMN id SET DEFAULT nextval('public.children_id_seq'::regclass);


--
-- Name: daycare_hours id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daycare_hours ALTER COLUMN id SET DEFAULT nextval('public.daycare_hours_id_seq'::regclass);


--
-- Name: daycare_providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daycare_providers ALTER COLUMN id SET DEFAULT nextval('public.daycare_providers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: children children_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT children_pkey PRIMARY KEY (id);


--
-- Name: daycare_hours daycare_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daycare_hours
    ADD CONSTRAINT daycare_hours_pkey PRIMARY KEY (id);


--
-- Name: daycare_providers daycare_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daycare_providers
    ADD CONSTRAINT daycare_providers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_children_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_children_on_user_id ON public.children USING btree (user_id);


--
-- Name: index_daycare_hours_on_child_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_daycare_hours_on_child_id ON public.daycare_hours USING btree (child_id);


--
-- Name: index_daycare_hours_on_daycare_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_daycare_hours_on_daycare_provider_id ON public.daycare_hours USING btree (daycare_provider_id);


--
-- Name: index_daycare_providers_on_provider_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_daycare_providers_on_provider_type ON public.daycare_providers USING btree (provider_type);


--
-- Name: index_users_on_lower_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_email ON public.users USING btree (lower((email)::text));


--
-- Name: daycare_hours fk_rails_143ab270de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daycare_hours
    ADD CONSTRAINT fk_rails_143ab270de FOREIGN KEY (child_id) REFERENCES public.children(id);


--
-- Name: daycare_hours fk_rails_451973840c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daycare_hours
    ADD CONSTRAINT fk_rails_451973840c FOREIGN KEY (daycare_provider_id) REFERENCES public.daycare_providers(id);


--
-- Name: children fk_rails_a51d7cfb22; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT fk_rails_a51d7cfb22 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

