import UIKit

var str = "Hello, playground"
class Vehicle {
    var car = "Lexus"
    static var suv = "Jeep"
}

// changing nonstatic variable
Vehicle().car // Lexus
Vehicle().car = "Mercedes"
Vehicle().car // Lexus

// changing static variable
Vehicle.suv // Jeep
Vehicle.suv = "Hummer"
Vehicle.suv // Hummer


let array = [0,1,0,1,0,1,0,1,1];
var arraySorted:[Int] = [Int]();
var countOfZero  = 0;
var countOfOne  = 0;
for element in array {
	if(element == 0){
		countOfZero = countOfZero + 1;
	}else{
		countOfOne = countOfOne + 1;
	}
}
print(countOfOne);
print(countOfZero);

for index in 0..<countOfOne{
	arraySorted.append(1);
}
for index in 0..<countOfZero{
	arraySorted.append(0);
}
print(arraySorted);

let name = readLine()


/** FIND The Smallest and largest element in an array */

let arrayOfNumbers = [10,1,20,40,2,60];

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
print(minMax(array: arrayOfNumbers));



// Below methods are example of how you can avoid optional binding and chaining through map instead of guard, if let, switch cases
let someNumber: Int? = 2
let noneNumber: Int? = nil
// closure will be evaluated and result1 is Optional(4)
let result1 = someNumber.map { $0 * $0 } ?? 0 // if you use map function without nil-coalescing operator it will return optional value and with nil-coalescing operator it will return 4. Similar for below cases
print(result1);
// closure won't be evaluated and result2 is Optional(nil)
let result2 = noneNumber.map { $0 * $0 } ?? 0
print(result2)

func log(_ message: String) {
  print(message)
}
let someMessage: String? = "Hello World"
let noneMessage: String? = nil
// closure will be evaluated
someMessage.map { log($0) }
// closure won't be evaluated
noneMessage.map { log($0) }
let someString: String? = "2" // Here 2 is of string type and I choose someString as an optional type String. So when we typecast that someString to Int it will return optional(optional(2)) represent as Int??
let result3 = someString.map { Int($0) } // it will return Int??  while using map like this for optional chainig
print(result3);

// Again to avoid optional chaining on above statement use nil-coalescing operator with flapMap
let result4 = someString.flatMap { Int($0) }  // it will return optional Int?  while using flatMap instead of map like this for optional chaining
print(result4);

//To get positive value from someString use nil-coalescing operator like this

let result5 = someString.flatMap { Int($0) } ?? 0  // it will return optional Int?  while using flatMap instead of map like this for optional chaining
print(result5);
