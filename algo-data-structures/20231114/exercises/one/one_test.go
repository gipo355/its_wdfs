// FILEPATH: /home/wolf/Programming/courses/its_wdfs/algo-data-structures/20231114/exercises/one/one_test.go
package main

import (
	"os"
	"testing"
)

func TestReadInput(t *testing.T) {
	testInput := "5\n"
	r, w, err := os.Pipe()
	if err != nil {
		t.Fatal(err)
	}

	_, err = w.Write([]byte(testInput))
	if err != nil {
		t.Fatal(err)
	}
	err = w.Close()
	if err != nil {
		t.Fatal(err)
	}

	oldStdin := os.Stdin
	defer func() { os.Stdin = oldStdin }()
	os.Stdin = r

	n, err := ReadInput("Enter a number")
	if err != nil {
		t.Errorf("Expected no error, got %v", err)
	}

	if n != 5 {
		t.Errorf("Expected 5, got %d", n)
	}
}

func TestCalculateFormat(t *testing.T) {
	tests := []struct {
		name string
		n    int
		want Format
	}{
		{"A0", 0, Format{1189.0, 841.0}},
		{"A1", 1, Format{841.0, 1189.0 / 2}},
		{"A2", 2, Format{1189.0 / 2, 841.0 / 2}},
		// Add more test cases as needed
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := CalculateFormat(tt.n)
			if err != nil {
				t.Errorf("Expected no error, got %v", err)
			}

			if got != tt.want {
				t.Errorf("Expected %v, got %v", tt.want, got)
			}
		})
	}
}
