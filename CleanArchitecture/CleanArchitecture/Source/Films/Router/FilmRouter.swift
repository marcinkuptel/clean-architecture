//
//  FilmRouter.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmRouter {
    
    weak var controller: FilmViewController!
    
    class func createFilmViewController() -> FilmViewController {
        let router = FilmRouter()
        let interactor = FilmInteractor()
        let presenter = FilmPresenter(router: router, interactor: interactor)
        interactor.presenter = presenter
        let controller = FilmViewController(presenter: presenter)
        presenter.view = controller
        router.controller = controller
        return controller
    }
    
}