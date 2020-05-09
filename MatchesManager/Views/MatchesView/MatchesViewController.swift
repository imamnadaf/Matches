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
        // Do any additional setup after loading the view.
    }
    
    func displayMatchDetails(viewModel: MatchesDetails.Fetch.ViewModel) {
        debugPrint(viewModel.displayedDetails)
        displayMatchDetails = viewModel.displayedDetails
    }
}
