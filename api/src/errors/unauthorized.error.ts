import { CustomError } from "./custom.error";

export class UnauthorizedError extends CustomError {
  constructor() {
    super("You are not authorized", 401);
  }
}
