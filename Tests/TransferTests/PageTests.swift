import XCTest
@testable import Transfer

final class PageTests: XCTestCase {
    func testPageRendersHTML() {
        let newPage = Page(
            head: Head(title: "Title", headContent: .styleSheet("styles/someThing.css"), .favicon())
        )
        
        let result = "<html lang=\"en\"><head><title>Title</title><link rel=\"stylesheet\" href=\"styles/someThing.css\"></link><link rel=\"icon\" href=\"favicon.ico\"></link></head><body><h1>This is your title</h1></body></html>"
        
        XCTAssertEqual(newPage.rendered(withBody: TransferElement(element: .h1, attributes: [], content: "This is your title")), result)
        
    }
}


struct Body {
    
    func doX() {
        let someDivContent = TransferElement(element: "", content: "")
        
        let body = [
            TransferElement(element: .h1, content: "This is your title"),
            TransferElement(element: .div, attributes: [.class(value: "container")], content: someDivContent)
        ]
        
        Page(
            head: Head(
                title: "Title", headContent:
                        .styleSheet("styles/someThing.css"),
                       .favicon()
            )
        ).rendered(withBody: body)
        
        
    }
    
}


