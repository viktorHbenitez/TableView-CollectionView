//
//  MainCollectionViewCell.swift
//  TableViewInsideCollectionView
//
//  Created by Victor Hugo Benitez Bosques on 25/10/20.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
  lazy var mainTableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupInit()
  }
  
  func setupInit(){
    mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    mainTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "tblCell")
    self.contentView.addSubview(mainTableView)
    NSLayoutConstraint.activate([
      mainTableView.topAnchor.constraint(equalTo: self.topAnchor),
      mainTableView.leftAnchor.constraint(equalTo: self.leftAnchor),
      mainTableView.rightAnchor.constraint(equalTo: self.rightAnchor),
      mainTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  
  
}

extension MainCollectionViewCell: UITableViewDataSource, UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let number = Int.random(in: 1 ..< 10) // Random number of row
    
    return number
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell",
                                                for: indexPath) as? CustomTableViewCell{
      cell.selectionStyle = .none
      return cell
    }
    
    
    return UITableViewCell()
  }
  
  func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}





