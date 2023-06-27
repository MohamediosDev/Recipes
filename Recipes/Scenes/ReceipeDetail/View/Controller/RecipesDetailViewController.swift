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
        let favouriteImage = UIImageView(image: UIImage(systemName: viewModel.getFavourtiesData() ? "heart.fill" : "heart"))
        favouriteImage.tintColor = .red
        navigationItem.rightBarButtonItem?.tintColor = .red
        navigationController?.navigationBar.tintColor = .red
        let barButton = UIBarButtonItem(image: favouriteImage.image, style:.plain, target: self, action: #selector(didTapFavouriteButton))
        navigationItem.rightBarButtonItem = barButton

    }

    @objc func didTapFavouriteButton(tapButton: UIBarButtonItem) {
        let selectedImage = UIImage(systemName: "heart.fill")
        let  image = UIImage(systemName: "heart")
        if viewModel.getFavourtiesData() {
            tapButton.image = image
            viewModel.addRecipesToFavourtie(isFavourite: false)
        } else {
            viewModel.addRecipesToFavourtie(isFavourite: true)
            tapButton.image = selectedImage
        }
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
