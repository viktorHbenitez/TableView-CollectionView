//
//  CustomTableViewCell.swift
//  TableViewInsideCollectionView
//
//  Created by Victor Hugo Benitez Bosques on 25/10/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  
  @IBOutlet weak var dummyView: customView!
  
}

@IBDesignable class customView: UIView{
  
  @IBInspectable
  var bgColor: UIColor = .green{
    didSet{
      self.backgroundColor = bgColor
    }
  }
  
  @IBInspectable
  var cornerRadius: CGFloat = 10
  
  @IBInspectable
  var shadow: CGFloat = 5
  
  @IBInspectable
  var shadowOpacity: Float = 0.3
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewCustom()
  }
  override func prepareForInterfaceBuilder() {
    setupViewCustom()
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViewCustom()
  }
  
  func setupViewCustom(){
    self.backgroundColor = bgColor
    layer.cornerRadius = cornerRadius
    layer.shadowRadius = shadow
    layer.shadowOpacity = shadowOpacity
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViewCustom()
  }
  
}

