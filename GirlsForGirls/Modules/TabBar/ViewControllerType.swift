//
//  ViewControllerType.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 23.02.2023.
//

import Foundation
import UIKit

enum ViewControllerType{
    case main
    case mentorship
    case store
    case profile
    
    var viewController: UIViewController{
        switch self {
        case .main:
            return MainViewController()
        case .mentorship:
            return MentorshipViewController()
        case .store:
            return StoreVIewController()
        case .profile:
            return ProfileViewController()
        }
    }
    
    var title: String{
        switch self {
        case .main:
            return "Главная"
        case .mentorship:
            return "Менторство"
        case .store:
            return "Магазин"
        case .profile:
            return "Профиль"
        }
    }
    
    var selectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "shome")?.withTintColor(UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)) ?? UIImage()
        case .mentorship:
            return UIImage(named: "umentors")?.withTintColor(UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)) ?? UIImage()
        case .store:
            return UIImage(named: "ucart")?.withTintColor(UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)) ?? UIImage()
        case .profile:
            return UIImage(named: "uprofile")?.withTintColor(UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)) ?? UIImage()
        }
    }
    
    var unSelectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "shome")?.withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)) ?? UIImage()
        case .mentorship:
            return UIImage(named: "umentors")?.withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)) ?? UIImage()
        case .store:
            return UIImage(named: "ucart")?.withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)) ?? UIImage()
        case .profile:
            return UIImage(named: "uprofile")?.withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)) ?? UIImage()
        }
    }
}
