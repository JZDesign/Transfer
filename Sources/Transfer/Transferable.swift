import Foundation

public protocol Transferable {
    var element: String { get set }
    var attributes: [HTMLElement.Attribute] { get set }
    var content: String { get set }
}
public extension Transferable {
    func rendered() -> String {
        "<\(element)\(elementAttributes(attributes))>\(content)</\(element)>"
    }
}

extension Transferable {
    func elementAttributes(_ attributes: [HTMLElement.Attribute]) -> String {
        attributes.compactMap { $0.toHTMLAttribute() }.joined()
    }
}

public extension Array where Element == Transferable {
    func rendered(separator: String = "") -> String {
        compactMap { $0.rendered() }.joined(separator: separator)
    }
}
