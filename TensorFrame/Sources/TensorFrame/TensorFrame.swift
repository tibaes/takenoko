import TensorFlow

public struct TensorFrame {
    private(set) var data: Any
    private(set) var rows: Int = 0
    private(set) var columns: Int = 0
    private(set) var columns_names: Dictionary<AnyHashable, Int>
    private(set) var columns_types: [Any]
    
    public var size: Int { columns * rows }
    
//    public init(_ array: [Float]) {
//        
//    }
    
    
    
    // Testing
    var text = "Hello, World!"
    
    
}
