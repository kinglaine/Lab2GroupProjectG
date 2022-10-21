
#########################################################
# Function  : Function tools libary in filter data      #
# Author    : Yuzhuang Chen (Yuz chen)                  #
# date      : 10/20/2022                                #
# version   : 1.0                                       #
#                                                       #
# This file is allowed to be modified,                  #
# adding your name in 'Author' after you modified.      #
#########################################################

# Note : I am very bad at grammar !!!!!!

# Filter the input data by the given column and value of that column
# this function only exectues with value is not a string, otherwise call filter_string
# if input data is valid, then add it into back of the array
# param col - Filtered based on that column
# param value - Filtered based on what non string value of the column
# param data - array to hold data
# param counter - the lenght of the data array
# return the new lenght of the data array
function filter_(col, value, datas, line) {
    if ($col == value) {
        datas[line] = $0
        line++;
    }
    return line
}

# Filter the input data by the given column and string value of that column
# this function only exectues with a string value, otherwise call filter_ with same arguments
# if input data is valid, then add it into back of the array
# param col - Filtered based on that column
# param value - Filtered based on what string value of the column
# param data - the array to hold data
# param counter - the lenght of the data array
# return the new lenght of the data array
function filter_string(col, value, datas, counter) {
    if ($col ~ value) {
        datas[counter] = $0
        line++;
    }
    return line
}

# Filter out any data that column is not equal to value
# this function only exectues with value is not a string, 
# otherwise call filter_array_string with same arguments
# param array - the original data array
# param col - Filtered based on that column
# param value - Filtered based on what non string value of the column
# param new_array - new array to hold filtered data
# return the new lenght of the new array
function filter_array_(array, col, value, end, new_array) {
    for (i = 0 ; i < end; i++) {
        split(array[i], data, ";");
        if (data[col] != value) {
            delete array[i]
        }
    }

    new_line = array_copy_(array, end, new_array)
    return new_line
}

# Filter out any data that column is not equal to value
# this function only exectues with value is a string, 
# otherwise call filter_array_ with same arguments
# param array - the original data array
# param col - Filtered based on that column
# param value - Filtered based on what string value of the column
# param new_array - new array to hold filtered data
# return the new lenght of the new array
function filter_array_string(array, col, value, end, new_array) {
    for (i = 0 ; i < end; i++) {
        split(array[i], data, ";");
        if (data[col] !~ value) {
            delete array[i]
        }
    }

    new_line = array_copy_(array, end, new_array)
    return new_line
}

# Filter out any data that column is equal to value
# this function only exectues with value is not string, 
# otherwise call filter_out_array_string with same arguments
# param array - the original data array
# param col - Filtered based on that column
# param value - Filtered based on what non string value of the column
# param new_array - new array to hold filtered data
# return the new lenght of the new array
function filter_out_array_(array, col, value, end, new_array) {
    for (i = 0 ; i < end; i++) {
        split(array[i], data, ";");
        if (data[col] == value) {
            delete array[i]
        }
    }
    new_line = array_copy_(array, end, new_array)
    return new_line
}

# Filter out any data that column is equal value
# this function only exectues with value is a string, 
# otherwise call filter_out_array_ with same arguments
# param array - the original data array
# param col - Filtered based on that column
# param value - Filtered based on what string value of the column
# param new_array - new array to hold filtered data
# return the new lenght of the new array
function filter_out_array_string(array, col, value, end, new_array) {
    for (i = 0 ; i < end; i++) {
        split(array[i], data, ";");
        if (data[col] ~ value) {
            delete array[i]
        }
    }
    new_line = array_copy_(array, end, new_array)
    return new_line
}

# Copy into a new array
# need a variable that provides by the invokers used to stored the new array
# This functioin will ignore the empty/null element of the original array
# and return the new lenght of the new array
# param array - original array
# param end - original array's length
# param array_new - result array
# return the lenght of the new array
function array_copy_(array, end, array_new) {
    line_new = 0

    for (i = 0 ; i < end; i++) {
        if (length(array[i]) != 0) {
            array_new[line_new] = array[i]
            line_new++;
        }
    }

    return line_new
}

# Sort the array depending on the value of col
# this functioin is implemented by select sort, time complexity O(n)
# param array - array that want to sort
# param end - array's length
# param col - sorting depends on which column 
function select_sort(array, end, col) {
    for (i = 0 ; i < end; i++) {
        min = i;
        split(datas[i], data1, ";");
        
        for (j = i + 1; j < end; j++) {
            split(datas[j], data2, ";");
            
            if (data2[col] < data1[col]) {
                min = j;
            }
        }

        if (min != i) {
            temp = array[min];
            array[min] = array[i];
            array[i] = temp;
        }
    }
}