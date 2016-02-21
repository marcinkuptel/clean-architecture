//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    let presenter: FilmPresenter
    private var tableView: UITableView!
    
    init(presenter p: FilmPresenter){
        presenter = p
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let top = tableView.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let bottom = tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        let right = tableView.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        NSLayoutConstraint.activateConstraints([top, left, bottom, right])
    }
}

extension FilmViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension FilmViewController: FilmViewProtocol {
    
}
