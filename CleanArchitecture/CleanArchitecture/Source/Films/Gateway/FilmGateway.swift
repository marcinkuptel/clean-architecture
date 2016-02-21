//
//  FilmGateway.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmGateway {
    weak var interactor: FilmInteractor!
}

extension FilmGateway: FilmGatewayProtocol {
    func fetchNominatedFilms() {
        let films = [
            Film(title: "The Revenant", releaseDate: NSDate(timeIntervalSince1970: 1453370425)),
            Film(title: "The Martin", releaseDate: NSDate(timeIntervalSince1970: 1444338593)),
            Film(title: "The Big Short", releaseDate: NSDate(timeIntervalSince1970: 1454015393))
        ]
        interactor.fetchingNominatedFilmsSucceeded(films)
    }
}