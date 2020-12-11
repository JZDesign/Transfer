import XCTest
@testable import Transfer

final class HeadTests: XCTestCase {
    func testHeadRendersHTML() {
        let head = Head(
            title: "Title",
            headContent: [TransferElement.styleSheet("styles/someThing.css"), .favicon()]
        ).rendered()
        
        XCTAssertEqual(head, "<head><title>Title</title><link rel=\"stylesheet\" href=\"styles/someThing.css\"></link><link rel=\"icon\" href=\"favicon.ico\"></link></head>")
        
    }
}
