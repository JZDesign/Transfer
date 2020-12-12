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
    
    public init(_ element: String, attributes: [HTMLElement.Attribute] = [], content: String) {
        self.element = element
        self.attributes = attributes
        self.content = content
    }
}

extension TransferElement {
    init(_ element: String, attributes: [HTMLElement.Attribute] = [], content: [Transferable]) {
        self.init(element, attributes: attributes, content: content.rendered())
    }
    
    init(_ element: HTMLElement, attributes: [HTMLElement.Attribute] = [], content: [Transferable]) {
        self.init(element.rawValue, attributes: attributes, content: content)
    }
}


public extension TransferElement {
    init(_ element: String, attributes: [HTMLElement.Attribute] = [], content: Transferable...) {
        self.init(element, attributes: attributes, content: content)
    }
    
    init(_ element: HTMLElement, attributes: [HTMLElement.Attribute] = [], content: Transferable...) {
        self.init(element, attributes: attributes, content: content)
    }
    
    init(_ element: HTMLElement, attributes: [HTMLElement.Attribute] = [], content: String) {
        self.init(element.rawValue, attributes: attributes, content: content)
    }
}
