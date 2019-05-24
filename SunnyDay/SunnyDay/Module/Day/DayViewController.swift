//
//  DayViewController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import DNSPageView//为什么pch里的调用不到

class DayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Day"

        setupDNSPageView()
    }

    func setupDNSPageView() {
        let style = DNSPageStyle()
        style.isTitleViewScrollEnabled  = true
        style.isTitleScaleEnabled = true
        style.isShowBottomLine = true
        style.titleColor = UIColor.gray
        style.titleSelectedColor = UIColor.red
        style.bottomLineColor = UIColor.red

//        let titles = ["路飞", "索隆", "娜美", "山治", "乌索普", "乔巴", "罗宾", "弗兰奇", "布鲁克", "甚平"]
        let titles = ["路飞", "索隆", "娜美"]

        let childViewControllers: [UIViewController] = [LuffyViewController(), ZoroViewController(), NamiViewController()]
        for vc in childViewControllers {
            addChild(vc)
        }

        let y = kStatsBarHeight + (navigationController?.navigationBar.frame.height ?? 0)

        let pageView = DNSPageView(frame: CGRect(x: 0, y: y, width: kScreenWidth, height: kScreenHeight), style: style, titles: titles, childViewControllers: childViewControllers)
        view.addSubview(pageView)
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
