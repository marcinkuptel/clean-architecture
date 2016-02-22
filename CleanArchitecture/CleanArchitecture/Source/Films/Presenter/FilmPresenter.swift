//
//  FilmPresenter.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmPresenter
{
    //1.
    weak var view: FilmViewProtocol!
    private let router: FilmRouter
    private let interactor: FilmInteractor
    
    
    private static let dataFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd'-'MM'-'yyyy"
        return formatter
    }()
    
    //2.
    init(router r: FilmRouter, interactor i: FilmInteractor){
        router = r
        interactor = i
    }
    
    //3.
    func viewDidLoad(){
        interactor.fetchNominatedFilms()
    }
}

//4.
extension FilmPresenter: FilmPresenterProtocol
{
    func fetchingNominatedFilmsSucceeded(films: [Film])
    {
        let converted = films.map {
            FilmDisplay(
                title: $0.title,
                releaseDate:  FilmPresenter.dataFormatter.stringFromDate($0.releaseDate))
        }
        view.presentFilms(converted)
    }
    
    func fetchingNominatedFilmsFailed() {
        //TODO:
    }
}