import bearer from "@elysiajs/bearer";
import swagger from "@elysiajs/swagger";
import { Elysia, ValidationError } from "elysia";
import { usersController } from "./controllers/api/users/users.controller";
import { loginController } from "./controllers/auth/login/login.controller";
import { signinController } from "./controllers/auth/signin/signin.controller";
import { CustomError } from "./errors/custom.error";
import { UnauthorizedError } from "./errors/unauthorized.error";
import { authenticationMiddleware } from "./middlewares/authentication.middleware";

const app = new Elysia()
  .use(
    swagger({
      documentation: {
        info: {
          title: "API 5eme roue",
          version: "0.0.1",
        },
      },
    })
  )
  .group(
    "/api",
    (app) =>
      app
        .use(bearer())
        .use(authenticationMiddleware)
        .use(usersController)
        .get("/", () => "Hello Elysia")
    // Now we are authenticated behind this
  )
  .group("/auth", (app) =>
    // No authentication needed for the group
    app.use(signinController).use(loginController)
  )
  .error({ UNAUTHORIZED: UnauthorizedError })
  .onError(({ error, code, set, path, request, body, params, query }) => {
    console.log({ error, code, path, request, body, params, query });
    if (error instanceof ValidationError) {
      return {
        message: "Invalid body",
        errors: error.all,
      };
    }
    if (error instanceof CustomError) {
      set.status = error.status;
      return { message: error.message };
    }
  })
  .listen(process.env.APP_PORT || 3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
