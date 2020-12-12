import XCTest
@testable import Transfer

final class HeadTests: XCTestCase {
    func testHeadRendersHTML() {
        let content: [TransferElement] = [.styleSheet("styles/someThing.css"), .favicon()]
        
        let head = Head(
            title: "Title",
            headContent: content
        ).rendered()
        
        XCTAssertEqual(head, "<head><title>Title</title><link rel=\"stylesheet\" href=\"styles/someThing.css\"></link><link rel=\"icon\" href=\"favicon.ico\"></link></head>")
        
    }
}
