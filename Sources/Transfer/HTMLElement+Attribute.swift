import Foundation


public extension HTMLElement {
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
        
        public var key: String {
            switch self {
            case .custom(let wrapped, _): return wrapped
            default: return getKey()
            }
        }
    }
    
}


public extension HTMLElement.Attribute {
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
