import SwiftUI
import UIKit

/// Modifies width of a SwiftUI View by using UIViews readableContentGuide. Also observes orientation and size changes to force a redraw.
/// - Parameter extraSpacing: Adds more horizontal spacing
/// - Parameter type: Select if the Readable Content Guide should be respected by applying eiter a horizontal padding or by
/// - Returns: The view that the readableContentGuide padding is applied to
public struct ReadableContentGuideViewModifier: ViewModifier
{
    @State private var horizontalPadding: CGFloat = 0
    @State private var width: CGFloat             = 0

    private let extraSpacing: CGFloat
    private let readableContentGuideType: ReadableContentGuideType

    @State private var rect = CGRect.zero

    public init(
        extraSpacing: CGFloat                              = 0,
        readableContentGuideType: ReadableContentGuideType = .padding
    )
    {
        self.extraSpacing             = extraSpacing
        self.readableContentGuideType = readableContentGuideType
    }

    public func body(
        content: Content
    ) -> some View
    {
        if readableContentGuideType == .padding
        {
            applyCommonViewModifier(content: content)
                .padding(.horizontal, horizontalPadding)
        }
        else
        {
            applyCommonViewModifier(content: content)
                .frame(width: width, alignment: .center)
        }
    }

    @ViewBuilder
    private func applyCommonViewModifier(
        content: Content
    ) -> some View
    {
        Group
        {
            if isPadInSplitscreenMode
            {
                // iPad is in Splitscreen and should use introspect because initializing an empty UIViewController always uses the full screen size instead of the Splitscreen window
                content
                    .underlyingViewController
                    {
                        viewController in

                        updateWidthAndPadding(from: viewController)
                    }
                    // Observe so underlyingViewController gets called
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in }
                    .onChange(of: rect, perform: { _ in })
            }
            else
            {
                // Use own ViewController instance to get width
                content
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification))
                    {
                        _ in

                        updateWidthAndPadding()
                    }
                    .onChange(of: rect)
                    {
                        _ in

                        updateWidthAndPadding()
                    }
                    .onAppear
                    {
                        updateWidthAndPadding()
                    }
            }
        }
        .observeFrame(rect: $rect)
    }

    private func updateWidthAndPadding(
        from viewController: UIViewController = UIViewController()
    )
    {
        let safeAreaInsets = UIApplication.shared.safeAreaInsets
        let safeArea       = safeAreaInsets.left + safeAreaInsets.right
        horizontalPadding  = (viewController.view.frame.width - viewController.view.readableContentGuide.layoutFrame.width + extraSpacing - safeArea) / 2 + (isPadInSplitscreenMode ? 0 : 16)
        width              = (viewController.view.readableContentGuide.layoutFrame.width) - (isPadInSplitscreenMode ? 0 : 32) - extraSpacing
    }

    private var isPadInSplitscreenMode: Bool
    {
        UIApplication.shared.isSplitOrSlideOver
    }
}
