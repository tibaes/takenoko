//
//  File.swift
//  
//
//  Created by Rafael Henrique Tibaes on 3/13/21.
//

protocol Framable {
    var count: Int { get } // amount of rows
    var columns: [AnyHashable] { get }
    
    init()
    init(columns: [AnyHashable])
    init(from data: Self)
    
    subscript(column: AnyHashable) -> Self { get set }
    subscript(column: AnyHashable, row: Int) -> Self { get set }
    subscript(column: AnyHashable, rows: ClosedRange<Int>) -> Self { get set }
    subscript(column: AnyHashable, rows: [Bool]) -> Self { get set }
    
    // to be defined: columns as arrays or some generic collection type?
    subscript(columns: [AnyHashable]) -> Self { get set }
    subscript(columns: [AnyHashable], row: Int) -> Self { get set }
    subscript(columns: [AnyHashable], rows: ClosedRange<Int>) -> Self { get set }
    subscript(columns: [AnyHashable], rows: [Bool]) -> Self { get set }
    
//    func values() -> Array<Any> (to be defined properly...)
    
//    func append(_ data: Self) // Always add lines (to be defined properly...)
//    func concat(_ data: Self) // Always add columns (to be defined properly...)
}

// Let's add some common DataFrame behaviors
extension Framable {
    
    // Sampling
    
    func head(amount: Int = 10) -> Self {
        precondition(amount > 0)
        if count == 0 { return Self.init(columns: columns) }
        let A = min(amount, count) - 1
        return self[columns, 0...A]
    }
    
    func tail(amount: Int = 10) -> Self {
        precondition(amount > 0)
        if count == 0 { return Self.init(columns: columns) }
        let A0 = max(count - amount, 0)
        let A1 = count - 1
        return self[columns, A0...A1]
    }
    
    func sample(amount: Int = 1) -> Self {
        precondition(amount > 0)
        // TODO
        return Self.init()
    }
    
    func split(amounts: [Int],
               shufle: Bool = false,
               stratify: AnyHashable? = nil
    ) -> [Self] {
//        precondition(amounts.count > 0) return empty framable
        if amounts.count == 1 {
//            amount
        }
//        precondition(amounts.reduce(into: 0, +) == self.countRows)
        return [] // TODO
    }
    
    func split(proportions: [Float] = [0.5, 0.5],
               shufle: Bool = false,
               stratify: AnyHashable? = nil
    ) -> [Self] {
//        precondition(proportions.count > 0) return empty framable
        precondition(abs(1.0 - proportions.reduce(0, +)) < 0.0001)
        // ...
        return [] // TODO call above
    }
    
    
}



//0
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11

