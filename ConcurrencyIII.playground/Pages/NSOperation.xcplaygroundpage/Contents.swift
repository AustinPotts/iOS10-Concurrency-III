//: [Previous](@previous)

import Foundation




let queue = OperationQueue() //By default will try to run all operations at the same time
queue.name = "OperationQueue"
queue.maxConcurrentOperationCount = 1//Converts the Queue to Serial Queue with 1 (will be slower since has to wait)


let downloadJSON = BlockOperation{
    sleep(1)
    print("1. Download JSON")
}

let processJSON = BlockOperation{
    sleep(1)
    print("2. Process JSON")
}

let downloadImageFromJSON = BlockOperation {
    sleep(1)
    print("3. This requires download JSON and Process JSON")
}


let getWeather = BlockOperation {
    print("4. weather")
}


class MyHeartRateOperation: Operation {
    private var deviceName: String
    init(deviceName: String){
        self.deviceName = deviceName
    }
    
    override func main() {
        sleep(1)
        print("5. get heartrate from bluetooth \(deviceName)")
    }
    
}

let heartRate = MyHeartRateOperation(deviceName: "Polar H10")

processJSON.addDependency(downloadJSON) //these will always happen in order due to the dependency
downloadImageFromJSON.addDependency(processJSON)

print("Start Operations")

queue.addOperations([downloadJSON, processJSON, downloadImageFromJSON, getWeather, heartRate], waitUntilFinished: false)


print("Finished Code")

//: [Next](@next)
