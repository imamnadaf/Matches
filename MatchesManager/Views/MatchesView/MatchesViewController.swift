//
//  MatchesViewController.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import UIKit

protocol MatchesDisplayProtocol {
    func displayMatchDetails(viewModel: MatchesDetails.Fetch.ViewModel)
    func displaySavedMatches(viewModel: MatchesDetails.Fetch.ViewModel)
}

class MatchesViewController: UIViewController, MatchesDisplayProtocol {
    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBarButton: UIButton!
    
    //MARK: Declaration
    var interactor: MatchesInteractorProtocol?
    var router: (MatchesRoutingProtocol & MatchesDataPassing)?
    
    var shouldShowSavedMatches: Bool = false
    
    var displayMatchDetails: [MatchesDetails.Fetch.ViewModel.DisplayMatchDetail] = []
    
    var savedMatchesIds: [String] = []
    //MARK: Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = MatchesInteractor()
        let presenter = MatchesPresenter()
        let router = MatchesRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureNavigationBar()
        addSlideMenu()
    }
    
    private func loadData() {
        if shouldShowSavedMatches {
            interactor?.getSavedMatches()
        } else {
            interactor?.getMatches()
        }
    }
    
    private func configureNavigationBar() {
        if shouldShowSavedMatches {
            self.title = "Saved Matches Details"
        } else {
            self.title = "Matches Details"
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addSlideMenu() {
        if revealViewController() != nil {
            revealViewController()?.rightViewRevealWidth = 100
            
            menuBarButton.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
        }
    }
    
    func displayMatchDetails(viewModel: MatchesDetails.Fetch.ViewModel) {
        displayMatchDetails = viewModel.displayedDetails
        tableView.reloadData()
    }
    
    func displaySavedMatches(viewModel: MatchesDetails.Fetch.ViewModel) {
        displayMatchDetails = viewModel.displayedDetails
        tableView.reloadData()
    }
}

extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayMatchDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let matchdetail = displayMatchDetails[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchcell", for: indexPath) as! MatchDetailTableViewCell
        //To DO: Move into Method
        cell.nameLabel.text = matchdetail.name
        cell.starButton.tag = indexPath.row
        cell.starButton.isSelected = matchdetail.isStarred
        cell.cellDelegate = self
        return cell
    }
}

extension MatchesViewController: MatchDetailTableViewCellDelegate {
    func didPressButton(_ tag: Int ) {
        let detail = displayMatchDetails[tag]
        if !detail.isStarred {
            interactor?.insert(id: detail.id, name: detail.name)
            detail.isStarred = true
        } else {
            detail.isStarred = false
            interactor?.delete(id: detail.id)
            if shouldShowSavedMatches {
                displayMatchDetails.remove(at: tag)
                tableView.deleteRows(at: [IndexPath(row: tag, section: 0)], with: .automatic)
            }
        }
    }
}

