//
//  RecipesDetailViewController.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit

class RecipesDetailViewController: UIViewController {

    //MARK: -> Outlet
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDiscription: UILabel!
    @IBOutlet weak var caliroesLabel: UILabel!
    @IBOutlet weak var protenis: UILabel!
    
    //MARK: -> Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: -> Methods
    private func setupUI() {
        let favouriteImage = UIImageView(image: UIImage(systemName: "heart.fill"))
        favouriteImage.tintColor = .red
        navigationItem.rightBarButtonItem?.tintColor = .red
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: favouriteImage.image, style:.plain, target: self, action: #selector(didTapFavouriteButton))
    }

    @objc func didTapFavouriteButton() {
        
    }
}
