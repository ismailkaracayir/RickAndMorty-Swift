
import UIKit

class AppTheme {
    let customView: UIView
    
    init(customView: UIView) {
        self.customView = customView
    }
    
    var customGradient: CAGradientLayer {
      //  let viewWidth = customView.bounds.size.width
        //let viewHeight = customView.bounds.size.height
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.frame = customView.bounds
        gradientLayer.locations = [ 0.1, 0.3, 0.5, 0.7, 1 ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint =  CGPoint(x: 0.0, y: 0.0)
        gradientLayer.colors = [
            customColor4.cgColor,
            customColor3.cgColor,
            customColor2.cgColor,
            customColor1.cgColor,
            customColor1.withAlphaComponent(0.3).cgColor
        ]
        return gradientLayer
    }
    
    var customColor1: UIColor {
        return UIColor(named: "customColor1") ?? UIColor.white
    }
    
    var customColor2: UIColor {
        return UIColor(named: "customColor2") ?? UIColor.white
    }
    
    var customColor3: UIColor {
        return UIColor(named: "customColor3") ?? UIColor.white
    }
    
    var customColor4: UIColor {
        return UIColor(named: "customColor4") ?? UIColor.white
    }
}

