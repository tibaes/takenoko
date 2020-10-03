import TensorFlow
import Accelerate


public struct Frame {
    private(set) var data: Array<Series> = []
    private(set) var rows: Int = 0
    private(set) var columns: Int = 0
    private(set) var columns_names: Dictionary<String, Int> = [:]
    
    public var size: Int { columns * rows }
    
    // MARK - Initialization
    
    public init(copy: Frame) {
        self.data = copy.data
        self.rows = copy.rows
        self.columns = copy.columns
        self.columns_names = copy.columns_names
    }
    
    // matrix: [[T]]
    // array: Tensor / [Tensor]
    // dict
    // zeros, ones, repeated, random
    
    // MARK - Indexing / Slicing
    
    private func isValid(row: Int) -> Bool {
        row >= 0 && row < rows
    }
    private func isValid(column: Int) -> Bool {
        column >= 0 && column < columns
    }
    
    private func isValid(column: String) -> Bool {
        self.columns_names.keys.contains(column)
    }
    
    private func isValid(rows: ClosedRange<Int>) -> Bool {
        isValid(row: rows.lowerBound) && isValid(row: rows.upperBound)
    }
    private func isValid(columns: ClosedRange<Int>) -> Bool {
        isValid(column: columns.lowerBound) && isValid(column: columns.upperBound)
    }
    
    private func isValid(columns: [String]) -> Bool {
        columns.allSatisfy{ isValid(column: $0) }
    }
    
    public subscript(row: Int, column: Int) -> Any {
        get{
            precondition(isValid(row: row) && isValid(column: column),
                         "Frame: Index out of range")
            return data[column][row]
        }
        set {
            precondition(isValid(row: row) && isValid(column: column),
                         "Frame: Index out of range")
            self.data[column][row] = newValue
        }
    }
    
    public subscript(row: Int, column: String) -> Any {
        get{
            precondition(isValid(row: row) && isValid(column: column),
                         "Frame: Index out of range")
            let c: Int = columns_names[column]!
            return data[c][row]
        }
        set {
            precondition(isValid(row: row) && isValid(column: column),
                         "Frame: Index out of range")
            let c: Int = columns_names[column]!
            self.data[c][row] = newValue
        }
    }
    
    // public tensorfy(from columns: [String], casting: Float) {}
    // transpose
    // train, test, validation splits
    // slice
    // append
    // concat
    // fillna
    // sort
    // map, reduce, filter
    // groupby
    // drop / drop_duplicates
    // time data
    // categorical / one_hot_encoder / ordinal_encoder
    
    // read csv
    // read parquet
    // read sql
    
    // repl (print)
    
    // head
    // tail
    // sample
    
    // Testing
    var text = "Hello, World!"
    
    
}
