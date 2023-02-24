//
//  TabBarController.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 22.02.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        setupViewControllers()
    }
    
    func setupTabBarAppearance(){
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .cyan
        self.tabBar.tintColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -0.5)
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.shadowRadius = 0
    }
    
    func setupViewControllers(){
        let viewControllers = [setupCurrentViewController(.main), setupCurrentViewController(.mentorship), setupCurrentViewController(.store), setupCurrentViewController(.profile)]
        self.setViewControllers(viewControllers, animated: true)
    }
    
    func setupCurrentViewController(_ viewControllerType: ViewControllerType) -> UIViewController{
        let vc = viewControllerType.viewController
        
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unSelectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage
        
        return vc
    }
}
