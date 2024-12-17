//
//  View+.swift
//  Boss
//
//  Created by Hao Zhang on 11/21/24.
//

import SwiftUI

extension View {
   func radius(_ radius: CGFloat = 4) -> some View { clipShape(RoundedRectangle(cornerRadius: radius)) }
   func border(radius: CGFloat = 4, borderColor: Color) -> some View {
      overlay { RoundedRectangle(cornerRadius: radius).strokeBorder(borderColor, lineWidth: 1) }
   }
   
   //color
   func tc() -> some View { foregroundStyle(.aTC) }
   func tc2() -> some View { foregroundStyle(.aTC2) }
   func secondary() -> some View { foregroundStyle(.secondary) }
   func accent() -> some View { foregroundStyle(.accent) }
   func white() -> some View { foregroundStyle(.white) }
   func red() -> some View { foregroundStyle(.red) }
   func purple() -> some View { foregroundStyle(.purple) }
   func bg() -> some View { background(Color.aBG) }
   func bg2() -> some View { background(Color.aBG2) }
   //font
   func size11() -> some View { font(.system(size: 11)) }
   func size12() -> some View { font(.system(size: 12)) }
   func size13() -> some View { font(.system(size: 13)) }
   func size13s() -> some View { size13().secondary() }
   func size14() -> some View { font(.system(size: 14)) }
   func size15() -> some View { font(.system(size: 15)) }
   func size16() -> some View { font(.system(size: 16)) }
   func size16semib() -> some View { font(.system(size: 16)).semib() }
   func headline() -> some View { font(.headline) }
   func size18b() -> some View { font(.system(size: 18)).bold() }
   func size18ab() -> some View { font(.system(size: 18)).bold().accent() }
   func size20b() -> some View { font(.title3).bold() }
    
   func medium() -> some View { fontWeight(.medium) }
   func semib() -> some View { fontWeight(.semibold) }
   

   func push(to alignment: Alignment) -> some View { frame(maxWidth: .infinity, alignment: alignment) }
   
   func allowMulti() -> some View {
      fixedSize(horizontal: false, vertical: true).textSelection(.enabled).multilineTextAlignment(.leading)
   }
}

extension Color {
   static let labelBG = Color(.systemFill)
   static let labelBG2 = Color(.systemGray5)
   static let bg = Color.aBG
}


//ui nav
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
   override open func viewDidLoad() {
      super.viewDidLoad()
      interactivePopGestureRecognizer?.delegate = self
   }
   
   public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool { return viewControllers.count > 1 }
   
   public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool { true }
}
