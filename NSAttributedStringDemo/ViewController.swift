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
        guard let text = textView.text else { fatalError() }

        let firstCharacter = text.startIndex
        let fourthCharacter = text.index(firstCharacter, offsetBy: 3)

        let first = text[firstCharacter]
        let fourth = text[fourthCharacter]

        print("firstCharacter: \(first)\nfourthCharacter: \(fourth)")
    }
}
