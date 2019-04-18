//
//  SocialFeedTableViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 15/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class SocialFeedTableViewController: UITableViewController {

  let cellIdentifier = "CellIdentifier"
  var data: [SocialNetwork: String]!
  
  convenience init(style: UITableView.Style, data: [SocialNetwork: String]) {
    self.init(style: style)
    self.data = data
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.allowsSelection = false
    tableView.allowsMultipleSelection = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  // MARK: - Table view data delegate
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                             for: indexPath) as! SocialFeedTableViewCell
    
    let item = data.eleme
    
    cell.content = item.title
    cell.socialNetwork = item.socialNetwork
    
    return cell
  }

}
