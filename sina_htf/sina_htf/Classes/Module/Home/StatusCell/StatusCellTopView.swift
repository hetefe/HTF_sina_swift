//
//  StatusCellTopView.swift
//  sina_htf
//
//  Created by 赫腾飞 on 15/12/18.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class StatusCellTopView: UIView {

    override init(frame:CGRect) {
    
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //自定义顶部视图
    private func setupUI(){
    
        //头像 title VIP  time  where
        addSubview(iconImage)
        addSubview(nameLable)
        addSubview(mbrankImage)
        addSubview(verified_type_image)
        addSubview(timeLable)
        addSubview(sourceLable)
        addSubview(contentLable)
        //添加对应的约束
        iconImage.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_left).offset(StatusCellMarigin)
            make.top.equalTo(self.snp_top).offset(StatusCellMarigin)
            make.size.equalTo(CGSize(width: StatusCellHeadIMageWidth, height: StatusCellHeadIMageWidth))
        }
        nameLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconImage.snp_top)
            make.left.equalTo(iconImage.snp_right).offset(StatusCellMarigin)
        }
        mbrankImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameLable.snp_top)
            make.left.equalTo(nameLable.snp_right).offset(StatusCellMarigin)
        }
        verified_type_image.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(iconImage.snp_right)
            make.centerY.equalTo(iconImage.snp_bottom)
        }
        timeLable.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconImage.snp_bottom)
            make.left.equalTo(iconImage.snp_right).offset(StatusCellMarigin)
        }
        sourceLable.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconImage.snp_bottom)
            make.left.equalTo(timeLable.snp_right).offset(StatusCellMarigin)
        }
        contentLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconImage.snp_bottom).offset(StatusCellMarigin)
            make.left.equalTo(self.snp_left).offset(StatusCellMarigin)
            
            
        }
        
        
    }
//MARK:- 懒加载所有的子视图
    private lazy var iconImage: UIImageView = UIImageView(image: UIImage(named: "avatar_default_big"))
    private lazy var nameLable: UILabel = UILabel(title: "你是sb", color: themeColor, fontSize: 14)
    private lazy var mbrankImage: UIImageView = UIImageView(image: UIImage(named: "common_icon_membership"))
    private lazy var verified_type_image = UIImageView(image: UIImage(named: "avatar_vip"))
    private lazy var timeLable: UILabel = UILabel(title: "20分钟前", color: themeColor, fontSize: 10)
    private lazy var sourceLable: UILabel = UILabel(title: "一点资讯", color: themeColor, fontSize: 10)
    private lazy var contentLable: UILabel = UILabel(title: "炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒炸鸡啤酒", color: UIColor.darkGrayColor(), fontSize: 14,margin: StatusCellMarigin)
    
    
    
    
}
