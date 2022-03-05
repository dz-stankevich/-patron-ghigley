import Foundation

// MARK: - Properties
let firstArray1 = [8, 8, 7, 2, 1, 7, 9]
let firstArray2 = [14, 8, 2, 7, 7]

let secondIntArray1 = [9, 4, 7, 9, 3]
let secondIntArray2 = [9, 11, 9, 13, 9]

let stringArray1 = ["goat", "fish", "deer", "goat", "bear"]
let stringArray2 = ["ant", "bear", "goat"]

// MARK: - Extensions
extension Array where Element: Comparable & Hashable {
    func valueCount<T: Equatable & Hashable & Comparable>(with object: T) -> Int {
        self.filter {
            guard let item = $0 as? T else { return false }
            return item == object
        }.count
    }
}

// MARK: - Functions
func solve<T: Equatable & Hashable & Comparable>(_ array1: [T], _ array2: [T]) -> [T] {
    var result: Set<T> = []
    array2.forEach {
        if array1.valueCount(with: $0) != array2.valueCount(with: $0) {
            result.insert($0)
        }
    }
    
    return Array(result.sorted())
}

// MARK: - Results
solve(firstArray1, firstArray2)
solve(secondIntArray1, secondIntArray2)
solve(stringArray1, stringArray2)
