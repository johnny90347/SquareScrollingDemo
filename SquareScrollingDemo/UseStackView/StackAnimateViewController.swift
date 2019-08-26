//
//  StackAnimateViewController.swift
//  SquareScrollingDemo
//
//  Created by 梁鑫文 on 2019/8/26.
//  Copyright © 2019 Johhny. All rights reserved.
//

import UIKit

class StackAnimateViewController: UIViewController{
    
    

    let photoFrameView:UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.clipsToBounds = true
        return view
    }()
    
    let imageViewOne:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .yellow
        imageview.image = UIImage(named: "m01")
        return imageview
    }()
    
    let imageViewTwo:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .blue
        imageview.image = UIImage(named: "m02")
        return imageview
    }()
    
    let imageViewThree:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .red
        imageview.image = UIImage(named: "m03")
        return imageview
    }()
    var timer:Timer?
    var number = 0
    var pictureIndex = 1 //前三個用預設的 ,從1開始 是因為我把“圖片控制”放在一開始,而進入第一個if index = 2 ,而進入第二個if index = 3 ,index = 3是我們要的
    let pictureStrings = ["m01","m02","m03","p01","p02","p03"] //這個寫法不可以小於四筆資料
  
    @IBAction func buttonPressed(_ sender: UIButton) {
        
       
        
    }
    
    @objc func rotation(){
        
        //圖片控制
        if pictureIndex < pictureStrings.count - 1 {
            pictureIndex += 1
        }else{
            pictureIndex = 0
        }
        
        
        if self.number == 0{
            UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.imageViewOne.frame.size.height = 0
                self.imageViewOne.frame.origin.y = 150
                
                self.imageViewTwo.frame.origin.y = 0
                self.imageViewThree.frame.origin.y = -150
                
            }, completion: nil)

    
        }else if self.number == 1 {
            self.imageViewOne.frame.origin.y = -150
            self.imageViewOne.frame.size.height = 150
            self.imageViewOne.image = UIImage(named: pictureStrings[pictureIndex])
            
            UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.imageViewTwo.frame.size.height = 0
                self.imageViewTwo.frame.origin.y = 150
                
                self.imageViewThree.frame.origin.y = 0
            }, completion: nil)
           
        
        }else if self.number == 2 {
            self.imageViewTwo.frame.origin.y = -150
            self.imageViewTwo.frame.size.height = 150
            self.imageViewTwo.image = UIImage(named: pictureStrings[pictureIndex])
            
             UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.imageViewThree.frame.size.height = 0
                self.imageViewThree.frame.origin.y = 150
                
                self.imageViewOne.frame.origin.y = 0
            }, completion: nil)
            

        }else if self.number == 3{
            self.imageViewThree.frame.origin.y = -150
            self.imageViewThree.frame.size.height = 150
            self.imageViewThree.image = UIImage(named: pictureStrings[pictureIndex])
            
           UIView.animate(withDuration:3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.imageViewOne.frame.size.height = 0
                self.imageViewOne.frame.origin.y = 150
                
                self.imageViewTwo.frame.origin.y = 0
           }, completion: nil)
            
            number = 0
            

        }
        
        
        self.number += 1
        
     
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(rotation), userInfo: nil, repeats: true)
       
        
        view.addSubview(photoFrameView)
        photoFrameView.translatesAutoresizingMaskIntoConstraints = false
        photoFrameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoFrameView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        photoFrameView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoFrameView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        photoFrameView.addSubview(imageViewOne)
        photoFrameView.addSubview(imageViewTwo)
        photoFrameView.addSubview(imageViewThree)
        
        imageViewOne.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageViewTwo.frame = CGRect(x: 0, y: -150, width: 150, height: 150)
        imageViewThree.frame = CGRect(x: 0, y: -300, width: 150, height: 150)
    }
    
    
}
