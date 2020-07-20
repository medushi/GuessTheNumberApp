//
//  TabBar.swift
//  GuessTheNumberApp
//
//  Copyright © 2020 BM. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    var tabBarIteam = UITabBarItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.blue], for: .normal)
        
        let selectedImage1 = UIImage(named: "game-white")?.withRenderingMode(.alwaysOriginal)
        let deselectedImage1 = UIImage(named: "game-black")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = self.tabBar.items![0]
        tabBarIteam.image = deselectedImage1
        tabBarIteam.selectedImage = selectedImage1
        
        let selectedImage2 = UIImage(named: "leaderboard-white")?.withRenderingMode(.alwaysOriginal)
        let deselectedImage2 = UIImage(named: "leaderboard-black")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = self.tabBar.items![1]
        tabBarIteam.image = deselectedImage2
        tabBarIteam.selectedImage = selectedImage2
        
        
        let selectedImage3 = UIImage(named: "info-white")?.withRenderingMode(.alwaysOriginal)
        let deselectedImage3 = UIImage(named: "info-black")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = self.tabBar.items![2]
        tabBarIteam.image = deselectedImage3
        tabBarIteam.selectedImage = selectedImage3
        
        self.selectedIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
