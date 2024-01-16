import { authenticationMiddleware } from "@middlewares/authentication.middleware";
import Elysia from "elysia";

export const usersController = (app: Elysia) => {
  app.use(authenticationMiddleware).group("/users", (app) =>
    app.get("/me", async (handler) => {
      // Check for the password of the provided email in the database
      return `Hello ${handler.userId}`;
    })
  );

  return app;
};
