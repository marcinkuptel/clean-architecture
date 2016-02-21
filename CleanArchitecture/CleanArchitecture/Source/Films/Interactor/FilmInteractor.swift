//
//  FilmInteractor.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmInteractor {
    weak var presenter: FilmPresenterProtocol!
    private let gateway: FilmGatewayProtocol
    
    init(gateway g: FilmGatewayProtocol){
        gateway = g
    }
    
    func fetchNominatedFilms(){
        gateway.fetchNominatedFilms()
    }
    
    func fetchingNominatedFilmsSucceeded(films: [Film]){
        presenter.fetchingNominatedFilmsSucceeded(films)
    }
    
    func fetchingNominatedFilmsFailed(){
        presenter.fetchingNominatedFilmsFailed()
    }
}