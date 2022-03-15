
//let array1 = [8, 8, 7, 2, 1, 7, 9]
//let array2 = [14, 8, 2, 7, 7]
//let array1 = ["goat", "fish", "deer", "goat", "bear"]
//let array2 = ["ant", "bear", "goat"]
let array1 = [9, 4, 7, 9, 3]
let array2 = [9, 11, 9, 13, 9]


func solve<S, T: Comparable & Hashable & Equatable >(sequenceOne: S, sequenceTwo: S) -> S where S: Sequence, S.Iterator.Element == T {
    
    var result = [T]()
    
    let dictionary1 = Dictionary(grouping: sequenceOne, by: { $0 })
    let dictionary2 = Dictionary(grouping: sequenceTwo, by: { $0 })
    let newDictionary1 = dictionary1.mapValues { (value: [T]) in
        return value.count
    }
    let newDictionary2 = dictionary2.mapValues { (value: [T]) in
        return value.count
    }
    
    for element in sequenceTwo {
        if (newDictionary1[element] != newDictionary2[element] || !sequenceOne.contains(element)) && !result.contains(element) {
            result.append(element)
        }
    }
    return result.sorted(by: <) as! S
}

let result = solve(sequenceOne: array1, sequenceTwo: array2)

print(result)

