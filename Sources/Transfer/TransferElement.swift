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

fileprivate extension TransferElement {
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
}
