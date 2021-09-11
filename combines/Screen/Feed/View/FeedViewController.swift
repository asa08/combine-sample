//
//  FeedViewController.swift
//  combines
//
//  Created by maiko morisaki on 2021/09/11.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var feedView: FeedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedView.initSelf()
    }
}
