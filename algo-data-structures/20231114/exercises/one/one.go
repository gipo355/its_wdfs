package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

/*
* 1. Si realizzi un programma console che calcoli le dimensioni di un foglio in
* formato AN, con N fornito in ingresso.
*
* SUGGERIMENTO: Un foglio di carta in formato A0 ha dimensioni 1189 x 841
* mm. Un foglio in formato A1 ha il lato lungo uguale al lato corto del formato
* A0 (841 mm) ed il lato corto uguale alla metà del lato lungo (1189 / 2 mm).
*
* 2. Scrivere un programma che legga una sequenza di numeri terminata da 0 e
* verifichi se sono tutti pari.
 */

// Exercise 1
// A0 = lungo 1189 x corto 841 mm
// A1 = lungo = corto A0, corto = lungo A0 / 2

func ReadInput(message string) (int, error) {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println(message)
	text, _ := reader.ReadString('\n')
	text = strings.TrimSuffix(text, "\n")

	// fmt.Printf("type %s\n", reflect.TypeOf(text))

	n, err := strconv.Atoi(text)

	if err != nil {
		return 0, err
	}

	if (n < 0) || (n > 10) {
		return 0, fmt.Errorf("n must be between 0 and 10")
	}

	return n, nil
}

type Format struct {
	base   float64
	height float64
}

func CalculateFormat(n int) (f Format, err error) {
	base := 1189.0
	height := 841.0

	f = Format{base, height}

	if n == 0 {
		return f, nil
	}

	for i := 0; i < n; i++ {
		// base, height = height, base/2

		f.base, f.height = f.height, f.base/2
	}

	return f, nil
}

// Exercise 2
// 2. Scrivere un programma che legga una sequenza di numeri terminata da 0 e
// verifichi se sono tutti pari.
