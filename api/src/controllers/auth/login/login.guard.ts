import { t } from "elysia";

export const loginGuard = {
  body: t.Object({
    email: t.String({ format: "email", description: "User email" }),
    password: t.String({
      description: "User password",
      // regex for 8 charactes min password with at least 1 uppercase, 1 lowercase, 1 number and 1 special character
      pattern:
        "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
    }),
  }),
};
