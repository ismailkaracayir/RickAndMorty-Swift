//
//  ViewController.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    override func viewDidLayoutSubviews() {
        let theme = AppTheme(customView: mainView)
        let gradientLayer = theme.customGradient
        mainView.layer.insertSublayer(gradientLayer, at: 0)
   
        
    }


}

