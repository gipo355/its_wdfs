module.exports = {
  extends: ['@gipo355/eslint-config-base'],
  parserOptions: {
    tsconfigRootDir: __dirname, // new addition
    project: ['./tsconfig.eslint.json'],
  },
};
