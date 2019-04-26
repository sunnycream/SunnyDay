//
//  BaseTabBarViewController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildControllers()

        let tabBarItem = UITabBarItem.appearance()
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.init(name: "Marker Felt", size: CGFloat(kTabBarTextSize))!], for: UIControl.State.normal)

        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.purple, NSAttributedString.Key.font: UIFont.init(name: "Marker Felt", size: CGFloat(kTabBarTextSize))!], for: UIControl.State.selected)
    }

    func addChildControllers() {
        self.setChildControllers(viewController: DayViewController(), title: "Day", normalImage: UIImage.init(named: "tab_bar_day_normal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tab_bar_day_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))

        self.setChildControllers(viewController: NightViewController(), title: "Night", normalImage: UIImage.init(named: "tab_bar_night_normal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tab_bar_night_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))

        self.setChildControllers(viewController: MeViewController(), title: "Me", normalImage: UIImage.init(named: "tab_bar_me_normal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tab_bar_me_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
    }

    func setChildControllers(viewController: UIViewController?, title: NSString?, normalImage :UIImage?, selectedImage: UIImage?) {
        let nav = BaseNavigationController.init(rootViewController: (viewController ?? nil)!)

        nav.tabBarItem.title = (title! as String)
        nav.tabBarItem.image = normalImage
        nav.tabBarItem.selectedImage = selectedImage

        viewController?.title = title! as String

        self.addChild(nav)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
