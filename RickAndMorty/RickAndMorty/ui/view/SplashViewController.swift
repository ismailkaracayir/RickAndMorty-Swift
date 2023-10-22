//
//  SplashViewController.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeView.backgroundColor = UIColor.clear
        self.alpaAnimation()
        let ud = UserDefaults.standard
        let firstLogIn = ud.string(forKey: "isFirstLogIn") ?? nil
        if firstLogIn == nil {
            bodyLbl.text = "Welcome"
        }else{
            bodyLbl.text = "Hello"
            }
        ud.set("1", forKey: "isFirstLogIn")
        
        

    }
    
    override func viewDidLayoutSubviews() {
        let theme = AppTheme(customView: mainView)
        let gradientLayer = theme.customGradient
        mainView.layer.insertSublayer(gradientLayer, at: 0)
        if mainView.frame.size.width > mainView.frame.size.height{
            titleLbl.center = CGPoint(x: ( mainView.frame.size.height / 2) , y:( mainView.frame.size.height / 2))
            welcomeView.center = CGPoint(x: ( mainView.frame.size.height  * 1.5) , y:( mainView.frame.size.height / 2 ))

        }
        
    }

    
 
    func alpaAnimation() {
        self.bodyLbl.alpha = 0
        self.titleLbl.alpha = 0
        UIView.animate(withDuration: 2, animations:   {
            self.bodyLbl.alpha = 1
            self.titleLbl.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 1, animations:     {
                self.bodyLbl.alpha = 0
                self.titleLbl.alpha = 0

            }) { (true) in
                self.performSegue(withIdentifier: "toMain", sender: nil)
            }
        }
    }

}

