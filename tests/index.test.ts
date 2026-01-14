import { expect, test } from '@jest/globals';

function greet(name: string): string {
  return `Hello, ${name}`;
}

test('greet returns correct value', () => {
  expect(greet('World')).toBe('Hello, World');
});
