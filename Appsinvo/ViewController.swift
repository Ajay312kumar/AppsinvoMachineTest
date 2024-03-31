//
//  ViewController.swift
//  Appsinvo
//
//  Created by Ajay Kumar on 29/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var nextPageController: UIPageControl!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var gridItemName = ["Saloon", "Retail", "Mails", "GYM", "Restaurant", "Saloon", "Retail", "Mails", "GYM", "Restaurant"]
    
    var gridImageName = ["saloon", "ic_retail", "mall", "vector_smart_object_1_2", "vector_smart_object_copy_3", "saloon", "ic_retail", "mall", "vector_smart_object_1_2", "vector_smart_object_copy_3"]
    
    var tutorialData = ["offer","offer","offer"]
    
   
        var currentPage = 0 {
            didSet {
                nextPageController.currentPage = currentPage
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        nextPageController.numberOfPages = tutorialData.count
        bottomView.layer.cornerRadius = 12
        bottomView.clipsToBounds = true
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let gridLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            gridLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
            let cellWidth = (screenWidth - 20) / 4 // Adjust spacing and width as needed
            gridLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            gridLayout.minimumInteritemSpacing = 0 // Adjust spacing between items
            gridLayout.minimumLineSpacing = 0 // Adjust spacing between rows
            gridCollectionView.collectionViewLayout = gridLayout
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myCollectionView {
            return tutorialData.count
        } else if collectionView == gridCollectionView {
            return gridItemName.count // Number of items for gridCollectionView
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == myCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
            return cell
        } else if collectionView == gridCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCollectionViewCell", for: indexPath) as! gridCollectionViewCell
            
            cell.gridName.text = "\(gridItemName[indexPath.item])"
            cell.gridImageView.image = UIImage(named: "\(gridImageName[indexPath.item])")
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == myCollectionView {
            return CGSize(width: collectionView.bounds.width, height: 500)
        } else if collectionView == gridCollectionView {
            return CGSize(width: gridCollectionView.bounds.width / 3, height: gridCollectionView.bounds.width / 3)
        }
        
        return CGSize.zero
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: "gridCollectionViewCell", for: indexPath as IndexPath) as! gridCollectionViewCell
            cell.layer.borderWidth = 0.5
            cell.frame.size.width = screenWidth / 3
            cell.frame.size.height = screenWidth / 3

            return cell
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == myCollectionView {
            let width = scrollView.frame.width
            let currentPage = Int((scrollView.contentOffset.x + width / 3) / width)
            nextPageController.currentPage = currentPage
        }
    }

}

