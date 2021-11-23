//
//  ProductViewCell.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 19/11/21.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageview: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    
    var cellViewModel: ProductsCellViewModel? {
        didSet {
            lblname.text = cellViewModel?.name
            lblprice.text = cellViewModel?.price
            cellViewModel?.setImage(imageView: productImageview)
        }
    }
}
