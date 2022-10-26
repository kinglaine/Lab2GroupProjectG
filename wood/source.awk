# FNR refers to the number of record
# NR refers to the total record number
# NF refers to the number of field in a row
BEGIN {
        FS = ";"
        print "Program starts...... \n"
        #get all the cars from the us
        /US/
}
{       #skip the first two lines
        if(NR > 2){
                if($5 >= 200.0)
                        #print car name
                        print $1 ", this car has " $5 " horsepower"
        }
}
END {print "\nProgram ends....."}