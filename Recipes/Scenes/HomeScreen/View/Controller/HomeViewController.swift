//
//  HomeViewController.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit

class HomeViewController: BaseWireFrame<HomeViewModelProtocol> {

    //MARK: -> Outlet
    @IBOutlet weak var recipesTableView: UITableView!
    
    //MARK: -> Properties
    private let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        viewModel.viewModelDidload()
        bindRecipesData()
    }
    
    private func setupUI() {
        title = "Recipes"
        navigationItem.searchController = searchController
    }
    
    
    private func bindRecipesData() {
        viewModel.output.recipes.receive(on: DispatchQueue.main).sink { [weak self] value in
            guard let self = self else {return}
            recipesTableView.reloadData()
        }.store(in: &cancellable)
    }
    


  
}

extension HomeViewController: UITableViewDelegate , UITableViewDataSource {

    private func setupTableView() {
        recipesTableView.delegate = self
        recipesTableView.dataSource = self
        recipesTableView.register(UINib(nibName: RecioesViewCell.cellID, bundle: nil), forCellReuseIdentifier: RecioesViewCell.cellID)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.recipes.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipesTableView.dequeueReusableCell(withIdentifier: RecioesViewCell.cellID, for: indexPath) as! RecioesViewCell
        cell.configureCell(model: viewModel.output.recipes.value[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Is Select")
    }
}
