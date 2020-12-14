import XCTest
@testable import Transfer

final class PageTests: XCTestCase {
    
    let result = "\(HTML_DOCTYPE)<html lang=\"en\"><head><title>Title</title><link rel=\"stylesheet\" href=\"styles/someThing.css\"></link><link rel=\"icon\" href=\"favicon.ico\"></link></head><body><h1>This is your title</h1><div class=\"someClass\"><p class=\"bold\">This is a test</p></div></body></html>"
    
    func testPageRendersHTML() {
        let content: [TransferElement] = [.styleSheet("styles/someThing.css"), .favicon()]
        
        XCTAssertEqual(
            Page(
                head: Head(title: "Title", headContent: content),
                body:
                    .h1("This is your title"),
                    .div(.p("This is a test", cssClass: "bold"), cssClass: "someClass")
                ).rendered(),
            result
        )
        
    }
}
