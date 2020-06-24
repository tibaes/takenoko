import TensorFlow
import Accelerate

public struct TensorFrame {
    private(set) var data: Any
    private(set) var rows: Int = 0
    private(set) var columns: Int = 0
    private(set) var columns_names: Dictionary<AnyHashable, Int>
    private(set) var columns_types: [Any]
    
    public var size: Int { columns * rows }
    
    
    // MARK - Initialization
    
    public init<T: TensorFlowScalar>(_ array: [T], column name: String = "0") {
        self.data = [Tensor<T>(array)]
        self.rows = array.count
        self.columns = 1
        self.columns_names = [name: 0]
        self.columns_types = [Float.self]
    }
    
    // empty
    // matrix: [[T]]
    // array: Tensor / [Tensor]
    // dict
    // zeros, ones, repeated, random
    
    public init(copy: TensorFrame) {
        self.data = copy.data
        self.rows = copy.rows
        self.columns = copy.columns
        self.columns_names = copy.columns_names
        self.columns_types = copy.columns_types
    }
    
    // MARK - Indexing / Slicing
    
    private func isValid(row: Int) -> Bool {
        row >= 0 && row < rows
    }
    private func isValid(column: Int) -> Bool {
        column >= 0 && column < columns
    }
//    private func isValid(column: String) -> Bool {}
    private func isValid(rows: ClosedRange<Int>) -> Bool {
        isValid(row: rows.lowerBound) && isValid(row: rows.upperBound)
    }
    private func isValid(columns: ClosedRange<Int>) -> Bool {
        isValid(column: columns.lowerBound) && isValid(column: columns.upperBound)
    }
//    private func isValid(columns: [String]) -> Bool
    
    public subscript(row: Int, column: Int) -> Any {
        get{
            precondition(isValid(row: row) && isValid(column: column),
                         "Index out of range")
            return data[column][row]
        }
        set {
            precondition(isValid(row: row) && isValid(column: column),
                         "Index out of range")
            precondition(type(of: newValue) == columns_types[column],
                         "Types mismatch")
            self.data[column][row] = newValue
        }
    }
    
//    public subscript(row: Int, column: String) -> Any {}
    
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
