//
//  RecipesDetailViewController.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit

class RecipesDetailViewController: BaseWireFrame<ReceipesDetailViewModelProtocol>{

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
        bindRecipesDetail()
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
    
    private func bindRecipesDetail() {
        viewModel.output.$recepieDetail.receive(on: DispatchQueue.main).sink { [weak self] recipeData in
            guard let self = self else {return}
            let url = URL(string: recipeData?.image ?? "")
            recipeImage.kf.indicatorType = .activity
            recipeImage.kf.setImage(with: url)
            recipeName.text = recipeData?.name
            recipeDiscription.text = recipeData?.description
            caliroesLabel.text = "Calories: \(recipeData?.calories ?? "")"
            protenis.text = "Proteins: \(recipeData?.proteins ?? "")"
        }.store(in: &cancellable)
    }
}
