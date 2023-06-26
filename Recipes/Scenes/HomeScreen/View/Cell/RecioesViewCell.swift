//
//  RecioesViewCell.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit
import Kingfisher
import Cosmos

class RecioesViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recipesImage: UIImageView!
    @IBOutlet weak var recipesName: UILabel!
    @IBOutlet weak var recipesCarp: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var loveButton: UIButton!
    
    static let cellID = "RecioesViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: RecipesModelElement) {
        let url = URL(string: model.image)
        recipesImage.kf.indicatorType = .activity
        recipesImage.kf.setImage(with: url)
        recipesName.text = model.name
        recipesCarp.text = "Carb: \(model.carbos)"
        rateView.rating = model.rating ?? 0.0
        rateView.isUserInteractionEnabled = false
    }
    @IBAction func didTapLoveButton(_ sender: Any) {
        print("LLOVE BUTTTON")
    }
    
}
