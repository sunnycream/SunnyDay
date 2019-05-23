//
//  MeViewController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static let cellID = "MeCell"

    lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    lazy var textArray: NSMutableArray = NSMutableArray()
    lazy var imageArray: NSMutableArray = NSMutableArray()
    lazy var headerView: UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MeCell.self, forCellReuseIdentifier: MeViewController.cellID)
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()//去掉多余分割线
        headerView.backgroundColor = UIColor.black

        view.addSubview(tableView)

        textArray.addObjects(from: ["统计", "账号", "设置"])
        imageArray.addObjects(from: ["me_statistical", "me_account", "me_setting"])
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MeCell = tableView.dequeueReusableCell(withIdentifier: MeViewController.cellID, for: indexPath) as! MeCell
        cell.icon.image = UIImage(named: imageArray.object(at: indexPath.row) as! String)
        cell.title.text = textArray.object(at: indexPath.row) as? String

        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)

        print("---------------点击了:\(indexPath.row)")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
