//
//  ProductsCellViewModel.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 23/11/21.
//

import Foundation
import UIKit

struct ProductsCellViewModel {
    let id : String?
    let name : String?
    let price : String?
    let image : String?
    
    func setImage(imageView: UIImageView) {
        imageView.sd_setImage(with: URL(string: (image ?? "")))
    }
}
