//
//  FeedButton.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit

class FeedButtonView: FeedContainer {
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ボタンサンプル", for: .normal)
        button.layer.cornerRadius = 20
        return button
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
        addSubview(button)
        
        setting()
        
        clearTranslates()
        makeAutolayout()
    }
    
    private func setting() {
        button.publisher(for: .touchUpInside).sink(receiveValue: { _ in
            print("button tapped!!")
        }).store(in: &cancellables)
    }
    
    private func makeAutolayout() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
