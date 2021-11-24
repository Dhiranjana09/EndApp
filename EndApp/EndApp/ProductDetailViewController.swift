//
//  ProductDetailViewController.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 22/11/21.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.setUIData()
        
        // Do any additional setup after loading the view.
    }
    
    func setUIData(){
        lblName.text = product?.name
        lblPrice.text = product?.price
        productImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        productImageView.sd_setImage(with: URL(string: product?.image ?? "")) { (image, error, cache, urls) in
            if (error != nil) {
                // Failed to load image
                self.productImageView.image = UIImage(named: "ico_placeholder")
            } else {
                // Successful in loading image
                self.productImageView.image = image
            }
        }
    }
}
