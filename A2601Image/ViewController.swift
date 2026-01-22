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
        
        let nib = UINib(nibName: "MyImageCollectionViewCell", bundle: nil)
        theCollectionView.register(nib, forCellWithReuseIdentifier: "myImageCollectionViewCell")
        
        
        setCellLayout()
        
        
        
    }
    
    @IBAction func numberOfItemInLine(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            setCellLayout(number: 3)
        case 1:
            self.setCellLayout(number: 4)
        case 2:
            self.setCellLayout(number: 5)
        default:
            break
        }
        
    }
    
    
    
    func setCellLayout(number:Double = 3) {
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        // 建立 UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 5
        
        // 設置每個 cell 的尺寸
        layout.itemSize = CGSize(width: (fullScreenSize.width / number - 10.0),
                                 height: fullScreenSize.width / number - 10.0)
        theCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseID", for: indexPath) as! MyCollectionViewCell
//        cell.theCellImageView.image = images[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myImageCollectionViewCell", for: indexPath) as! MyImageCollectionViewCell
        cell.theImageView.image = images[indexPath.row]
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected\(indexPath)")
        
        let alert = UIAlertController(title: "提示", message: "放大嗎？", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "確定", style: .default, handler: { _ in
            print("確定")
            let nextVc = ImageViewController()
            nextVc.image = self.images[indexPath.row]
            self.present(nextVc, animated: true)
            
        }))
        present(alert, animated: true)
    }
}

