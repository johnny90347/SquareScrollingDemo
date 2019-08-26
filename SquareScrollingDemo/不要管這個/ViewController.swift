//
//  ViewController.swift
//  SquareScrollingDemo
//
//  Created by 梁鑫文 on 2019/8/22.
//  Copyright © 2019 Johhny. All rights reserved.
//

import UIKit






class ViewController: UIViewController {

    
    
    
    
    
    let photoFrameView:UIView = {
       let view = UIView()
        view.backgroundColor = .green
//        view.clipsToBounds = true
        return view
    }()
    
    
    let imageViewOne:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .yellow
        imageview.image = UIImage(named: "1")
        return imageview
    }()
    
    let imageViewTwo:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .blue
         imageview.image = UIImage(named: "2")
        return imageview
    }()
    
    let imageViewThree:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .red
         imageview.image = UIImage(named: "3")
        return imageview
    }()
    
    var number = 0
    
    var time:Timer?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupConstraint()
        
        time = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollImage), userInfo:nil , repeats: true)
        
    }
    
    
    @objc func scrollImage(){
        
        if number == 0{
            UIView.animate(withDuration: 2) {
                self.imageViewOneHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            imageviewTwoBottomConstraintOne.isActive = false
            imageviewTwoBottomConstraintTwo.isActive = true
            
        }else if number == 1{
            
            
            
            UIView.animate(withDuration: 2) {
                self.imageViewTwoHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            
            imageviewThreeBottomConstraintOne.isActive = false
            imageviewThreeBottomConstraintTwo.isActive = true
            
            imageviewOneBottomConstraintOne.isActive = false
            imageviewOneBottomConstraintTwo.isActive = true
            imageViewOneHeightConstraint.constant = 200
            
        }else if number == 2{
            
            
            
            UIView.animate(withDuration: 2) {
                self.imageViewThreeHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            
            
            imageviewOneBottomConstraintOne.isActive = true
            imageviewOneBottomConstraintTwo.isActive = false
            
            imageviewTwoBottomConstraintTwo.isActive = false
            imageviewTwoBottomConstraintOne.isActive = true
            imageViewTwoHeightConstraint.constant = 200
            
            
            
        }else if number == 3{
            
            
            UIView.animate(withDuration: 2) {
                self.imageViewOneHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            
            
            imageviewThreeBottomConstraintTwo.isActive = false
            imageviewThreeBottomConstraintOne.isActive = true
            imageViewThreeHeightConstraint.constant = 200
            
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
        view.addSubview(photoFrameView)
        photoFrameView.addSubview(imageViewOne)
        photoFrameView.addSubview(imageViewTwo)
        photoFrameView.addSubview(imageViewThree)
        
        photoFrameView.translatesAutoresizingMaskIntoConstraints = false
        photoFrameView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        photoFrameView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        photoFrameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoFrameView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        imageViewOne.widthAnchor.constraint(equalTo: photoFrameView.widthAnchor).isActive = true
        imageViewOneHeightConstraint = imageViewOne.heightAnchor.constraint(equalToConstant: 200)
        imageViewOneHeightConstraint.isActive = true
        imageViewOne.leadingAnchor.constraint(equalTo: photoFrameView.leadingAnchor).isActive = true
        imageviewOneBottomConstraintOne = imageViewOne.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor)
        imageviewOneBottomConstraintOne.isActive = true
        imageviewOneBottomConstraintTwo = imageViewOne.bottomAnchor.constraint(equalTo: imageViewThree.topAnchor)
        imageviewOneBottomConstraintTwo.isActive = false
        
        
        imageViewOne.trailingAnchor.constraint(equalTo: photoFrameView.trailingAnchor).isActive = true
        
        
        
        
        
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        imageViewTwo.widthAnchor.constraint(equalTo: photoFrameView.widthAnchor).isActive = true
        imageViewTwoHeightConstraint = imageViewTwo.heightAnchor.constraint(equalToConstant: 200)
        imageViewTwoHeightConstraint.isActive = true
        imageViewTwo.leadingAnchor.constraint(equalTo: photoFrameView.leadingAnchor).isActive = true
        imageViewTwo.trailingAnchor.constraint(equalTo: photoFrameView.trailingAnchor).isActive = true
        imageviewTwoBottomConstraintOne = imageViewTwo.bottomAnchor.constraint(equalTo: imageViewOne.topAnchor)
        imageviewTwoBottomConstraintOne.isActive = true
        imageviewTwoBottomConstraintTwo = imageViewTwo.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor)
        imageviewTwoBottomConstraintTwo.isActive = false
        
        
        
        
        
        imageViewThree.translatesAutoresizingMaskIntoConstraints = false
        imageViewThree.widthAnchor.constraint(equalTo: photoFrameView.widthAnchor).isActive = true
        imageViewThreeHeightConstraint = imageViewThree.heightAnchor.constraint(equalToConstant: 200)
        imageViewThreeHeightConstraint.isActive = true
        imageViewThree.leadingAnchor.constraint(equalTo: photoFrameView.leadingAnchor).isActive = true
        imageViewThree.trailingAnchor.constraint(equalTo: photoFrameView.trailingAnchor).isActive = true
        imageviewThreeBottomConstraintOne =  imageViewThree.bottomAnchor.constraint(equalTo: imageViewTwo.topAnchor)
        imageviewThreeBottomConstraintOne.isActive = true
        imageviewThreeBottomConstraintTwo =  imageViewThree.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor)
        imageviewThreeBottomConstraintTwo.isActive = false
        
        
        
        
    }


}

