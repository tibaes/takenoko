//
//  File.swift
//  
//
//  Created by Rafael Henrique Tibaes on 3/13/21.
//

protocol Framable {
    associatedtype DataType: RandomAccessCollection
    
    var rows: Int { get }
    var columns: Int { get }
    var data: DataType { get }
    var columnsNames: Dictionary<AnyHashable, Int> { get }
    
    subscript(column: AnyHashable) -> AnyRandomAccessCollection<Any> { get set }
    subscript(columns: [AnyHashable]) -> [AnyRandomAccessCollection<Any>] { get set }
    
    subscript(column: AnyHashable, row: Int) -> Any { get set }
    subscript(column: AnyHashable, rows: ClosedRange<Int>) -> AnyRandomAccessCollection<Any> { get set }
    subscript(column: AnyHashable, rows: [Bool]) -> AnyRandomAccessCollection<Any> { get set }
    
    subscript(column: [AnyHashable], row: Int) -> Any { get set }
    subscript(column: [AnyHashable], rows: ClosedRange<Int>) -> AnyRandomAccessCollection<Any> { get set }
    subscript(column: [AnyHashable], rows: [Bool]) -> AnyRandomAccessCollection<Any> { get set }
 
    // precondition()
}


// Indexing / Slicing
extension Framable {
    var count: Int { return rows * columns }
    var size: (Int, Int) { return (columns, rows)}
    
    // Sanity check
    
    private func isValid(row: Int) -> Bool {
        row >= 0 && row < rows
    }
    
    private func isValid(column: Int) -> Bool {
        column >= 0 && column < columns
    }
    
    private func isValid(named: AnyHashable) -> Bool {
        columnsNames.keys.contains(named)
    }
    
    private func isValid(rows: ClosedRange<Int>) -> Bool {
        isValid(row: rows.lowerBound) && isValid(row: rows.upperBound)
    }
    
    private func isValid(columns: ClosedRange<Int>) -> Bool {
        isValid(column: columns.lowerBound) && isValid(column: columns.upperBound)
    }
    
    private func isValid(named: [AnyHashable]) -> Bool {
        named.allSatisfy{ isValid(named: $0) }
    }
}


extension Framable where DataType == AnyRandomAccessCollection<AnyRandomAccessCollection<Any>> {

}
