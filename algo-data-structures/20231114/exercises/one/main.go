package main

import "fmt"

func main() {
	n, err := ReadInput("Insert a number from 1 to 10")

	if err != nil {
		fmt.Println(err)
	}

	format, err := CalculateFormat(n)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Printf("Format %d: base %.2f mm, height %.2f mm\n", n, format.base, format.height)
}
