

public struct Frame<DataContainer: RandomAccessCollection> {
    private(set) var data: DataContainer
    private(set) var rows: Int = 0
    private(set) var columns: Int = 0
    private(set) var columnsNames: Dictionary<AnyHashable, Int>
    
    public var count: Int { columns * rows }
}

// Init & Indexing with Arrays
extension Frame where DataContainer == Array<Any> {
    public init(from dict: Dictionary<AnyHashable, AnyRandomAccessCollection<Any>>) {
        // sanity check
        precondition(dict.count > 0)
        let checkRows = dict.randomElement()!.value.count
        dict.forEach({ _, value in
            precondition(value.count == checkRows)
        })
        // copy data
        self.data = []
        self.data.reserveCapacity(dict.count)
        self.columnsNames = [:]
        self.columnsNames.reserveCapacity(dict.count)
        dict.forEach{ key, value in
            self.columnsNames[key] = self.data.count
            self.data.append(value)
        }
        self.rows = checkRows
        self.columns = dict.count
    }
}





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
