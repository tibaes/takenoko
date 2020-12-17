import XCTest

import TakenokoTests

var tests = [XCTestCaseEntry]()
tests += TensorFrameTests.allTests()
XCTMain(tests)
