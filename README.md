## TableView into CollectionView

![version app ](https://github.com/viktorHbenitez/TableView-CollectionView/blob/master/sketch/TableViewIntoCollectionView.png)  

```swift
// Create CollectionView
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
```


