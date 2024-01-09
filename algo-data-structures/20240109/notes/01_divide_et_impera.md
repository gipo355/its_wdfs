# divide et impera

divide ricorsivamente in due o piu sotto problemi dello steso tipo, indipendenti

non ho bisogno di una parte per la seconda

## vantaggi

risoluzione problemi difficili

efficienza

parallelismo

accesso a memoria

controllo arrotondamento

## svantaggi

ricorsione

stack esplicito

dimensione dello stack

scelta dei casi base

condivisione sottoproblemi

## merge sort

big work on merge

O(n log n)

## quicksort

big work on divide

costo di pivot O(n) caso ottimo

costo di quicksort O(n^2) caso pessimo

```javascript
function quicksort(array) {
  if (array.length <= 1) {
    return array;
  }

  var pivot = array[0];

  var left = [];
  var right = [];

  for (var i = 1; i < array.length; i++) {
    array[i] < pivot ? left.push(array[i]) : right.push(array[i]);
  }

  return quicksort(left).concat(pivot, quicksort(right));
}

var unsorted = [23, 45, 16, 37, 3, 99, 22];
var sorted = quicksort(unsorted);

console.log('Sorted array', sorted);
```

MIGLIORAMENTO DEL PIVOT: prendi primo ultimo e uno a caso, prendi il random come
pivot

# tutti gli algo finora sono a confronto

sono sempre i meno efficienti

mai sotto n log n
