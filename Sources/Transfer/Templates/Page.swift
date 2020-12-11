import Foundation

public struct Page {
    public let language: String
    public let head: Head
    public init(language: String = "en", head: Head) {
        self.language = language
        self.head = head
    }

}

public extension Page {
    func rendered(withBody body: TransferElement...) -> String {
        rendered(withBody: body)
    }
    
    func rendered(withBody body: Transferable...) -> String {
        rendered(withBody: body)
    }
    
    func rendered(withBody body: [Transferable]) -> String {
        rendered(body.rendered())
    }
    
    func rendered(_ body: String) -> String {
        TransferElement(
            element: .html,
            attributes: [.lang(value: language)],
            content: head.element, TransferElement(element: .body, content: body)
        ).rendered()
    }
}
