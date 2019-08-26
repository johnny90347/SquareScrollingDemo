//
//  MainViewController.swift
//  SquareScrollingDemo
//
//  Created by 梁鑫文 on 2019/8/22.
//  Copyright © 2019 Johhny. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictrueWallArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        cell.timeSpacing = times[indexPath.item]
        cell.pictrueWall = pictrueWallArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    let times:[Double] = [3,5,7,4,3,6]
    
    let pictrueWallArray:[ PictureWall] = [
        PictureWall(photoOne: "p01", photoTwo: "p02", photoThree: "p03", title:"產品" ),
         PictureWall(photoOne: "l01", photoTwo: "l02", photoThree: "l03",title:"教育" ),
          PictureWall(photoOne: "n01", photoTwo: "n02", photoThree: "n03",title: "時事"),
           PictureWall(photoOne: "t01", photoTwo: "t02", photoThree: "t03",title: "旅遊"),
           PictureWall(photoOne: "m01", photoTwo: "m02", photoThree: "m03",title: "音樂"),
            PictureWall(photoOne: "talk01", photoTwo: "talk02", photoThree: "talk03",title: "演講")
        
       ]
    
    
    
    lazy var collectionview:UICollectionView = {
        let latout = UICollectionViewFlowLayout()
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: latout)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .white
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionview.register(Cell.self, forCellWithReuseIdentifier: "cell")

        view.addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -30).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        
    }
    

  

}
