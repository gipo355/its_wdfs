// test.js
import assert from 'node:assert';
import { describe,it } from 'node:test';

import { isDivisibleBy3, sumNumbers } from './main.js';

describe('sumNumbers', () => {
  it('should return the sum of all numbers', () => {
    assert.strictEqual(sumNumbers(1, 2, 3, 4, 5), 15);
  });
});

describe('isDivisibleBy3', () => {
  it('should return correct division result', () => {
    const result = isDivisibleBy3({ numberToDivide: 9, divisor: 3 });
    assert.deepStrictEqual(result, {
      isDivisible: true,
      quotient: 3,
      remainder: 0,
    });
  });
});
