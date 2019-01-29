import UIKit

class Stack {
    var stackArray = [String]()
    
    func push(stringToPush: String){
        self.stackArray.append(stringToPush)
    }
    
    func pop() -> String? {
        if self.stackArray.last != nil {
            var stringToReturn = self.stackArray.last
            self.stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
}

var myStack = Stack()

myStack.push(stringToPush: "First")  //["First"]
myStack.push(stringToPush: "Second") //["First","Second"]
myStack.push(stringToPush: "Third")  //["First","Second","Third"]
    myStack.pop()  //"Third"

