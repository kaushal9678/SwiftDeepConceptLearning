import UIKit

var str = "Hello, playground"
class RemoveDuplicates{
	
	func removeDuplicates(_ nums: inout [Int]) -> ([Int], Int) {
		nums = nums.sorted();
		//print(nums);
		if nums.count == 0 || nums.count == 1 {
			return (nums,nums.count)
		}
		var stPoint: Int = 0
		var curPoint: Int = 1
		
		while curPoint < nums.count {
		
			if nums[curPoint] != nums[stPoint] {
				stPoint = stPoint + 1
			//	print(nums);
				nums.swapAt(stPoint, curPoint)
				//print("nums after swap===",nums);
			}
			curPoint = curPoint + 1
		}
		return (nums,stPoint + 1)
	}
}
let removeDup = RemoveDuplicates()


var num = [1,4,8,3,1,2,3,4,4,5,6,6,7];
let output = removeDup.removeDuplicates(&num)
print(output.0,output.1);




/**
Array functions  demo
*/


let numbers = [10, 20, 30, 40, 50]
let index = numbers.index(after: 3);
//	print(numbers[index ..< numbers.endIndex])
print(index);
     if let i = numbers.firstIndex(of: 30) {
		//print(i);
		print(numbers[i ..< numbers.endIndex])
}
print("distance ===", numbers.distance(from: numbers.startIndex, to: numbers.endIndex));

print(numbers.index(numbers.startIndex, offsetBy: 3));
if let i = numbers.index(numbers.startIndex,
                                offsetBy: 3,
                                limitedBy: numbers.endIndex) {
		print(i);
           print(numbers[i])
      }


let cast = ["Vivien", "Marlon", "Kim", "Karl"]
     let list = cast.joined(separator: ", ")
    print(list)
let line = "BLANCHE:   I don't want realism. I want magic!"
print(line.split(separator: " "))
print(line.split(separator: " ", maxSplits: 3, omittingEmptySubsequences: true))


let a = 1...3
let b = 1...10;
///
print(b.elementsEqual(a));
print(a.elementsEqual([1, 2, 3]));


