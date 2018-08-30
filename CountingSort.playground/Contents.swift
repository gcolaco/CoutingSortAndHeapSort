import UIKit

func countingSort(_ array: [Int])-> [Int] {
    //check if array is empty
    guard array.count > 0 else {return []}
    //let greaterElement = array.max() ?? 0
    let greaterElement: Int = 14
    
    /*
     Make an array to store the numbers of the main array
     starts everything with 0, them the for loop starts, catch all the elements from the main array
     and increase the value of the numberArray
    */
    var numbersArray = [Int](repeating: 0, count: Int(greaterElement + 1))
    for element in array {
        numbersArray[element] += 1
    }
    
    // Sum the value from the actual index to the next one
    for i in 1 ..< numbersArray.count {
        let sum = numbersArray[i] + numbersArray[i - 1]
        numbersArray[i] = sum
    }
       
    /*
     Creat a new array(sortedArray), put the elements from the main array into the sortedArray index defined
     by the values from numbersArray
     */
    var sortedArray = [Int](repeating: 0, count: array.count)
    for element in array {
        numbersArray[element] -= 1
        sortedArray[numbersArray[element]] = element
    }
    return sortedArray
}

var arr: [Int] = [4,5,7,9,1,3,2,6,12,14,0,11]
print(arr)
print(countingSort(arr))

