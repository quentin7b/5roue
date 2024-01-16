import { jwtMiddleware } from "@middlewares/jwt.middleware";
import { users } from "@prisma/client";
import { AuthService } from "@services/auth.service";
import { UserService } from "@services/user.service";
import Elysia from "elysia";
import { loginGuard } from "./login.guard";

export const loginController = (app: Elysia) => {
  const authService = AuthService();
  const userService = UserService();

  app
    .use(jwtMiddleware)
    .guard(loginGuard)
    .post("/login", async ({ jwt, body }) => {
      const { email, password } = body;
      // Check for the password of the provided email in the database
      // Check if the user does not already exists
      const user: users = await userService.findOne({
        email: email,
        id: undefined,
      });

      const passwordMatch = await Bun.password.verify(user.password, password);

      if (!passwordMatch) {
        // todo 400
        throw new Error("Invalid credentials");
      }

      // Return the token
      return {
        accessToken: await authService.generateToken({ userId: user.id, jwt }),
      };
    });

  return app;
};
