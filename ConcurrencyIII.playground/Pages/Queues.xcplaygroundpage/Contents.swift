//: [Previous](@previous)

import Foundation



//let queue = DispatchQueue.global()
//
//
//print("IM here on the main queue")
//
//
//queue.async {
//    usleep(100)
//    print("1.) Looking at me doing things on the background queue")
//}
//
//queue.async {
//    usleep(100)
//    print("2.) Look at me doing more stuff on the bakcground queue")
//}
//
//
//print("Ive asked for things to happen on the background queue")


///// EXAMPLE #2//////////////
//let serialQueue = DispatchQueue(label: "MySerialQueue")//By default this will be a serial queue if no attributes added
//print("Start serial queue")
//
//serialQueue.async {
//    print("Do this 1st")
//}
//
//serialQueue.async {   //Perform these whenever
//    print("Do this 2nd")
//}
//
//print("Waiting for sync")
//serialQueue.sync {
//    print("3. do this third, waiting until first two done") //Do not perform until above is done
//}
//
//print("finished sync")
//
//print("4. Done!")


let concurrentQueue = DispatchQueue.global() //Because its Concurrent, both of these will happen at the same time, they could finish at different times each run

concurrentQueue.async {
    print("Do this at the same time")
}

concurrentQueue.async {
    print("Do this")
}

//: [Next](@next)
