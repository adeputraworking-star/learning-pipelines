import tseslint from 'typescript-eslint';

export default tseslint.config(
  // 1️⃣ Global ignores
  {
    ignores: ['dist', 'node_modules', '**/*.d.ts',],
  },

  // 2️⃣ TypeScript files
  {
    files: ['**/*.ts'],
    languageOptions: {
      parser: tseslint.parser, // ⭐ REQUIRED
      parserOptions: {
        project: './tsconfig.json',
        sourceType: 'module',
      },
    },
    rules: {
      semi: 'error',
      quotes: ['error', 'single'],
    },
  }
);
