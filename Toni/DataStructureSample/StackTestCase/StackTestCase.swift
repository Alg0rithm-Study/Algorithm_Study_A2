//
//  StackTestCase.swift
//  StackTestCase
//
//  Created by Sunwoo on 2022/02/10.
//

import XCTest
@testable import DataStructureSample

class StackTestCase: XCTestCase {
    var stack = Stack<Int>()
    
    override func setUp() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
    }
    
    func test_push() {
        XCTAssertEqual(stack.description, "1 2 3 4")
    }
    
    func test_pop() {
        XCTAssertEqual(stack.pop(), 4)
    }
    
    func test_peek() {
        XCTAssertEqual(stack.peek(), 4)
    }
    
    func test_isEmpty() {
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_initWithArray() {
        let array = [1,2,3,4]
        XCTAssertEqual(stack, Stack(array))
    }
    
    func test_arrayLiteral() {
        let stack: Stack = ["bluberry", "plain", "potato"]
        XCTAssertEqual(stack, ["bluberry", "plain", "potato"])
    }
}
