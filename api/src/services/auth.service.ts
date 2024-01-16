export const AuthService = () => {
  /**
   * Generate a signed jwt for a user
   * @param {string|undefined} id the id of the user
   * @param {any} jwt the jwt instance
   * @returns {string} the signed jwt
   */
  const generateToken = async ({
    userId,
    jwt,
  }: {
    userId: string;
    jwt: any;
  }): Promise<string> => {
    const token = await jwt.sign({ userId });
    return token;
  };

  /**
   * Decode the jwt and return the user id
   * @param {string} token the token to decode
   * @param {any} jwt the jwt instance
   * @returns {string} the decoded user id
   */
  const getUserId = async ({
    token,
    jwt,
  }: {
    token: string;
    jwt: any;
  }): Promise<string> => {
    const decoded = await jwt.verify(token);
    return decoded.userId;
  };

  /**
   * Return exposed methods
   */
  return {
    generateToken,
    getUserId,
  };
};
