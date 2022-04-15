import XCTest

protocol BoardGameManager {
  associatedtype Player
  mutating func nextPlayer() -> Player?
}

extension QueueStack: BoardGameManager{
    typealias Player = T
    
    mutating func nextPlayer() -> Player? {
        return dequeue()
    }
}
// 제공코드
//extension QueueStack: BoardGameManager {
//  typealias Player = T
//
//  mutating func nextPlayer() -> Player? {
//    guard let player = dequeue() else {
//      return nil
//    }
//    enqueue(player)
//    return player
//  }
//}

//TODO: Extend one (or both!) queue implementation(s) to adopt the BoardGameManager protocol

final class ChallengeTestCase: XCTestCase {
  func test_playerOrder() {
    var queue = QueueStack<String>()
    queue.enqueue("Kirby")
    queue.enqueue("Samus")
    queue.enqueue("Pikachu")
    queue.enqueue("Toon Ozma")
    
    XCTAssertEqual(queue.peek, "Kirby")
    queue.nextPlayer()
    queue.nextPlayer()
    XCTAssertEqual(queue.peek, "Pikachu")
    queue.nextPlayer()
    XCTAssertEqual(queue.peek, "Toon Ozma")
  }
}
