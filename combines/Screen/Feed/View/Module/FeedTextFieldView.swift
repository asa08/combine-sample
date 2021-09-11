//
//  FeedTextField.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit

class FeedTextFieldView: FeedContainer {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.backgroundColor = .lightGray
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        return label
    }()
    
    let textField: UITextField = {
        let view = UITextField()
        view.placeholder = "入力してね"
        view.font = .systemFont(ofSize: 14)
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
        addSubview(label)
        addSubview(textField)
        
        setting()
        
        clearTranslates()
        makeAutolayout()
    }
    
    private func setting() {
        textField.publisher(for: .allEditingEvents)
            .map{ _ in self.textField.text }
            .assign(to: \.text, on: label)
            .store(in: &cancellables)
    }
    
    private func makeAutolayout() {
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
