import Foundation

/// The implementation of the Transferable Protocol
///
/// This structure is made to contain all of the details about each HTML element
/// and will render as HTML when needed.
///
/// Usage:
///
///```
/// TransferElement(
///     element: .img,
///     attributes: [
///         .src(value: "images/cute_kitten.jpeg"),
///         .alt(value: "A cute kitten")
///         ],
///     content: ""
///     ).rendered()
/// ```
///This returns:
///
/// ```
/// "<img src=\"images/cute_kitten.jpeg\" alt=\"A cute kitten\"></img>"
/// ```
///
public struct TransferElement: Transferable {
    public var element: String
    public var attributes: [HTMLElement.Attribute]
    public var content: String
    
    public init(element: String, attributes: [HTMLElement.Attribute] = [], content: String) {
        self.element = element
        self.attributes = attributes
        self.content = content
    }
}

extension TransferElement {
    init(element: String, attributes: [HTMLElement.Attribute] = [], content: [Transferable]) {
        self.init(element: element, attributes: attributes, content: content.rendered())
    }
    
    init(element: HTMLElement, attributes: [HTMLElement.Attribute] = [], content: [Transferable]) {
        self.init(element: element.rawValue, attributes: attributes, content: content)
    }
}


public extension TransferElement {
    init(element: String, attributes: [HTMLElement.Attribute] = [], content: Transferable...) {
        self.init(element: element, attributes: attributes, content: content)
    }
    
    init(element: HTMLElement, attributes: [HTMLElement.Attribute] = [], content: Transferable...) {
        self.init(element: element, attributes: attributes, content: content)
    }
    
    init(element: HTMLElement, attributes: [HTMLElement.Attribute] = [], content: String) {
        self.init(element: element.rawValue, attributes: attributes, content: content)
    }
    
    
    // MARK: - Helpers
    
    
    /// A static helper that returns a stylesheet `<link>` tag
    /// - Parameters:
    ///   - href: The path to the site's stylesheet, or the URL of an external one.
    ///   - media: A String describing the screen size the stylesheet covers, this is not required. See more [on MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#Attributes)
    /// - Returns: A TransferElement ready to render a stylesheet in HTML
    static func styleSheet(_ href: String, media: String = "") -> TransferElement {
        var attributes: [HTMLElement.Attribute] = [
            .rel(value: "stylesheet"),
            .href(value: href)
        ]
        
        if media != "" {
            attributes.append(.media(value: media))
        }

        return TransferElement(element: .link, attributes: attributes, content: "")
    }
    
    /// A static helper that returns a favicon `<link>` tag
    /// - Parameters:
    ///   - href: The path to the site's favicon, or the URL of an external one.
    /// - Returns: A TransferElement ready to render a favicon in HTML
    static func favicon(_ href: String = "favicon.ico") -> TransferElement {
        TransferElement(element: .link, attributes: [.rel(value: "icon"), .href(value: href)], content: "")
    }
    
}
