import XCTest
@testable import DataStructureSample

func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    var count = 0
    
    for element in string {
        if element == "(" {
            count += 1
            stack.push(element)
        } else if element == ")" {
            count -= 1
            stack.push(element)
        }
    }
    
    if count == 0 {
        return true
    } else {
        return false
    }
    /*
    해설코드
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
        return stack.isEmpty
 */
    }

final class StackChallengeTestCase: XCTestCase {
  func test_checkParens() {
    XCTAssertTrue( checkParentheses("()") )
  }
  
  func test_checkParens1() {
    XCTAssertTrue( checkParentheses("hello(world)()") )
  }
  
  func test_checkParens2() {
    XCTAssertFalse( checkParentheses("(hello world") )
  }
  
  func test_checkParens3() {
    XCTAssertFalse( checkParentheses("((())(meow)))()))") )
  }
  
}
