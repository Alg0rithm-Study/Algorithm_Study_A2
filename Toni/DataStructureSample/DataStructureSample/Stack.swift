//
//  Stack.swift
//  DataStructureSample
//
//  Created by Sunwoo on 2022/02/10.
//

struct Stack<Element:Equatable>: Equatable {
    private var storage: [Element] = []
    
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init() { }
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage.map({ element in
            "\(element)"
        }).joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
