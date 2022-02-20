package main

import (
    "fmt"
    "os"
    "io/ioutil"
	"log"
	"strings"
)

/*
CLI tool for renaming all files in ordered numbers.
eg: /path has files abcd.jpg, efgh.png
$ go run num_pictures.go /path

/path now has 1.jpg, 2.png
*/

func main() {

	if len(os.Args[1:]) != 1 {
		fmt.Println("\nUsage: ./num_pictuGres /path/to/directory\n")
		os.Exit(1)
	}
	
    files, err := ioutil.ReadDir(os.Args[1])
    if err != nil {
		log.Fatal(err)
		os.Exit(1)
    }
	os.Chdir(os.Args[1])


    for _, f := range files {
		img_type := strings.SplitN(f.Name(), ".", -1)[1]

		r, _ := os.Open("/dev/urandom")
		b := make([]byte, 5)
		r.Read(b)
		r.Close()
		uuid := fmt.Sprintf("%x", b[0:4])
		
		new_name := fmt.Sprintf("%s.%s", uuid, img_type)
		os.Rename(f.Name(), new_name)
    }

    files, err = ioutil.ReadDir(os.Args[1])
    if err != nil {
		log.Fatal(err)
		os.Exit(1)
    }

	counter := 1
	for _, f := range files{		
		img_type := strings.SplitN(f.Name(), ".", -1)[1]
		new_name := fmt.Sprintf("%d.%s", counter, img_type)
		fmt.Printf("renaming %s --> %s\n", f.Name(), new_name)
		os.Rename(f.Name(), new_name)
		counter++
	}

}
