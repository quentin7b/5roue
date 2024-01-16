import { Prisma, PrismaClient, users } from "@prisma/client";

export const UserService = () => {
  const prismaClient = new PrismaClient({});

  /**
   * Check if the user exists based on email or username or both
   * @param {string|undefined} email the email of the user
   * @param {string|undefined} username the username of the user
   * @returns {boolean} true if the user exists, false otherwise
   */
  const exists = async ({
    email,
    username,
  }: {
    email: string | undefined;
    username: string | undefined;
  }): Promise<boolean> => {
    const conditions: Prisma.usersWhereInput[] = [];
    if (email) {
      conditions.push({ email });
    }
    if (username) {
      conditions.push({ username });
    }

    const userCount = await prismaClient.users.count({
      where: {
        OR: conditions,
      },
    });
    return userCount > 0;
  };

  /**
   * Create a new user in the database
   * @param {string} email the email of the user
   * @param {string} password the clear password of the user
   * @param {string} username the username of the user
   * @returns {users} the created user
   */
  const create = async ({
    email,
    password,
    username,
  }: {
    email: string;
    password: string;
    username: string;
  }): Promise<users> => {
    const hashedPassword = await Bun.password.hash(password);
    const user = await prismaClient.users.create({
      data: {
        email,
        password: hashedPassword,
        username,
      },
    });
    return user;
  };

  /**
   * Find a user in the database, based on email or id
   * If both are provided, the id is used
   * If neither are provided, an error is thrown
   * @param {string|undefined} email the email of the user
   * @param {string|undefined} id the id of the user
   * @returns {users} the user
   * @throws {Error} if neither email nor id are provided
   */
  const findOne = async ({
    email,
    id,
  }: {
    email: string | undefined;
    id: string | undefined;
  }): Promise<users> => {
    if (!email && !id) {
      throw new Error("Either email or id must be provided");
    }

    if (id) {
      return await prismaClient.users.findUniqueOrThrow({
        where: {
          id,
        },
      });
    }

    return await prismaClient.users.findUniqueOrThrow({
      where: {
        email,
      },
    });
  };

  /**
   * Return exposed methods
   */
  return {
    exists,
    create,
    findOne,
  };
};
