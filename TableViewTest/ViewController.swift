//
//  ViewController.swift
//  TableViewTest
//
//  Created by Komal Gupta on 20/05/21.
//

import UIKit
import CarbonKit

@available(iOS 13.0, *)
class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    
    

    @IBOutlet weak var viewList: UIView!
    
    
    var itemControll = ["VAGETARISK", "PENDRIVE", "HARDDISK", "WOMEN"]
    var corbanTabSwipe = CarbonTabSwipeNavigation()
    var width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        corbanTabSwipe = CarbonTabSwipeNavigation(items: itemControll, delegate: self)
        corbanTabSwipe.setTabBarHeight(50)
        corbanTabSwipe.setIndicatorHeight(1)
        corbanTabSwipe.setIndicatorColor(#colorLiteral(red: 0.9534689784, green: 0.3966149688, blue: 0.1366854012, alpha: 1))
        corbanTabSwipe.setSelectedColor(#colorLiteral(red: 0.9534689784, green: 0.3966149688, blue: 0.1366854012, alpha: 1))
        corbanTabSwipe.setNormalColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        corbanTabSwipe.insert(intoRootViewController: self, andTargetView: viewList)
      //  corbanTabSwipe.carbonSegmentedControl?.setWidth(<#T##width: CGFloat##CGFloat#>, forSegmentAt: <#T##Int#>)
        // Do any additional setup after loading the view.
    }

    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else { return UIViewController() }
        
        switch index {
        case 0:
            Shared.shared.navTitle = itemControll[Int(index)]
            return storyboard.instantiateViewController(identifier: "ListViewController")
           
        case 1:
            Shared.shared.navTitle = itemControll[Int(index)]
            return storyboard.instantiateViewController(identifier: "ListViewController")
            
        case 2:
            Shared.shared.navTitle = itemControll[Int(index)]
            return storyboard.instantiateViewController(identifier: "ListViewController")
            
        case 3:
            Shared.shared.navTitle = itemControll[Int(index)]
            return storyboard.instantiateViewController(identifier: "ListViewController")
        default:
            return storyboard.instantiateViewController(identifier: "ListViewController")
        }
       
    }
    
    
}


