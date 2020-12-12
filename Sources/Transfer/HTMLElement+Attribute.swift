import Foundation


public extension HTMLElement {
    
    /// A list of common HTML Element Attributes
    /// i.e. `id, style, target, class, alt, etc.,`
    ///
    /// Usage:
    ///
    /// Passing attributes to the `TransferElement` will automatically get rendered appropriately in the HTML.
    /// ```
    /// TransferElement(
    ///     element: .img,
    ///     attributes: [
    ///         .src(value: "images/cute_kitten.jpeg"),
    ///         .alt(value: "A cute kitten")
    ///         ],
    ///     content: ""
    ///     )
    /// ```
    ///
    /// This example renders the `src` and `alt` attributes inside of an Image element.
    /// That result would look like this:
    ///
    /// ```
    /// <img src="images/cute_kitten.jpeg" alt="A cute kitten"></img>
    /// ```
    ///
    enum Attribute {
        case action(value: String)
        case alt(value: String)
        case autofocus(value: String)
        case checked(value: String)
        case cite(value: String)
        case `class`(value: String)
        case data(value: String)
        case draggable(value: String)
        case form(value: String)
        case formaction(value: String)
        case href(value: String)
        case id(value: String)
        case label(value: String)
        case lang(value: String)
        case media(value: String)
        case name(value: String)
        case placeholder(value: String)
        case rel(value: String)
        case selected(value: String)
        case span(value: String)
        case src(value: String)
        case style(value: String)
        case target(value: String)
        case title(value: String)
        case translate(value: String)
        case type(value: String)
        case value(value: String)
        case custom(key: String, value: String)
        
        /// The string value of the attribute.
        ///
        /// This returns the string value of the attribute .i.e.
        /// ```
        /// .src.key == "src", "id", or "class"
        /// ```
        ///
        public var key: String {
            switch self {
            case .custom(let wrapped, _): return wrapped
            default: return getKey()
            }
        }
    }
    
}


public extension HTMLElement.Attribute {
    /// Converts the instance into an HTML Element's Attribute
    /// - Returns: A fully qualified string of the associated attribute
    ///
    ///```
    /// .src(value: "someFile.txt").toHTMLAttribute() == " src=\"someFile.txt\""
    /// ```
    ///
    func toHTMLAttribute() -> String {
        return " \(key)=\(getValue())"
    }
}

fileprivate extension HTMLElement.Attribute {
    func getValue() -> String {
        switch self {
        case .custom( _, let value):
            return "\"\(value)\""
        default:
            if let mirror = Mirror(reflecting: self).children.first {
                return strip(mirror.value)
            }
        }
        
        return ""
        
    }
    
    func strip(_ object: Any) -> String {
        var description = String(describing: object)
        description.removeLast()
        
        return description.replacingOccurrences(of: "(value: ", with: "")
    }
    
    func getKey() -> String {
        Mirror(reflecting: self).children.first?.label ?? ""
    }
}

public enum Target: String {
    case blank = "_blank"
    case `self` = "_self"
    case parent = "_parent"
    case top = "_top"
}
