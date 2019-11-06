//: [Previous](@previous)

import Foundation




let urls = [
    URL(string: "https://swapi.co/api/people/1/")!,
    URL(string: "https://swapi.co/api/people/2/")!,
    URL(string: "https://swapi.co/api/people/3/")!,
    URL(string: "https://swapi.co/api/people/4/")!,

    ]

var peopleGroup = DispatchGroup()
var networkingGroup = DispatchGroup()

for personURL in urls {
    peopleGroup.enter()
    networkingGroup.enter()
    
    let task = URLSession.shared.dataTask(with: personURL) { (data, _, _) in
        print("We got some data for \(personURL)")
        
        networkingGroup.leave()
        peopleGroup.leave()
    }
    
    task.resume()
    
    
}

peopleGroup.notify(queue: .main) {
    print("All done")
}

networkingGroup.notify(queue: .main) {
    print("No, now im done. Networking Group")
}

//: [Next](@next)
