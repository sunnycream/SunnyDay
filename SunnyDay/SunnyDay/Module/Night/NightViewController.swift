//
//  NightViewController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class NightViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    static let cellID = "cellID"

    lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
    lazy var layout = UICollectionViewFlowLayout()
    lazy var dataArray: NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置代理
        collectionView.dataSource = self
        collectionView.delegate = self
        //注册
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NightViewController.cellID)
        //背景色
        collectionView.backgroundColor = UIColor.white
        //添加view
        view.addSubview(collectionView)

        //布局，默认vertical
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //复用cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NightViewController.cellID, for: indexPath)
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)

        return cell
    }

    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("YEAH~ \(indexPath.row)")
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    //cell大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (kScreenWidth - 5 * 20) / 4
        return  CGSize(width: width, height: width)
    }

    //上下左右间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
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
