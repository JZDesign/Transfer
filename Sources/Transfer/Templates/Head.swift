import Foundation

public struct Head {
    public let title: String
    public let headContent: [Transferable]
    
    public var element: Transferable {
        TransferElement(element: .head, content: [titleElement] + headContent)
    }
    
    private var titleElement: Transferable {
        TransferElement(element: .title, content: title)
    }
    
    public init(title: String, headContent: [Transferable]) {
        self.title = title
        self.headContent = headContent
    }
    
    public init(title: String, headContent: TransferElement...) {
        self.init(title: title, headContent: headContent)
    }
    
    public func rendered() -> String {
        element.rendered()
    }
    
}
