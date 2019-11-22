import UIKit
import PlaygroundSupport
var str = "Hello, playground"


/**
Class Messenger Show how to use a  create serial queue and use that
*/

class SerialQueueDemo{
	private var messages:[String] = []
	private var queue = DispatchQueue(label: "messages.queue") // Serial Queue if you add here attribute propeerty then it becomes concurrent or async queue attributes: .concurrent ,
	
	
	var lastMessage: String? {
		return queue.sync {
			messages.last
		}
	}
	
	func postMessage(_ newMessage: String) {
		
		self.queue.sync(flags: .barrier) {
			self.messages.append(newMessage)
		}
	}
	
	func postMessage2(_ newMessage: String) {
		
		print("Hello \(newMessage)");
	}
}

let serialQueueObj = SerialQueueDemo()
// Executed on Thread #1
serialQueueObj.postMessage("Hello SwiftLee!")
// Executed on Thread #2
print(serialQueueObj.lastMessage ?? "")  // Prints: Hello SwiftLee!



/**

Below is the example of Concurrent queue demo
*/
PlaygroundPage.current.needsIndefiniteExecution = true;
class ConcurrentQueueDemo{
	
	

	private var messages:[String] = [];
	var value: Int = 20
	let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent) // Serial Queue if you add here attribute propeerty then it becomes concurrent or async queue attributes: .concurrent ,
	
	
	var lastMessage: String? {
		return concurrentQueue.sync {
			messages.last
		}
	}
	
	func postMessage(_ newMessage: String) {
		
		self.concurrentQueue.sync(flags: .barrier) {
			self.messages.append(newMessage)
		}
	}
	
	func doAsyncTaskInSerialQueue() {
		for i in 1...3 {
			concurrentQueue.async {
				if Thread.isMainThread{
					print("task running in main thread")
				}else{
					print("task running in other thread")
				}
				let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
				let _ = try! Data(contentsOf: imageURL)
				print("\(i) finished downloading")
			}
			//serialQueue.activate()
		}
		concurrentQueue.async {
			for i in 0...3 {
				self.value = i
				print("\(self.value) ✴️")
			}
		}
		
		print("Last line in playground 🎉")
		
	}
	
	
}

let concurrentQueueObj = ConcurrentQueueDemo()
// Executed on Thread #1

concurrentQueueObj.doAsyncTaskInSerialQueue()
concurrentQueueObj.postMessage("Hello Kaushal!");
// Executed on Thread #2
print("last message ==",concurrentQueueObj.lastMessage ?? "")  // Prints: Hello SwiftLee!







//serialQueue.activate();
/*
let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

func doSyncTaskInConcurrentQueueQueue() {
for i in 1...3 {
concurrentQueue.sync {
if Thread.isMainThread{
print("task running in main thread async")
}else{
print("task running in other thread async")
}
let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
let _ = try! Data(contentsOf: imageURL)
print("\(i) finished downloading async")
}
}
}

doSyncTaskInConcurrentQueueQueue()

concurrentQueue.async {
for i in 1...3 {
value = i
print("\(value)async ✴️")
}
}

print("Last line in playground async 🎉")


var value1: Int = 2

let serialQueue2 = DispatchQueue(label: "serialQueue")
let concurrentQueue2 = DispatchQueue(label: "concurrentQueue", attributes: [.initiallyInactive, .concurrent])
concurrentQueue2.setTarget(queue: serialQueue2)
concurrentQueue2.activate()

concurrentQueue2.async {
for j in 0...4 {
value1 = j
print("\(value1) ✡️")
}
}

concurrentQueue2.async {
for j in 5...7 {
value1 = j
print("\(value1) ✴️")
}
}


func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
let group = DispatchGroup()
for i in 1...5 {
concurrentQueue.async {
group.enter()
let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
let _ = try! Data(contentsOf: imageURL)
print("###### Image \(i) Downloaded ######")
group.leave()
}
}

/* Either write below code or group.notify() to execute completion block
group.wait()
DispatchQueue.main.async {
completion()
}
*/

group.notify(queue: DispatchQueue.main) {
completion()
}
}

print("###### Download all images asynchronously and notify on completion ######")
print("############")
print("############\n")

performAsyncTaskIntoConcurrentQueue(with: {
print("\n############")
print("############")
print("###### All images are downloaded")
})

var task: DispatchWorkItem?

task = DispatchWorkItem(block: {
for i in 1...5 {
if Thread.isMainThread {
print("task running in main thread DispatchWorkItem")
} else{
print("task running in other thread DispatchWorkItem")
}

if (task?.isCancelled)! {
break
}

let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
let _ = try! Data(contentsOf: imageURL)
print("\(i) finished downloading DispatchWorkItem")
}
task = nil
})
*/
