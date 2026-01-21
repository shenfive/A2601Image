//
//  ImageViewController.swift
//  A2601Image
//
//  Created by Danny Shen on 2026/1/21.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theImage.image = image
        // Do any additional setup after loading the view.
    }

}
