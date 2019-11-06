//: [Previous](@previous)

import Foundation

//DispatchSemaphore - controlling access to a resource



func download(url: URL) -> Data? {
    var data: Data?
    
    let semaphore = DispatchSemaphore(value: 0)
    URLSession.shared.dataTask(with: url) { (d, _, _) in
        data = d
        semaphore.signal()
    }.resume()
    
    semaphore.wait()
    
    return data
}



print("About to download person")

let url = URL(string: "https://swapi.co/api/people/1/")!

if let myData = download(url: url) {
    print("Downloaded: \(myData)")
    
} else {
    print("Error no data")
}

print("Finished Downloading")



let semaphore = DispatchSemaphore(value: 5)
print("waiting 1")
semaphore.wait()
print("waiting 2")
semaphore.wait()
print("waiting 3")
semaphore.wait()
print("waiting 4")
semaphore.wait()
print("waiting 5")
semaphore.wait()

print("Finished")

//: [Next](@next)
