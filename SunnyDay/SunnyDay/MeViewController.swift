//
//  MeViewController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let cellID = "MeCell"

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()//去掉多余分割线
        tableView.tableHeaderView = headerView
        view.addSubview(tableView)

        return tableView
    }()

    private var textArray: NSMutableArray {
//        let array = NSArray(array: ["统计", "账号", "设置"])
//        let textArray = NSMutableArray(array: array)

        let textArray = NSMutableArray()
        textArray.addObjects(from: ["统计", "账号", "设置"])

        return textArray
    }

    private var imageArray: NSMutableArray {
//        let array = NSArray(array: ["me_statistical", "me_account", "me_setting"])
//        let imageArray = NSMutableArray(array: array)

        let imageArray = NSMutableArray()
        imageArray.addObjects(from: ["me_statistical", "me_account", "me_setting"])

        return imageArray
    }

    private lazy var headerView: UIView = {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 100))
        headerView.backgroundColor = UIColor.black
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //注册
        tableView.register(MeCell.self, forCellReuseIdentifier: cellID)
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MeCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MeCell
        cell.icon.image = UIImage(named: imageArray.object(at: indexPath.row) as! String)
        cell.title.text = textArray.object(at: indexPath.row) as? String

        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)

        print("---------------点击了:\(indexPath.row)")

        if indexPath.row == 2 {
            let settingVC = SettingViewController()
            self.navigationController?.pushViewController(settingVC, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.red
        
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
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
