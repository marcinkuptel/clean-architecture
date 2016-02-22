//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    //1.
    let presenter: FilmPresenter
    
    private var tableView: UITableView!
    private var films: [FilmDisplay] = []
    
    //2.
    init(presenter p: FilmPresenter){
        presenter = p
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //3.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        createAndAddTableView()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createAndAddTableView(){
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        view.addSubview(tableView)
        
        let left = tableView.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let top = tableView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 20)
        let bottom = tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        let right = tableView.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        NSLayoutConstraint.activateConstraints([top, left, bottom, right])
    }
}

extension FilmViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("filmCell")
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "filmCell")
        }
        
        let film = films[indexPath.row]
        cell?.textLabel?.text = film.title
        cell?.detailTextLabel?.text = film.releaseDate
        
        return cell!
    }
}

//4.
extension FilmViewController: FilmViewProtocol {
    func presentFilms(films: [FilmDisplay]) {
        self.films = films
        tableView.reloadData()
    }
}
