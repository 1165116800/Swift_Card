//
//  ViewController.swift
//  Card_hjw
//
//  Created by hejianwu on 16/10/26.
//  Copyright © 2016年 ShopNC. All rights reserved.
//

import UIKit

//屏幕的高
let APP_FRAME_HEIGHT : CGFloat! = UIScreen.main.bounds.height
//屏幕的宽
let APP_FRAME_WIDTH : CGFloat = UIScreen.main.bounds.width
//layout上下距离
let LAYOUT_LEFTORRIGHT_WIDTH : CGFloat = (APP_FRAME_WIDTH-40)/5 + 20
let CELL_WIDTH : CGFloat = (APP_FRAME_WIDTH-40)*3/5
let CELL_HEIGHT : CGFloat = APP_FRAME_HEIGHT*3/7


class ViewController: UIViewController{
    
    var data = [String]()
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgview = UIImageView(frame: CGRect(x: 0, y: 0, width: APP_FRAME_WIDTH, height: CELL_HEIGHT+60))
        bgview.isUserInteractionEnabled = true
        bgview.image = UIImage(named: "bg_xh.jpg")
        self.view.addSubview(bgview)
        let desLabel = UILabel(frame: CGRect(x: 0, y: 25, width: APP_FRAME_WIDTH, height: 14))
        desLabel.text = "我的足迹（1 / 13）"
        desLabel.textAlignment = .center
        desLabel.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(desLabel)
        data = ["test.jpg","test.jpg","test.jpg","test.jpg","test.jpg","test.jpg","test.jpg","test.jpg","test.jpg","test.jpg"]
        let layout = CDFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20.0
        layout.sectionInset = UIEdgeInsetsMake(0, LAYOUT_LEFTORRIGHT_WIDTH, 0, LAYOUT_LEFTORRIGHT_WIDTH)
        layout.itemSize = CGSize(width: CELL_WIDTH, height: CELL_HEIGHT)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 50, width: APP_FRAME_WIDTH, height: CELL_HEIGHT), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CDViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(CDViewCell.self))
        collectionView.reloadData()
        bgview.addSubview(self.collectionView)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    //UICollectionView代理方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CDViewCell.self), for: indexPath) as! CDViewCell
        let row = indexPath.row
        cell.goodsImg.image = UIImage(named: data[row])
        cell.nameLabel.text = "韩国零食大礼包送女友"
        cell.priceLabel.text = "￥89.00"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击图片\(indexPath.row)")
    }
    
}

