module.exports = {
  extends: ['../../../.eslintrc.cjs'],
  ignorePatterns: ['!**/*'],
  parserOptions: {
    tsconfigRootDir: __dirname, // new addition
    // project: ['./tsconfig.json'],
    project: ['./tsconfig.*?.json'],
  },
};
