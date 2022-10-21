#! /usr/bin/awk
BEGIN { print "Printing the cars from Europe that weighs over 2500." 
        FS=";"      
}

# action for every line of input file checks if it is from Europe 
# and over 2500
  NR > 2   { 
	if ($9 == "Europe" && $6 >= 2500)
                {
                  print $1
                }
        }
# print a string at the end of reading input file
END   { print "Finished." }

