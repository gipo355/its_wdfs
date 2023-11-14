import {
  assertEquals,
  assertThrows,
} from 'https://deno.land/std/testing/asserts.ts';

import { discountedPrice, isSufficient } from './main.jss';

/**
 * ## Discounted Price
 */
Deno.test(
  'discountedPrice should return the correct discounted price when given a price and a discount',
  () => {
    assertEquals(discountedPrice(100, 0.1), 90);
    assertEquals(discountedPrice(200, 0.5), 100);
    assertEquals(discountedPrice(50, 0.2), 40);
  }
);

Deno.test(
  'discountedPrice should return the original price when the discount is 0',
  () => {
    assertEquals(discountedPrice(100, 0), 100);
  }
);

Deno.test('discountedPrice should return 0 when the discount is 1', () => {
  assertEquals(discountedPrice(100, 1), 0);
});

Deno.test(
  'discountedPrice should throw an error when the discount is greater than 1',
  () => {
    assertThrows(() => discountedPrice(100, 1.1));
  }
);

Deno.test(
  'discountedPrice should throw an error when the discount is less than 0',
  () => {
    assertThrows(() => discountedPrice(100, -0.1));
  }
);

/**
 * ## Is Sufficient
 */
Deno.test(
  'isSufficient should return true when the grade is equal to the threshold',
  () => {
    assertEquals(isSufficient(70, 70), true);
  }
);

Deno.test(
  'isSufficient should return true when the grade is greater than the threshold',
  () => {
    assertEquals(isSufficient(75, 70), true);
  }
);

Deno.test(
  'isSufficient should return false when the grade is less than the threshold',
  () => {
    assertEquals(isSufficient(65, 70), false);
  }
);

Deno.test(
  'isSufficient should return true when the grade is 0 and the threshold is 0',
  () => {
    assertEquals(isSufficient(0, 0), true);
  }
);

Deno.test(
  'isSufficient should return false when the grade is 0 and the threshold is greater than 0',
  () => {
    assertEquals(isSufficient(0, 1), false);
  }
);
