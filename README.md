# NSAttributedString

### Configure Attributed String

``` swift

    private func workString() {

        let attributeString = NSMutableAttributedString(string: textView.text)

        guard let font = UIFont(name: "Georgia", size: 20) else { fatalError() }

        let attribute = [
            NSAttributedString.Key.font: font.bold(),
            NSAttributedString.Key.backgroundColor: UIColor.magenta,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ] as [NSAttributedString.Key : Any]

        attributeString.addAttributes(attribute, range: (attributeString.string as NSString).range(of: "associated"))

        textView.attributedText = attributeString
    }

```

### Public methods

``` swift

extension UIFont {

    private func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else { fatalError() }
        return UIFont(descriptor: descriptor, size: 0)
    }

    // MARK: Public methods
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}

```

### Tools 🛠
[Visual Attributed String](https://apps.apple.com/us/app/visual-attributed-string/id954961175)
Create NSAttributedStrings for your iOS and Mac applications
