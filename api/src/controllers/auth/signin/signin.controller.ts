import { jwtMiddleware } from "@middlewares/jwt.middleware";
import { AuthService } from "@services/auth.service";
import { UserService } from "@services/user.service";
import Elysia from "elysia";
import { signinGuard } from "./signin.guard";

export const signinController = (app: Elysia) => {
  const authService = AuthService();
  const userService = UserService();

  app
    .use(jwtMiddleware)
    .guard(signinGuard)
    .post("/signin", async ({ jwt, body }) => {
      const { username, email, password } = body;
      // Check if the user does not already exists
      const userAlreadyExists = await userService.exists({
        email,
        username,
      });

      if (userAlreadyExists) {
        throw Error("User email or username already exists"); // Conflicf;
      }

      // Create the user
      const user = await userService.create({ email, password, username });

      // Generate jwt
      return {
        accessToken: await authService.generateToken({ userId: user.id, jwt }),
      };
    });

  return app;
};
