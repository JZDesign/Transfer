import Foundation

public extension TransferElement {
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
        
        return TransferElement(.link, attributes: attributes, content: "")
    }
    
    /// A static helper that returns a favicon `<link>` tag
    /// - Parameters:
    ///   - href: The path to the site's favicon, or the URL of an external one.
    /// - Returns: A TransferElement ready to render a favicon in HTML
    static func favicon(_ href: String = "favicon.ico") -> TransferElement {
        TransferElement(.link, attributes: [.rel(value: "icon"), .href(value: href)], content: "")
    }
    
    /// A static helper that returns an anchor `<a>` tag
    /// - Parameters:
    ///   - href: The path the anchor should bring you to, or the URL of an external one.
    ///   - content: The text to display (or the rendered HTML Element that the anchor should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - target: The Target type **Defaults to blank**, `i.e. blank, self etc.,`
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render an anchor in HTML
    ///
    /// By default this helper will return an anchor element with the `href`, `target` and `class` attributes,
    /// although more can be included.
    ///
    /// ```swift
    /// .a(
    ///     "www.mysite.com/blogs/1",
    ///     content: StyledButtonElement("Click Me").rendered()
    ///     ).rendered()
    /// ```
    ///
    /// This would return:
    ///
    /// ```HTML
    /// <a href="www.mysite.com/blogs/1" class="" target="_blank"><div class="someButtonClass">Click Me</div></a>
    /// ```
    ///
    static func a(
        _ href: String,
        content: String,
        cssClass: String = "",
        target: Target = .blank,
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .a,
            attributes: [
                .href(value: href),
                .target(value: target.rawValue),
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a article `<article>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a article in HTML
    ///
    static func article(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .article,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a body `<body>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a body in HTML
    ///
    static func body(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .body,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a break `<br>` tag
    /// - Returns: A TransferElement ready to render a break in HTML
    static func br() -> TransferElement {
        TransferElement(.br)
    }
    
    /// A static helper that returns a div `<div>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a div in HTML
    ///
    static func div(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .div,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a footer `<footer>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a footer in HTML
    ///
    static func footer(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .footer,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a header `<h1>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<h1>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a header in HTML
    ///
    static func h1(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .h1,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a header `<h2>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<h2>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a header in HTML
    ///
    static func h2(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .h2,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a header `<h3>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<h3>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a header in HTML
    ///
    static func h3(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .h3,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a header `<header>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a header in HTML
    ///
    static func header(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .header,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a horizontal rule `<hr>` tag
    /// - Returns: A TransferElement ready to render a horizontal rule in HTML
    static func hr() -> TransferElement {
        TransferElement(.hr)
    }
    
    /// A static helper that returns a img `<img>` tag
    /// - Parameters:
    ///   - src: The path to the image file that will be displayed
    ///   - altText: The string that contains helper text (useful for accessiblity)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a img in HTML
    ///
    static func img(
        _ src: String,
        altText: String = "",
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .img,
            attributes: [
                .src(value: src),
                .alt(value: altText),
                .class(value: cssClass)
            ] + additionalAttributes,
            content: ""
        )
    }
    
    /// A static helper that returns a list item `<li>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<li>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a list item in HTML
    ///
    static func li(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .li,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a nav `<nav>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a nav in HTML
    ///
    static func nav(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .nav,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns an ordered list `<ol>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render an ordered list in HTML
    ///
    static func ol(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .ol,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a paragraph `<p>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<p>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a paragraph in HTML
    ///
    static func p(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .p,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a section `<section>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a section in HTML
    ///
    static func section(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .section,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a span `<span>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<p>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a span in HTML
    ///
    static func span(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .span,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns a strong `<strong>` tag
    /// - Parameters:
    ///   - content: The text to display (or the rendered HTML Element that the `<p>` should contain)
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render a strong in HTML
    ///
    static func strong(
        _ content: String,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .strong,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
    
    /// A static helper that returns an unordered list `<ul>` tag
    /// - Parameters:
    ///   - content: Vararg TransferElements to be displayed.
    ///   - cssClass: The desired class. **Defaults to ""**
    ///   - addtionalAttributes: Any HTMLElement.Attribute that could be added.
    /// - Returns: A TransferElement ready to render an unordered list in HTML
    ///
    static func ul(
        _ content: TransferElement...,
        cssClass: String = "",
        additionalAttributes: [HTMLElement.Attribute] = []
    ) -> TransferElement {
        TransferElement(
            .ul,
            attributes: [
                .class(value: cssClass)
            ] + additionalAttributes,
            content: content
        )
    }
}
