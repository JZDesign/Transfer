import XCTest
@testable import Transfer

final class TransferableTests: XCTestCase {
    
    lazy var ELEMENT = TransferElement(
        element: .body,
        attributes: [.data(value:"String"), .class(value:"someClass")],
        content: TransferElement(element: .a, attributes: [], content: "")
    )
    
    lazy var ELEMENT_2 = TransferElement(
        element: "body",
        attributes: [.data(value:"String"), .class(value:"someClass")],
        content: TransferElement(element: .a, attributes: [], content: "")
    )
    
    let attributes = " data=\"String\" class=\"someClass\""
    lazy var renderedElement =  "<body\(attributes)><a></a></body>"
    
    func testRendered() {
        XCTAssertEqual(ELEMENT.rendered(), renderedElement)
    }
    
    func testRenderedOnArray() {
        XCTAssertEqual([ELEMENT, ELEMENT_2].rendered(), renderedElement + renderedElement)

    }
    
    func testElementAttributes() {
        XCTAssertEqual(ELEMENT.elementAttributes(ELEMENT.attributes), attributes)
    }
    
}
