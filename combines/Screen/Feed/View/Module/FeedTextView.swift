//
//  FeedTextView.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit

class FeedTextView: FeedContainer {
    
    let textView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 14)
        view.isScrollEnabled = false
        view.text = "ラグドールが誕生したのは、1960年頃。原産地はアメリカのカリフォルニア州です。\nもともとペルシャを繁殖していたブリーダーが、地域の土着猫と自らの猫との交配で新たな猫種を作出したことから、ラグドールの歴史は始まります。\nこの猫に自信を持ったブリーダーは、新たな血統登録団体（IRCA）を立ち上げてラグドールの繁殖をフランチャイズビジネス展開するようになります。ところが、独占的なやり方に疑問を持つ人たちもいたようです。\nそれからフランチャイズ契約を行わずに繁殖を行う人たちの手によってラグドールが作出されるようになり、新たな猫種として世界に広まることとなりました。"
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoinInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoinInit()
    }
    
    private func commoinInit() {
        addSubview(textView)
        
        setting()
        
        clearTranslates()
        makeAutolayout()
    }
    
    private func setting() {
        textView.textPublisher().sink(receiveValue: { _ in
            print("text canged!!")
        }).store(in: &cancellables)
    }
    
    private func makeAutolayout() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
