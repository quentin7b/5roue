-- CreateEnum
CREATE TYPE "platform" AS ENUM ('STEAM', 'PSN', 'EA');

-- CreateTable
CREATE TABLE "game_levels" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "level_name" TEXT,

    CONSTRAINT "game_levels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "game_platforms" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "game_id" UUID,
    "platform" "platform",

    CONSTRAINT "game_platforms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "games" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "max_coop_players" INTEGER NOT NULL,
    "is_crossplatform" BOOLEAN,

    CONSTRAINT "games_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "languages" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "full_name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "session_languages" (
    "session_id" UUID NOT NULL,
    "language_id" UUID NOT NULL,

    CONSTRAINT "session_languages_pkey" PRIMARY KEY ("session_id","language_id")
);

-- CreateTable
CREATE TABLE "session_levels" (
    "session_id" UUID NOT NULL,
    "level_id" UUID NOT NULL,

    CONSTRAINT "session_levels_pkey" PRIMARY KEY ("session_id","level_id")
);

-- CreateTable
CREATE TABLE "session_search_matches" (
    "session_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "has_joinded" BOOLEAN,
    "has_been_accepted" BOOLEAN,

    CONSTRAINT "session_search_matches_pkey" PRIMARY KEY ("session_id","user_id")
);

-- CreateTable
CREATE TABLE "sessions" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "owner_id" UUID,
    "game_platform_id" UUID,
    "coop_players_search_count" INTEGER,
    "is_open" BOOLEAN,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_games" (
    "user_id" UUID NOT NULL,
    "game_id" UUID NOT NULL,
    "level_id" UUID NOT NULL,

    CONSTRAINT "user_games_pkey" PRIMARY KEY ("user_id","game_id","level_id")
);

-- CreateTable
CREATE TABLE "user_languages" (
    "user_id" UUID NOT NULL,
    "language_id" UUID NOT NULL,

    CONSTRAINT "user_languages_pkey" PRIMARY KEY ("user_id","language_id")
);

-- CreateTable
CREATE TABLE "user_platforms" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID,
    "platform" "platform",
    "platform_username" TEXT NOT NULL,

    CONSTRAINT "user_platforms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "languages_full_name_key" ON "languages"("full_name");

-- CreateIndex
CREATE UNIQUE INDEX "languages_short_name_key" ON "languages"("short_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "game_platforms" ADD CONSTRAINT "game_platforms_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "games"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session_languages" ADD CONSTRAINT "session_languages_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session_languages" ADD CONSTRAINT "session_languages_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "sessions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session_levels" ADD CONSTRAINT "session_levels_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "game_levels"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session_levels" ADD CONSTRAINT "session_levels_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "sessions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session_search_matches" ADD CONSTRAINT "session_search_matches_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "sessions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session_search_matches" ADD CONSTRAINT "session_search_matches_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_game_platform_id_fkey" FOREIGN KEY ("game_platform_id") REFERENCES "game_platforms"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_games" ADD CONSTRAINT "user_games_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "games"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_games" ADD CONSTRAINT "user_games_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "game_levels"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_games" ADD CONSTRAINT "user_games_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_languages" ADD CONSTRAINT "user_languages_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_languages" ADD CONSTRAINT "user_languages_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_platforms" ADD CONSTRAINT "user_platforms_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
