//
//  FilmPresenter.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmPresenter {
    weak var view: FilmViewProtocol!
    private let router: FilmRouter
    private let interactor: FilmInteractor
    
    init(router r: FilmRouter, interactor i: FilmInteractor){
        router = r
        interactor = i
    }
}

extension FilmPresenter: FilmPresenterProtocol {
    
}