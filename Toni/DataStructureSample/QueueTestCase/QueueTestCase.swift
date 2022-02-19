//
//  QueueTestCase.swift
//  QueueTestCase
//
//  Created by Sunwoo on 2022/02/16.
//

import XCTest

class QueueTestCase: XCTestCase {
    var queueArray = QueueArray<String>()
    var queueStack = QueueStack<String>()
    
    override func setUp() {
        queueArray.enqueue("Chelsea")
        queueArray.enqueue("ManUtd")
        queueArray.enqueue("Real")
        
        queueStack.enqueue("1")
        queueStack.enqueue("2")
        queueStack.enqueue("3")
    }
    
    func test_enqueueArray() {
        XCTAssertEqual(queueArray.peek, "Chelsea")
    }
    
    func test_enqueueStack() {
        XCTAssertEqual(queueStack.peek, "1")
    }
    
    func test_dequeueArray() {
        queueArray.dequeue()
        queueArray.dequeue()
        XCTAssertEqual(queueArray.peek, "Real")
        queueArray.dequeue()
        XCTAssertTrue(queueArray.isEmpty)
    }
    
    func test_dequeueStack() {
        queueStack.dequeue()
        queueStack.dequeue()
        XCTAssertEqual(queueStack.peek, "3")
        queueStack.dequeue()
        XCTAssertTrue(queueStack.isEmpty)
    }
}
