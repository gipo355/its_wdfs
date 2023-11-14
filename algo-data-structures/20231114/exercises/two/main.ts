export const areaRectangle = function areaRectangle(
  base: number,
  height: number
): number {
  return base * height;
};

export const perimeterRectangle = function perimeterRectangle(
  base: number,
  height: number
): number {
  return 2 * (base + height);
};

export const discountedPrice = function discountedPrice(
  price: number,
  discount: number
): number {
  if (discount > 1 || discount < 0) {
    throw new Error('Discount must be between 0 and 1');
  }
  return price - price * discount;
};

export const isSufficient = function isSufficient(
  grade: number,
  threshold: number
): boolean {
  return grade >= threshold;
};
