import XCTest
@testable import Transfer

final class PageTests: XCTestCase {
    func testPageRendersHTML() {
        let content: [TransferElement] = [.styleSheet("styles/someThing.css"), .favicon()]

        let newPage = Page(
            head: Head(title: "Title", headContent: content)
        )
        
        let result = "<html lang=\"en\"><head><title>Title</title><link rel=\"stylesheet\" href=\"styles/someThing.css\"></link><link rel=\"icon\" href=\"favicon.ico\"></link></head><body><h1 class=\"\">This is your title</h1></body></html>"
        
        XCTAssertEqual(newPage.rendered(withBody: .h1("This is your title")), result)
        
    }
}
