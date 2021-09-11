//
//  Combine+UITextView.swift.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit
import Combine

extension UITextView {
    func textPublisher() -> AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextView.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextView)?.text  ?? "" }
            .eraseToAnyPublisher()
    }
}
