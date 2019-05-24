//
//  BaseNavigationController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = UINavigationBar.appearance()

        //导航栏背景色
        navBar.barTintColor = UIColor.purple

        //导航栏标题颜色及大小
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: CGFloat(kNavgationBarTextSize))]

        //返回按钮 - 自定义颜色和图片
        navBar.tintColor = UIColor.white
        navBar.backIndicatorImage = UIImage.init(named: "me_statistical")
        navBar.backIndicatorTransitionMaskImage = UIImage.init(named: "me_statistical")
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        //返回按钮 - 返回上级页面不显示title
        let item = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
        super.pushViewController(viewController, animated: animated)
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
