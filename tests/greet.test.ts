import { expect, test } from '@jest/globals';
import { greet } from '../src/index';

test('greet returns correct value', () => {
  expect(greet('World')).toBe('Hello, World!');
});
