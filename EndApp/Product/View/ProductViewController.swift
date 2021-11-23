//
//  ViewController.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 19/11/21.
//

import UIKit
import SDWebImage



class ProductViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "ProductCell"
    
    lazy var viewModel = {
        return ProductsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "NEW THIS WEEK"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.getProducts(success: { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }, failure: { error in
            DispatchQueue.main.async {
                self.showLoadingError(title:"Loading Failure", message: error.localizedDescription)
            }
        })
    }
    
    
    func showLoadingError(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource
extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.productCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let offset: CGFloat = 5.0
        let width = self.view.frame.width/2 - offset
        return CGSize(width: width, height: width*1.50)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                "ProductCell", for: indexPath) as? ProductViewCell  else {
            
            let cell = UICollectionViewCell()
            
            return cell
        }
        let cellViewModel = viewModel.getProductCellViewModel(at: indexPath)
        cell.cellViewModel = cellViewModel
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        detailVC.setUI = viewModel.getProduct(at: indexPath)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
