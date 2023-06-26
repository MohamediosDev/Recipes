//
//  HomeViewController.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var recipesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


  
}

extension HomeViewController: UITableViewDelegate , UITableViewDataSource {

    private func setupTableView() {
        recipesTableView.delegate = self
        recipesTableView.dataSource = self
        recipesTableView.register(UINib(nibName: RecioesViewCell.cellID, bundle: nil), forCellReuseIdentifier: RecioesViewCell.cellID)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipesTableView.dequeueReusableCell(withIdentifier: RecioesViewCell.cellID, for: indexPath) as! RecioesViewCell
        
        return cell
    }
}
