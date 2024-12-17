import SwiftUI
import Combine

extension View {
   func hud<Content: View> (isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
      ZStack {
         self
         if isPresented.wrappedValue {
            HUDView(content: content).zIndex(1)
         }
      }.animation(.default, value: isPresented.wrappedValue)
   }
}
struct HUDView<Content: View>: View {
   @ViewBuilder let content: Content
   var body: some View {
      content.font(.subheadline).foregroundStyle(Color.aTCR)
         .padding(.horizontal, 4).padding(12)
         .background(RoundedRectangle(cornerRadius: 8).fill(Color.aBGR))
   }
}
@Observable final class HUD {
   var isPresented = false
   private(set) var title: String = ""
   private var dismissTimer: AnyCancellable?
   func show(_ title: String) {
      self.title = title
      isPresented = true
      dismissTimer?.cancel()

      dismissTimer = Timer.publish(every: 3, on: .main, in: .common)
         .autoconnect()
         .sink { [weak self] _ in
            self?.isPresented = false
            self?.dismissTimer?.cancel()
         }
   }
}
