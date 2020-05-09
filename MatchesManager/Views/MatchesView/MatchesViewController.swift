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
}

class MatchesViewController: UIViewController, MatchesDisplayProtocol {
    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Declaration
    var interactor: MatchesInteractorProtocol?
    var router: (MatchesRoutingProtocol & MatchesDataPassing)?
    
    var displayMatchDetails: [MatchesDetails.Fetch.ViewModel.DisplayMatchDetail] = []
    
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
        interactor?.getMatches()
        self.title = "Matches Details"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func displayMatchDetails(viewModel: MatchesDetails.Fetch.ViewModel) {
        debugPrint(viewModel.displayedDetails)
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
        detail.isStarred = !detail.isStarred
    }
}

