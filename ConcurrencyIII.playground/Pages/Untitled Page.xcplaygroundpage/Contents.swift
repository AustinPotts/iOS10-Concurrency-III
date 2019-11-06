import Foundation

//Atomic

class Atomic<Value> {
    
    private var value: Value
    private let queue = DispatchQueue(label: "Atomic \(Value.self)") //Because we are adding this serial queue, everything has to happen one at a time
    
    init(value: Value){
        self.value = value
    }
    
    func modify(modifier: (Value)-> Value){ //Using closure to set new value
        queue.sync {
            value = modifier(value)
        }
        
    }
    
    func get()->Value{
       // return value
        return queue.sync { value }
    }
    
    
}

let sharedValue = Atomic(value: 40)

DispatchQueue.concurrentPerform(iterations: 100) { (_) in
    sharedValue.modify{ $0 + 1 } //This is the modification we are making
}

print("Final value: \(sharedValue.get())") //Multiple threads will be trying to access this at the same time causeing a wrong value count
