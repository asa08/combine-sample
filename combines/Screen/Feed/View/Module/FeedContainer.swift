//
//  FeedContainer.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit
import Combine

class FeedContainer: UIView {
    
    var cancellables = Set<AnyCancellable>()
    
    func clearTranslates(filter: ((UIView) -> Bool)? = nil) {
        clearTranslates(self, filter: filter)
    }
    
    private func clearTranslates(_ view: UIView, filter: ((UIView) -> Bool)?) {
        if filter == nil || filter?(view) == true {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.subviews.forEach({ clearTranslates($0, filter: filter) })
        }
    }
}
