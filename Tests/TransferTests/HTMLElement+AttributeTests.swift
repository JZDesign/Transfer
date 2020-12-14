import XCTest
@testable import Transfer

final class AttributesTests: XCTestCase {
    func testToHTMLAttribute() {
        XCTAssertEqual(HTMLElement.Attribute.lang(value: "en").toHTMLAttribute(), " lang=\"en\"")
    }

    func testCustomAttribute() {
        XCTAssertEqual(HTMLElement.Attribute.custom(key: "data-2.0", value: "nein!").toHTMLAttribute(), " data-2.0=\"nein!\"")
    }

    func testIgnoringEmpty() {
        XCTAssertEqual(
            [HTMLElement.Attribute.class(value: "")].ignoringEmpty().count,
            0
        )
    }
    
}
