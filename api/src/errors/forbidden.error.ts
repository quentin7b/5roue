import { CustomError } from "./custom.error";

export class ForbiddenError extends CustomError {
  constructor() {
    super("You are not allowed", 403);
  }
}
