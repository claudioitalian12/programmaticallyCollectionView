//
//  ViewController.swift
//  programmaticallyCollectionView
//
//  Created by claudio Cavalli on 12/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenSize         = UIScreen.main.bounds
    var collectionView     : UICollectionView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setCollectionView()
    }

    
    func setCollectionView(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect(x: 0, y: screenSize.height / 10, width: screenSize.width , height: screenSize.height / 7), collectionViewLayout: flowLayout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
      
        
    }

}




extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       
            return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
      
            return cellTitle(collectionView: collectionView, indexPath: indexPath, category: "Title", titleNews: "subtitle", imageName: "Logo")
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
}




extension ViewController {
    
    func cellTitle(collectionView: UICollectionView,indexPath: IndexPath, category : String, titleNews: String, imageName: String) -> CollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        setCellAppear(cell: cell, indexPath: indexPath)
        setCategory(cell: cell, category: category)
        setTitleNews(cell: cell, titleNews: titleNews)
        setImageNamed(cell: cell, imageName: imageName)
        
        return cell
    }
    
    
    func setCellAppear(cell: CollectionViewCell, indexPath: IndexPath){
        cell.backgroundColor = UIColor.clear
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 5
 
        
    }
    
    func setCategory(cell : CollectionViewCell, category: String){
        
        cell.category.font = UIFont(name: "Kailasa", size: cell.frame.size.height / 10)
        
        cell.category.text = category
        
    }
    
    func setTitleNews(cell : CollectionViewCell, titleNews: String){
        
        
        cell.titleNews.font = UIFont(name: "Kailasa", size: cell.frame.size.height / 20)
        
        cell.titleNews.text = titleNews
        
    }
    
    func setImageNamed(cell : CollectionViewCell, imageName: String){
        
        cell.imageNamed.image = UIImage(named: imageName)
        
    }
    
    
}
