//
//  JBPhoneNumber.swift
//  JBPhoneNumber
//
//  Created by Jeongbae Kong on 2020/08/25.
//

import Foundation

@IBDesignable
class JBPhoneNumberTextField: UITextField {
  
  private lazy var leftImageView = UIImageView()
  private var leftContainerView: UIView?
  
  // MARK: LEFT Flag View
  private var leftViewPadding: CGFloat = 8
  private var widthOfImageInLeftView: CGFloat = 35
  private var leftFlagImageWidth: CGFloat = 0
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  @IBInspectable var leftPadding: CGFloat = 0
  
  @IBInspectable var color: UIColor = UIColor.lightGray {
    didSet {
//      updateView()
    }
  }
  
  private func textHeight() -> CGFloat {
    guard let font = self.font else { return 0.0 }
    
    return font.lineHeight + 3.0
  }
  
  func setCoutryFlag() {
     let imageView = UIImageView(
       frame: CGRect(x: leftViewPadding, y: 0, width: widthOfImageInLeftView, height: frame.height)
     )
     
     imageView.contentMode = .scaleAspectFit
     imageView.image = UIImage(named: "flag_south_korea")
     
     let label = UILabel()
     label.font = font ?? UIFont.systemFont(ofSize: 14)
     label.textColor = textColor ?? .black
     label.text = "+82"
     
     label.frame = CGRect(
       x: leftViewPadding + widthOfImageInLeftView + leftViewPadding,
       y: 0,
       width: label.intrinsicContentSize.width,
       height: frame.height
     )
     
     let paddingView = UIView(
       frame: CGRect(
         x: 0,
         y: 0,
         width: leftViewPadding + label.intrinsicContentSize.width + widthOfImageInLeftView + leftViewPadding,
         height: frame.height
       )
     )
     
     paddingView.addSubview(imageView)
     paddingView.addSubview(label)
     paddingView.backgroundColor = .clear
     
     leftViewMode = .always
     leftView = paddingView
   }
}
