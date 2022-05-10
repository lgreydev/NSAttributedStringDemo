//
//  ViewController.swift
//  NSAttributedStringDemo
//
//  Created by Sergey Lukaschuk on 08.05.2022.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

    lazy var textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .yellow
        view.text = "A string with associated attributes (such as visual style, hyperlinks, or accessibility data) for portions of its text."
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        addViews()
        addConstrains()
        workString()
    }
}


extension ViewController{
    private func addViews() {
        view.addSubview(textView)
    }

    private func addConstrains() {
        constrainToTextView()
    }

    private func constrainToTextView() {
        textView.height(200)
        textView.centerInSuperview()
        textView.leadingToSuperview()
        textView.trailingToSuperview()
    }

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
}

extension UIFont {

    private func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else { fatalError() }
        return UIFont(descriptor: descriptor, size: 0)
    }

    // MARK:  
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}
