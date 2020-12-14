import XCTest
@testable import Transfer

final class TransferElementHelperTests: XCTestCase {
    let title = "title"
    let a = TransferElement.a("a", content: "b")
    
    lazy var artical = TransferElement.article(a)
    lazy var renderedA = """
<a href="a" target="_blank">b</a>
"""
    
    func testAnchorPrePopulatesWithSetAttributes() {
        assert(a, matches: renderedA)
    }
    
    func testBodyPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.body(artical), matches: rendered("body", rendered("article", renderedA)))
    }
    
    func testBreakHelper() {
        assert(.br(), matches: "<br></br>")
    }
    
    func testDivPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.div(a), matches: rendered("div", renderedA))
    }
    
    func testFooterPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.footer(a), matches: rendered("footer", renderedA))
    }
    
    func testHeaderPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.header(a), matches:rendered("header", renderedA))
    }
    
    func testHeadingsPrePopulateWithSetAttributes() {
        assert(.h1(title), matches: rendered("h1", title))
        assert(.h2(title), matches: rendered("h2", title))
        assert(.h3(title), matches: rendered("h3", title))
    }
    
    func testHRHelper() {
        assert(.hr(), matches: "<hr></hr>")
    }
    
    func testImagePrepopulatesAttributes() {
        assert(.img("img/1.png"), matches: """
<img src="img/1.png"></img>
""")
    }
    
    func testListItemPrePopulatesWithSetAttributes() {
        assert(.li(title), matches: rendered("li", title))
    }
    
    func testParagraphPrePopulatesWithSetAttributes() {
        assert(.p(title), matches: rendered("p", title))
    }
    
    func testNavPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.nav(a), matches:rendered("nav", renderedA))
    }
    
    func testOlPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.ol(a), matches:rendered("ol", renderedA))
    }
    
    func testSectionPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.section(a), matches:rendered("section", renderedA))
    }
    
    func testSpanPrePopulatesWithSetAttributes() {
        assert(.span(title), matches: rendered("span", title))
    }
    
    func testStrongPrePopulatesWithSetAttributes() {
        assert(.strong(title), matches: rendered("strong", title))
    }
    
    func testUlPrePopulatesWithSetAttributesAndNestedContent() {
        assert(.ul(a), matches:rendered("ul", renderedA))
    }
    
    func assert(_ element: TransferElement, matches: String) {
        XCTAssertEqual(element.rendered(), matches)
    }
    
    func rendered(_ element: String, _ content: String = "") -> String {
        """
<\(element)>\(content)</\(element)>
"""
    }
}

