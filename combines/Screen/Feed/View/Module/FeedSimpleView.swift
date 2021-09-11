//
//  FeedSimpleView.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit

class FeedSimpleView: FeedContainer {
    
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
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
        addSubview(baseView)
        
        setting()
        
        clearTranslates()
        makeAutolayout()
    }
    
    private func setting() {
        baseView.gesture().sink(receiveValue: { _ in
            print("view tapped!!")
        }).store(in: &cancellables)
    }
    
    private func makeAutolayout() {
        NSLayoutConstraint.activate([
            baseView.heightAnchor.constraint(equalToConstant: 300),
            baseView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            baseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
