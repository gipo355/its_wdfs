// FILEPATH: /home/wolf/Programming/COURSES/its_wdfs/algo-data-structures/20231114/exercises/three/main.test.ts
import { sumNumbers, isDivisibleBy3 } from './main.ts';
import { assertEquals } from 'https://deno.land/std@0.207.0/assert/mod.ts';

Deno.test('sumNumbers correctly sums numbers', () => {
  const result = sumNumbers(1, 2, 3, 4, 5);
  assertEquals(result, 15);
});

Deno.test('isDivisibleBy3 correctly checks divisibility', () => {
  const result = isDivisibleBy3({ numberToDivide: 9, divisor: 3 });
  assertEquals(result, { isDivisible: true, quotient: 3, remainder: 0 });
});

Deno.test('isDivisibleBy3 correctly checks remainder', () => {
  const result = isDivisibleBy3({ numberToDivide: 10, divisor: 3 });
  assertEquals(result.isDivisible, false);
  assertEquals(result.remainder, 1);
});
