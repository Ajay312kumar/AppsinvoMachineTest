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
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
        // Return the number of items based on the collection view
        if collectionView == myCollectionView {
            return 3 // Number of items for myCollectionView
        } else if collectionView == gridCollectionView {
            return 9 // Number of items for gridCollectionView
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return the appropriate cell based on the collection view
        
        if collectionView == myCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
            // Configure myCollectionViewCell
            return cell
        } else if collectionView == gridCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCollectionViewCell", for: indexPath) as! gridCollectionViewCell
            // Configure gridCollectionViewCell
            return cell
        }
        
        // Default return
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the size for items based on the collection view
        
        if collectionView == myCollectionView {
            // Return size for myCollectionView
            return CGSize(width: collectionView.bounds.width, height: 500)
        } else if collectionView == gridCollectionView {
            // Return size for gridCollectionView
            return CGSize(width: gridCollectionView.bounds.width / 3, height: gridCollectionView.bounds.width / 3)
        }
        
        // Default return
        return CGSize.zero
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: "gridCollectionViewCell", for: indexPath as IndexPath) as! gridCollectionViewCell
            cell.layer.borderWidth = 0.5
            cell.frame.size.width = screenWidth / 3
            cell.frame.size.height = screenWidth / 3

            return cell
        }
}

