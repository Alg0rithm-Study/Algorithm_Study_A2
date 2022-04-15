//
//  [Toni] Find if Path Exists in Graph.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/04/13.
//

import Foundation

class Solution31 {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        
    }
}

struct Vertex<Element>: Equatable where Element: Equatable, Element: Hashable {
    var data: Element
    let index: Int
}

struct Edge<Element>: Equatable where Element: Equatable, Element: Hashable {
    let from: Vertex<Element>
    let to: Vertex<Element>
    
    let weight: Double?
}

class EdgeList<Element> where Element: Equatable, Element: Hashable {
    var vertex: Vertex<Element>
    var edges: [Edge<Element>]? = nil
    
    init(vertex: Vertex<Element>) {
        self.vertex = vertex
    }
    
    func addEdge(_ edge: Edge<Element>) {
        edges?.append(edge)
    }
    
    func createVertex(_ data: Element) -> Vertex<Element> {
        let matchingVertices = 
    }
}
