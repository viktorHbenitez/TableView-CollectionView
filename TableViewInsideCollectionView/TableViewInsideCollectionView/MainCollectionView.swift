//
//  MainCollectionView.swift
//  TableViewInsideCollectionView
//
//  Created by Victor Hugo Benitez Bosques on 25/10/20.
//

import UIKit

let cellIdentifier = "collectionCell"

class MainCollectionView: UIViewController {
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = .zero
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = .zero
    layout.minimumInteritemSpacing = .zero

    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    collection.backgroundColor = .white
    collection.delegate = self
    collection.dataSource = self
    collection.isPagingEnabled = true
    collection.translatesAutoresizingMaskIntoConstraints = false
    return collection
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "CollectionView"
    collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    self.view.addSubview(collectionView)
    setupConstraints()
  }
  func setupConstraints(){
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
      collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
  }
}

extension MainCollectionView: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MainCollectionViewCell{

      return cell
    }
    return UICollectionViewCell()
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width - 20, height: 100)
  }

}
