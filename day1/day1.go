package main

import (
	"bufio"
	"log"
	"math"
	"os"
	"strconv"
)

func main() {
	path := "input.txt"
	input := getInput(path)

	fRequired := 0
	fRequiredComplex := 0
	for _, m := range input {
		fRequired += getModuleFuel(m, false)
		fRequiredComplex += getModuleFuel(m, true)
	}

	log.Println("Additional fuel required:", fRequired)
	log.Println("Additional fuel required (complex):", fRequiredComplex)
}

func getInput(p string) []int {
	f, err := os.Open(p)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()

	var input []int

	scanner := bufio.NewScanner(f)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {
		if err := scanner.Err(); err != nil {
			log.Fatal(err)
		}

		l := scanner.Text()
		m, err := strconv.Atoi(l)
		if err != nil {
			log.Fatal(err)
		}

		input = append(input, m)
	}

	return input
}

func getModuleFuel(m int, c bool) int {
	f := int(math.Floor(float64(m)/3.0) - 2.0)

	if !c {
		return f
	}

	if f < 0 {
		return 0
	}

	return f + getModuleFuel(f, true)
}
