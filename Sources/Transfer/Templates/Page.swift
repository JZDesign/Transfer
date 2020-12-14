import Foundation

/// An HTML Page Template
///
/// This encapsulates the logic to render an entire webpage.
///
public class Page {
    public let language: String
    public let head: Head
    public var bodyContent: [TransferElement]
    
    /// Initializes an instance of a Page
    /// - Parameters:
    ///   - language: The page's language. i.e. "en"
    ///   - head: A Head template.
    public init(
        language: String = "en",
        head: Head,
        body: TransferElement...
    ) {
        self.language = language
        self.head = head
        self.bodyContent = body
    }
    
    /// Renders the Page as HTML
    /// - Parameter body: The desired body of the page
    /// - Returns: A String of HTML describing the page
    public func rendered() -> String {
        HTML_DOCTYPE +
        TransferElement(
            .html,
            attributes: [.lang(value: language)],
            content: head.element, TransferElement(.body, content: bodyContent)
        ).rendered()
    }
}
