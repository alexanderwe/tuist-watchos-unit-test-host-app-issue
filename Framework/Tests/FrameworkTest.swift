import XCTest
@testable import Framework

class FrameworkTest: XCTestCase {

	func testProperty() async throws {
        XCTAssertEqual(Framework.text, "Hello, Framework!")
	}

}
