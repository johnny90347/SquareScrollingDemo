//
//  Cell.swift
//  SquareScrollingDemo
//
//  Created by 梁鑫文 on 2019/8/22.
//  Copyright © 2019 Johhny. All rights reserved.
//

import UIKit


class Cell: UICollectionViewCell {
    
    
    var pictrueWall:PictureWall?{
        didSet{
            guard let pictrueWall = pictrueWall else { return }
            imageViewOne.image = UIImage(named: pictrueWall.photoOne)
            imageViewTwo.image = UIImage(named: pictrueWall.photoTwo)
            imageViewThree.image = UIImage(named: pictrueWall.photoThree)
            titleLabel.text = pictrueWall.title
        }
    }
    
    let titleLabel:UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.text = "國際"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let photoFrameView:UIView = {
        let view = UIView()
        view.backgroundColor = .green
                view.clipsToBounds = true
        return view
    }()
    
    
    let imageViewOne:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .yellow
//        imageview.image = UIImage(named: "p01")
        return imageview
    }()
    
    let imageViewTwo:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .blue
//        imageview.image = UIImage(named: "p02")
        return imageview
    }()
    
    let imageViewThree:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .red
//        imageview.image = UIImage(named: "p03")
        return imageview
    }()
    
    var number = 0 //跑邏輯用的
    
    var time:Timer?   //離開頁面記得要關掉timer 這邊沒寫到
    
    var timeSpacing:Double? { //收到間隔時間後,在設定timer
        didSet{
              time = Timer.scheduledTimer(timeInterval:timeSpacing!, target: self, selector: #selector(scrollImage), userInfo:nil , repeats: true)
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        setupConstraint()
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func scrollImage(){
        
        if number == 0{
            UIView.animate(withDuration: 2) {
                self.imageViewOneHeightConstraint.constant = 0
                self.layoutIfNeeded()
            }
            imageviewTwoBottomConstraintOne.isActive = false
            imageviewTwoBottomConstraintTwo.isActive = true
            
        }else if number == 1{
            
            
            
            UIView.animate(withDuration: 2) {
                self.imageViewTwoHeightConstraint.constant = 0
                self.layoutIfNeeded()
            }
            
            imageviewThreeBottomConstraintOne.isActive = false
            imageviewThreeBottomConstraintTwo.isActive = true
            
            imageviewOneBottomConstraintOne.isActive = false
            imageviewOneBottomConstraintTwo.isActive = true
            imageViewOneHeightConstraint.constant = 150
            
        }else if number == 2{
            
            
            
            UIView.animate(withDuration: 2) {
                self.imageViewThreeHeightConstraint.constant = 0
                self.layoutIfNeeded()
            }
            
            
            imageviewOneBottomConstraintOne.isActive = true
            imageviewOneBottomConstraintTwo.isActive = false
            
            imageviewTwoBottomConstraintTwo.isActive = false
            imageviewTwoBottomConstraintOne.isActive = true
            imageViewTwoHeightConstraint.constant = 150
            
            
            
        }else if number == 3{
            
            
            UIView.animate(withDuration: 2) {
                self.imageViewOneHeightConstraint.constant = 0
                self.layoutIfNeeded()
            }
            
            
            imageviewThreeBottomConstraintTwo.isActive = false
            imageviewThreeBottomConstraintOne.isActive = true
            imageViewThreeHeightConstraint.constant = 150
            
            imageviewTwoBottomConstraintOne.isActive = false
            imageviewTwoBottomConstraintTwo.isActive = true
            number = 0
            
        }
        
        number += 1
        
    }
    
    
    
    var imageViewOneHeightConstraint:NSLayoutConstraint!
    var imageViewTwoHeightConstraint:NSLayoutConstraint!
    var imageViewThreeHeightConstraint:NSLayoutConstraint!
    
    var imageviewOneBottomConstraintOne:NSLayoutConstraint!
    var imageviewOneBottomConstraintTwo:NSLayoutConstraint!
    
    var imageviewTwoBottomConstraintOne:NSLayoutConstraint!
    var imageviewTwoBottomConstraintTwo:NSLayoutConstraint!
    
    var imageviewThreeBottomConstraintOne:NSLayoutConstraint!
    var imageviewThreeBottomConstraintTwo:NSLayoutConstraint!
    
    
    private func setupConstraint(){
        self.addSubview(photoFrameView)
        photoFrameView.addSubview(imageViewOne)
        photoFrameView.addSubview(imageViewTwo)
        photoFrameView.addSubview(imageViewThree)
        self.addSubview(titleLabel)
        
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        
        
        
        
        photoFrameView.translatesAutoresizingMaskIntoConstraints = false
        photoFrameView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoFrameView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        photoFrameView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        photoFrameView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        imageViewOne.widthAnchor.constraint(equalTo: photoFrameView.widthAnchor).isActive = true
        imageViewOneHeightConstraint = imageViewOne.heightAnchor.constraint(equalToConstant: 150)
        imageViewOneHeightConstraint.isActive = true
        imageViewOne.leadingAnchor.constraint(equalTo: photoFrameView.leadingAnchor).isActive = true
        imageviewOneBottomConstraintOne = imageViewOne.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor)
        imageviewOneBottomConstraintOne.isActive = true
        imageviewOneBottomConstraintTwo = imageViewOne.bottomAnchor.constraint(equalTo: imageViewThree.topAnchor)
        imageviewOneBottomConstraintTwo.isActive = false
        
        
        imageViewOne.trailingAnchor.constraint(equalTo: photoFrameView.trailingAnchor).isActive = true
        
        
        
        
        
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        imageViewTwo.widthAnchor.constraint(equalTo: photoFrameView.widthAnchor).isActive = true
        imageViewTwoHeightConstraint = imageViewTwo.heightAnchor.constraint(equalToConstant: 150)
        imageViewTwoHeightConstraint.isActive = true
        imageViewTwo.leadingAnchor.constraint(equalTo: photoFrameView.leadingAnchor).isActive = true
        imageViewTwo.trailingAnchor.constraint(equalTo: photoFrameView.trailingAnchor).isActive = true
        imageviewTwoBottomConstraintOne = imageViewTwo.bottomAnchor.constraint(equalTo: imageViewOne.topAnchor)
        imageviewTwoBottomConstraintOne.isActive = true
        imageviewTwoBottomConstraintTwo = imageViewTwo.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor)
        imageviewTwoBottomConstraintTwo.isActive = false
        
        
        
        
        
        imageViewThree.translatesAutoresizingMaskIntoConstraints = false
        imageViewThree.widthAnchor.constraint(equalTo: photoFrameView.widthAnchor).isActive = true
        imageViewThreeHeightConstraint = imageViewThree.heightAnchor.constraint(equalToConstant: 150)
        imageViewThreeHeightConstraint.isActive = true
        imageViewThree.leadingAnchor.constraint(equalTo: photoFrameView.leadingAnchor).isActive = true
        imageViewThree.trailingAnchor.constraint(equalTo: photoFrameView.trailingAnchor).isActive = true
        imageviewThreeBottomConstraintOne =  imageViewThree.bottomAnchor.constraint(equalTo: imageViewTwo.topAnchor)
        imageviewThreeBottomConstraintOne.isActive = true
        imageviewThreeBottomConstraintTwo =  imageViewThree.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor)
        imageviewThreeBottomConstraintTwo.isActive = false
        
        
        
        
    }
    

    
    
}
