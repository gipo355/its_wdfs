/**
* ## ex 3
*
_L’antico (ma sempre attuale) esercizio delle cifre_

1. Scrivete un programma che usi una funzione per calcolare la somma delle cifre
   di un numero dato in ingresso.

   Poi scrivere una funzione che:

   1. Restituisca se quel numero è divisibile per 3;
   2. Contemporaneamente, assegni il valore ai parametri quoziente e resto.
*
*/

export const sumNumbers = function sumNumbers(...numbers: number[]): number {
  return numbers.reduce((accumulator, current) => accumulator + current, 0);
};

interface DivisionResult {
  isDivisible: boolean;
  quotient: number;
  remainder: number;
}
export const isDivisibleBy3 = function isDivisibleBy({
  numberToDivide,
  divisor,
}: {
  numberToDivide: number;
  divisor: number;
}): DivisionResult {
  const remainder = numberToDivide % divisor;

  return {
    isDivisible: remainder === 0,
    quotient: numberToDivide / divisor,
    remainder,
  };
};
