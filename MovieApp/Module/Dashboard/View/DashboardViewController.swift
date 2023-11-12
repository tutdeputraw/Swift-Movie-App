//
//  DashboardViewController.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import UIKit

class DashboardViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: TrendingMovieViewController())
        let vc2 = UINavigationController(rootViewController: SearchMovieViewController())
        let vc3 = UINavigationController(rootViewController: SavedMovieViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "square.and.arrow.down")
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Saved"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3], animated: true)
    }
}
