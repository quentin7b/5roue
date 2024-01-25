
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

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

CREATE SCHEMA IF NOT EXISTS "supabase_migrations";

ALTER SCHEMA "supabase_migrations" OWNER TO "postgres";

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

CREATE TYPE "public"."platform" AS ENUM (
    'steam',
    'psn'
);

ALTER TYPE "public"."platform" OWNER TO "postgres";

CREATE TYPE "public"."user_language" AS ENUM (
    'fr',
    'en'
);

ALTER TYPE "public"."user_language" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."game" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "created_at" timestamp with time zone DEFAULT now() NOT NULL,
    "name" text NOT NULL,
    "max_coop_players" smallint DEFAULT '0'::smallint NOT NULL,
    "is_crossplatform" boolean DEFAULT false NOT NULL
);

ALTER TABLE "public"."game" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."game_level" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "game_id" uuid NOT NULL,
    "name" text NOT NULL
);

ALTER TABLE "public"."game_level" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."game_platform" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "game_id" uuid NOT NULL,
    "platform" public.platform NOT NULL
);

ALTER TABLE "public"."game_platform" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."session" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "owner_id" uuid,
    "game_id" uuid,
    "search_player_max_count" smallint DEFAULT '0'::smallint NOT NULL,
    "is_open" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE "public"."session" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."session_criteria_language" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "session_id" uuid NOT NULL,
    "language" public.user_language NOT NULL
);

ALTER TABLE "public"."session_criteria_language" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."session_criteria_level" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "session_id" uuid NOT NULL,
    "level_id" uuid
);

ALTER TABLE "public"."session_criteria_level" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."session_user" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "session_id" uuid NOT NULL,
    "user_id" uuid NOT NULL,
    "has_accepted" boolean DEFAULT false NOT NULL,
    "has_been_accepted" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL
);

ALTER TABLE "public"."session_user" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."user" (
    "id" uuid DEFAULT auth.uid() NOT NULL,
    "created_at" timestamp with time zone DEFAULT now() NOT NULL,
    "username" text NOT NULL
);

ALTER TABLE "public"."user" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."user_game" (
    "user_id" uuid NOT NULL,
    "game_id" uuid NOT NULL,
    "created_at" timestamp with time zone DEFAULT now() NOT NULL,
    "platform_id" uuid NOT NULL
);

ALTER TABLE "public"."user_game" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."user_spoken_language" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "user_id" uuid NOT NULL,
    "language" public.user_language NOT NULL,
    "created_at" timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE "public"."user_spoken_language" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "supabase_migrations"."schema_migrations" (
    "version" text NOT NULL,
    "statements" text[],
    "name" text
);

ALTER TABLE "supabase_migrations"."schema_migrations" OWNER TO "postgres";

ALTER TABLE ONLY "public"."game_level"
    ADD CONSTRAINT "game_levels_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."game"
    ADD CONSTRAINT "game_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."game_platform"
    ADD CONSTRAINT "game_platforms_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."session_criteria_language"
    ADD CONSTRAINT "session_criteria_language_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."session_criteria_level"
    ADD CONSTRAINT "session_criteria_level_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."session"
    ADD CONSTRAINT "session_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."session_user"
    ADD CONSTRAINT "session_user_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."user_game"
    ADD CONSTRAINT "user_game_pkey" PRIMARY KEY ("user_id", "game_id");

ALTER TABLE ONLY "public"."user_spoken_language"
    ADD CONSTRAINT "user_languages_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "supabase_migrations"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");

ALTER TABLE ONLY "public"."game_level"
    ADD CONSTRAINT "game_level_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."game_platform"
    ADD CONSTRAINT "game_platform_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."session_criteria_language"
    ADD CONSTRAINT "session_criteria_language_session_id_fkey" FOREIGN KEY (session_id) REFERENCES public.session(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."session_criteria_level"
    ADD CONSTRAINT "session_criteria_level_level_id_fkey" FOREIGN KEY (level_id) REFERENCES public.game_level(id);

ALTER TABLE ONLY "public"."session_criteria_level"
    ADD CONSTRAINT "session_criteria_level_session_id_fkey" FOREIGN KEY (session_id) REFERENCES public.session(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."session"
    ADD CONSTRAINT "session_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(id);

ALTER TABLE ONLY "public"."session"
    ADD CONSTRAINT "session_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES public."user"(id);

ALTER TABLE ONLY "public"."session_user"
    ADD CONSTRAINT "session_user_session_id_fkey" FOREIGN KEY (session_id) REFERENCES public.session(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."session_user"
    ADD CONSTRAINT "session_user_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."user_game"
    ADD CONSTRAINT "user_game_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."user_game"
    ADD CONSTRAINT "user_game_platform_id_fkey" FOREIGN KEY (platform_id) REFERENCES public.game_platform(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."user_game"
    ADD CONSTRAINT "user_game_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;

ALTER TABLE ONLY "public"."user_spoken_language"
    ADD CONSTRAINT "user_spoken_language_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;

ALTER TABLE "public"."game" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."game_level" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."game_platform" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."session" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."session_criteria_language" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."session_criteria_level" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."session_user" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."user" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."user_game" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."user_spoken_language" ENABLE ROW LEVEL SECURITY;

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON TABLE "public"."game" TO "anon";
GRANT ALL ON TABLE "public"."game" TO "authenticated";
GRANT ALL ON TABLE "public"."game" TO "service_role";

GRANT ALL ON TABLE "public"."game_level" TO "anon";
GRANT ALL ON TABLE "public"."game_level" TO "authenticated";
GRANT ALL ON TABLE "public"."game_level" TO "service_role";

GRANT ALL ON TABLE "public"."game_platform" TO "anon";
GRANT ALL ON TABLE "public"."game_platform" TO "authenticated";
GRANT ALL ON TABLE "public"."game_platform" TO "service_role";

GRANT ALL ON TABLE "public"."session" TO "anon";
GRANT ALL ON TABLE "public"."session" TO "authenticated";
GRANT ALL ON TABLE "public"."session" TO "service_role";

GRANT ALL ON TABLE "public"."session_criteria_language" TO "anon";
GRANT ALL ON TABLE "public"."session_criteria_language" TO "authenticated";
GRANT ALL ON TABLE "public"."session_criteria_language" TO "service_role";

GRANT ALL ON TABLE "public"."session_criteria_level" TO "anon";
GRANT ALL ON TABLE "public"."session_criteria_level" TO "authenticated";
GRANT ALL ON TABLE "public"."session_criteria_level" TO "service_role";

GRANT ALL ON TABLE "public"."session_user" TO "anon";
GRANT ALL ON TABLE "public"."session_user" TO "authenticated";
GRANT ALL ON TABLE "public"."session_user" TO "service_role";

GRANT ALL ON TABLE "public"."user" TO "anon";
GRANT ALL ON TABLE "public"."user" TO "authenticated";
GRANT ALL ON TABLE "public"."user" TO "service_role";

GRANT ALL ON TABLE "public"."user_game" TO "anon";
GRANT ALL ON TABLE "public"."user_game" TO "authenticated";
GRANT ALL ON TABLE "public"."user_game" TO "service_role";

GRANT ALL ON TABLE "public"."user_spoken_language" TO "anon";
GRANT ALL ON TABLE "public"."user_spoken_language" TO "authenticated";
GRANT ALL ON TABLE "public"."user_spoken_language" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
