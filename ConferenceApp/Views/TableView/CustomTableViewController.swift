//
//  CustomTableViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

protocol CustomTableViewControllerDelegate {
  func cellSelected(object: AnyObject?)
}

class CustomTableViewController: UITableViewController {
  let cellIdentifier = "CellIdentifier"
  var data: [String: [TableViewData]]!
  var customTableViewControllerDelegate: CustomTableViewControllerDelegate?
  var onSelected: ((_ object: AnyObject?)->())?
  
  convenience init(style: UITableView.Style, data: [String: [TableViewData]], onSelected:((_ object: AnyObject?)->())?) {
    self.init(style: style)
    self.data = data
    self.onSelected = onSelected
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.allowsSelection = true
    tableView.allowsMultipleSelection = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    let numOfSections = data.keys.count == 1 && data.keys.first!.isEmpty
      ? 1 : data.keys.count
    
    return numOfSections
  }
  
  fileprivate func sectionForIndex(_ index: Int) -> String {
    let sections = Array(data.keys)
    return sections[index]
  }
  
  fileprivate func itemForIndexPath(_ indexPath: IndexPath) -> TableViewData{
    let section = sectionForIndex(indexPath.section)
    let item = data[section]![indexPath.row]
    
    return item
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionForIndex(section)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let section = sectionForIndex(section)
    let rows = data[section]!
    return rows.count
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = itemForIndexPath(indexPath)
    customTableViewControllerDelegate?.cellSelected(object: item.object)
    
    onSelected?(item.object)
  }

  
  // MARK: - Table view data delegate
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                             for: indexPath) as! CustomTableViewCell
    
    let item = itemForIndexPath(indexPath)
    
    cell.title = item.title
    cell.subtitle = item.subtitle
    
    var defaultImage = "https://ak8.picdn.net/shutterstock/videos/11205278/thumb/1.jpg"
    
    if indexPath.row % 2 == 0 {
      defaultImage = "https://png.pngtree.com/thumb_back/fw800/back_pic/00/04/95/525625bb4317fb9.jpg"
    }
    
    cell.photoImageUrl = item.imagePath ?? URL(string: defaultImage)
    
    return cell
  }
  
}
