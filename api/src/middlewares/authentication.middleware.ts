import bearer from "@elysiajs/bearer";
import { UnauthorizedError } from "@root/errors/unauthorized.error";
import { AuthService } from "@services/auth.service";
import { Elysia } from "elysia";
import { jwtMiddleware } from "./jwt.middleware";

export const authenticationMiddleware = (app: Elysia) => {
  const authService = AuthService();

  // Why derive ? See https://elysiajs.com/life-cycle/transform.html#derive
  app
    .use(bearer())
    .use(jwtMiddleware)
    .derive(async ({ bearer, jwt }) => {
      if (!bearer) {
        throw new UnauthorizedError();
      }
      const userId = await authService.getUserId({ token: bearer, jwt });
      if (!userId) {
        throw new Error("Invalid bearer");
      }
      // Append userId directly to context for later use
      return {
        userId,
      };
    });

  return app;
};
