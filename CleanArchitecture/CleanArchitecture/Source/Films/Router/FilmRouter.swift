//
//  FilmRouter.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmRouter {
    
    class func createFilmViewController() -> FilmViewController {
        let presenter = FilmPresenter()
        let controller = FilmViewController(presenter: presenter)
        return controller
    }
    
}