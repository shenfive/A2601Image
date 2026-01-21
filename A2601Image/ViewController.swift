//
//  ViewController.swift
//  A2601Image
//
//  Created by Danny Shen on 2026/1/21.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var theCollectionView: UICollectionView!
    var images = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [UIImage(named: "image1"),
                  UIImage(named: "image2"),
                  UIImage(named: "image3"),
                  UIImage(named: "image4"),
                  UIImage(named: "image5")]
        theCollectionView.dataSource = self
        theCollectionView.delegate = self

        
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseID", for: indexPath) as! MyCollectionViewCell
        cell.theCellImageView.image = images[indexPath.row]
        return cell
    }
}

