import Foundation

/// An HTML Page Template
///
/// This encapsulates the logic to render an entire webpage.
///
public struct Page {
    public let language: String
    public let head: Head
    
    /// Initializes an instance of a Page
    /// - Parameters:
    ///   - language: The page's language. i.e. "en"
    ///   - head: A Head template.
    public init(language: String = "en", head: Head) {
        self.language = language
        self.head = head
    }

}

public extension Page {
    
    /// Renders the Page as HTML
    /// - Parameter body: The desired body of the page
    /// - Returns: A String of HTML describing the page
    func rendered(withBody body: TransferElement...) -> String {
        rendered(withBody: body)
    }
    
    /// Renders the Page as HTML
    /// - Parameter body: The desired body of the page
    /// - Returns: A String of HTML describing the page
    func rendered(withBody body: Transferable...) -> String {
        rendered(withBody: body)
    }
    
    /// Renders the Page as HTML
    /// - Parameter body: The desired body of the page
    /// - Returns: A String of HTML describing the page
    func rendered(withBody body: [Transferable]) -> String {
        rendered(body.rendered())
    }
    
    /// Renders the Page as HTML
    /// - Parameter body: The desired body of the page
    /// - Returns: A String of HTML describing the page
    func rendered(_ body: String) -> String {
        TransferElement(
            element: .html,
            attributes: [.lang(value: language)],
            content: head.element, TransferElement(element: .body, content: body)
        ).rendered()
    }
}
