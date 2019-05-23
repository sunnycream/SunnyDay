//
//  MeCell.swift
//  SunnyDay
//
//  Created by admin on 2019/5/23.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MeCell: UITableViewCell {

//    lazy var icon: UIImageView = UIImageView()
//    lazy var title: UILabel = UILabel()

    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self .setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.addSubview(self.icon)
        self.icon.snp.makeConstraints { (make) in
//            make.width.height.equalTo(32)
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.left.equalTo(self).offset(20)
            make.centerY.equalTo(self)
        }

        self.addSubview(self.title)
        self.title.snp.makeConstraints { (make) in
            make.left.equalTo(self.icon.snp.right).offset(10)
            make.centerY.equalTo(self)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
