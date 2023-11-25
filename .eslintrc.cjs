module.exports = {
  extends: ['@gipo355/eslint-config-base'],
  settings: {
    'import/resolver': {
      typescript: {
        alwaysTryTypes: true,
        project: './tsconfig.eslint.json',
      },
    },
  },
  parserOptions: {
    tsconfigRootDir: __dirname, // new addition
    project: ['./tsconfig.eslint.json'],
  },
};
