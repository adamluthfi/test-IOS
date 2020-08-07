//
//  DetailViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var imageLike: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var labelPrice: UILabel!
    
    var product: ProductPromo?
    
    // MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
    }

    // MARK: - publics
    // Add public functions here

    // MARK: - IBActions
    // Add IBActions in this area
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
    }
    
    @IBAction func buyButton(_ sender: Any) {
        
    }
    
    // MARK: - Privates
    private func setupViews() {
        // TODO: Add setting up views here
        if let urlImage = product?.imageURL {
            guard let url = URL(string: urlImage) else { return  }
            imageDetail.kf.setImage(with: url)
        }
        
        if let likeIt = product?.loved {
            if likeIt == 1 {
                imageLike.image = UIImage(named: "ic_love_selected")
            } else {
                imageLike.image = UIImage(named: "ic_love_normal")
            }
        }
        
        if let title = product?.title {
            labelTitle.text = title
        }
        
        if let desc = product?.productPromoDescription {
            textDescription.text = desc
        }
        
        if let price = product?.price {
            labelPrice.text = price
        }
    }
}

// MARK: - View Protocol
extension DetailViewController: DetailViewProtocol {
    func populateData() {
        // TODO: Populate data
    }

    func showProgressDialog(show: Bool) {
        DispatchQueue.main.async {
            
        }
    }

    func showAlertMessage(title: String, message: String) {
        DispatchQueue.main.async {
            
        }
    }

    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            
        }
    }
}
