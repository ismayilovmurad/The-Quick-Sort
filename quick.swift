var array = [2, 8, 10, 5, 4, 1, 9, 7, 3, 6]

func quick(array: inout [Int], first: Int, last: Int){

    if first < last{
        // calculate the split point
        let pivotIndex = partition(array: &array, first: first, last: last)

        // sort the two partitions
        quick(array: &array, first: first, last: pivotIndex - 1)
        quick(array: &array, first: pivotIndex + 1, last: last)
    }

}

func partition(array: inout [Int], first: Int, last: Int) -> Int{
    // choose the first item as a pivot value
    let pivotValue = array[first]

    // establish the greater and lower indexes
    var lower = first + 1
    var greater = last

    // start searching for the crossing point
    var done = false
    while done == false{
        // advance the lower index
        while lower <= greater && array[lower] <= pivotValue{
            lower += 1
        }

        // advance the greater index
        while array[greater] >= pivotValue && greater >= lower{
            greater -= 1
        }

        // if the two indexes cross, we have found the split point
        if greater < lower{
            done = true
        }else{
            // exchange the two values
            let temporary = array[lower]
            array[lower] = array[greater]
            array[greater] = temporary
        }

    }
            

    // when the split point is found, exchange the pivot value
    let temporary = array[first]
    array[first] = array[greater]
    array[greater] = temporary

    // return the split point index
    return greater

}

print("Before: \(array)")
quick(array: &array, first: 0, last: array.count - 1)
print("After: \(array)")