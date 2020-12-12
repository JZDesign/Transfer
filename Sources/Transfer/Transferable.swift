import Foundation

/// The interface utilized to generate HTML
public protocol Transferable {
    var element: String { get set }
    var attributes: [HTMLElement.Attribute] { get set }
    var content: String { get set }
}

public extension Transferable {
    /// Convert Transferable contents to HTML
    /// - Returns: HTTP String
    func rendered() -> String {
        "<\(element)\(elementAttributes(attributes))>\(content)</\(element)>"
    }
}

extension Transferable {
    
    /// Converts an array of attributes to a String
    /// - Parameter attributes: HTMLElement.Attibute (.class, .style, etc.,)
    /// - Returns: A fully built String of HTMLElement Attributes i.e. " class="someClass" src="someSource""
    func elementAttributes(_ attributes: [HTMLElement.Attribute]) -> String {
        attributes.compactMap { $0.toHTMLAttribute() }.joined()
    }
}

public extension Array where Element == Transferable {
    
    /// /// Convert contents to HTML
    /// - Parameter separator: The string that separates two HTML Elements. This defaulst to ""
    /// - Returns: HTTP String
    func rendered(separator: String = "") -> String {
        compactMap { $0.rendered() }.joined(separator: separator)
    }
}
