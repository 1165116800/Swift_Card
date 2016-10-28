//
//  CDViewCell.swift
//  Card_hjw
//
//  Created by hejianwu on 16/10/26.
//  Copyright © 2016年 ShopNC. All rights reserved.
//

import UIKit

class CDViewCell: UICollectionViewCell {
    
    let goodsImg = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    //cell的高度APPHEIGHT*3/7
    override  init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
        self.goodsImg.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.width)  //宽高相同
        let remainHeight =  CELL_HEIGHT - self.bounds.width
        nameLabel.frame = CGRect(x: 10, y: self.bounds.width, width: self.bounds.width-20, height: remainHeight*2/3)
        //nameLabel.backgroundColor = UIColor.red
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.numberOfLines = 2
        nameLabel.lineBreakMode = .byWordWrapping
        priceLabel.frame = CGRect(x: 10, y: self.bounds.width+remainHeight*2/3, width: self.bounds.width-20, height: remainHeight/3)
        //priceLabel.backgroundColor = UIColor.blue
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.textColor = UIColor.red
        self.addSubview(goodsImg)
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
