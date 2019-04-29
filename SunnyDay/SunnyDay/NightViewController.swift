//
//  NightViewController.swift
//  SunnyDay
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

let collectionViewCellID = "collectionViewCellID"
class NightViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    lazy var layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
    lazy var dataArray: NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellID)
        collectionView.backgroundColor = UIColor.white

        view.addSubview(collectionView)

        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellID, for: indexPath)
//        cell.backgroundColor = UIColor.red
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)

        return cell
    }

    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("YEAH~")
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
