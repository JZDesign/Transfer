import Foundation

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
    
    
    static func styleSheet(_ href: String, media: String = "") -> TransferElement {
        var attributes: [HTMLElement.Attribute] = [
            .rel(value: "stylesheet"),
            .href(value: href)
        ]
        
        if media != "" {
            attributes.append(.media(value: media))
        }

        return TransferElement(element: .link, attributes: attributes, content: media)
    }
    
    static func favicon(_ href: String = "favicon.ico") -> TransferElement {
        TransferElement(element: .link, attributes: [.rel(value: "icon"), .href(value: href)], content: "")
    }
    
}
