//
//  ViewController.swift
//  A2601Image
//
//  Created by Danny Shen on 2026/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theImagView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "a001", ofType: "jpg"){
            theImagView.image = UIImage.init(contentsOfFile: path)
        }
        
    }


}

