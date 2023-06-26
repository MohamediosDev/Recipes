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
    private let progressHUD = ProgressHUD(text: "Loading...")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        handleViewStates()
        setupSearchController()
        viewModel.viewModelDidload()
        bindRecipesData()
    }
    
    private func setupUI() {
        title = "Recipes"
        navigationItem.searchController = searchController
    }
    
    private func bindRecipesData() {
        viewModel.output.$filterRecipes.receive(on: DispatchQueue.main).sink { [weak self] value in
            guard let self = self else {return}
            if value.isEmpty {
                let textLabel = UILabel()
                textLabel.text = "No Data To Show"
                textLabel.textAlignment = .center
                recipesTableView.backgroundView = textLabel
            } else {
                recipesTableView.backgroundView = nil
            }
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
        return viewModel.output.filterRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipesTableView.dequeueReusableCell(withIdentifier: RecioesViewCell.cellID, for: indexPath) as! RecioesViewCell
        cell.configureCell(model: viewModel.output.filterRecipes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Is Select")
    }
}


extension HomeViewController: UISearchResultsUpdating {
 
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        print(searchText)
        self.viewModel.input.searchPublisher.send(searchText)
    }
}

extension HomeViewController {
    fileprivate func handleViewStates() {
        viewModel.output.viewStatesPublisher.receive(on: DispatchQueue.main).sink { [weak self] states in
            guard let self = self else {return}
            switch states {
            case .showHud:
                view.addSubview(progressHUD)
            case .stopHud:
                progressHUD.hide()
            default:
                break
            }
        }.store(in: &cancellable)
    }
}
