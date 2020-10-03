//
//  File.swift
//  
//
//  Created by Rafael Henrique Tibaes on 10/3/20.
//

import TensorFlow


public struct Series {
    private var data: Any = []
    private(set) var count: Int = 0
    private(set) var dtype: Any.Type = Any.self
    
    // MARK - Initialization
    
    public init(copy: Series) {
        self.data = copy.data
        self.count = copy.count
        self.dtype = copy.dtype
    }
    
    public init(data: [Any]) {
        self.data = data
        self.count = data.count
        self.dtype = Any.self
    }
    
    public init(data: Tensor<Float>) {
        self.dtype = Float.self
        if data.shape.count > 0 {
            self.data = data
            self.count = data.shape[0]
        } else {
            self.data = Tensor<Float>([data])
            self.count = 1
        }
    }
    
    // MARK - Indexing / Slicing
    
    public subscript(index: Int) -> Any {
        get{
            precondition(index < count,
                         "Series: Index out of range")
            // TODO
            // return data[index]
            return 0
        }
        set {
            precondition(index < count,
                         "Series: Index out of range")
            precondition(type(of: newValue) == dtype,
                         "Series: Types mismatch")
            // TODO
            // data[index] = newValue
        }
    }
}
