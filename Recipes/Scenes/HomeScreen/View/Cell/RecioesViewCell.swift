//
//  RecioesViewCell.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit

class RecioesViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recipesImage: UIImageView!
    @IBOutlet weak var recipesName: UILabel!
    @IBOutlet weak var recipesCarp: UILabel!
    
    static let cellID = "RecioesViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
