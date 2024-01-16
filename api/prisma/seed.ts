import { PrismaClient, platform } from "@prisma/client";

const prisma = new PrismaClient();

async function seedGames() {
  return Promise.all(
    [
      {
        id: "1ae78a64-6806-48e7-8f63-aaea6bcdf730",
        name: "cs2",
      },
      {
        id: " 9439d7a4-9b30-4c65-87ff-5194396f9af8",
        name: "elite dangerous",
      },
    ].map(async (game) => {
      const data = {
        id: game.id,
        name: game.name,
        max_coop_players: 5,
        is_crossplatform: false,
      };
      await prisma.games.upsert({
        where: { id: data.id },
        create: data,
        update: data,
      });
    })
  );
}
async function seedUsers() {
  return Promise.all(
    ["a", "b", "c", "d", "e", "f", "j"].map(async (username) => {
      const data = {
        email: `${username}@a.fr`,
        username: username,
        password: username,
        platforms: {
          create: { platform: platform.STEAM, platform_username: username },
        },
      };
      await prisma.users.upsert({
        where: { username },
        create: data,
        update: data,
      });
    })
  );
}

const main = async () => {
  await seedGames();
  await seedUsers();
};

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
