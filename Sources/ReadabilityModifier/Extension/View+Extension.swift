import SwiftUI

public extension View
{

    /// Modifies width of a SwiftUI View by using UIViews readableContentGuide. Also observes orientation and size changes to force a redraw.
    /// - Parameter extraSpacing: Adds more horizontal spacing
    /// - Parameter type: Select if the Readable Content Guide should be respected by applying eiter a horizontal padding or by
    /// - Returns: The view that the readableContentGuide padding is applied to
    func fitToReadableContentGuide(
        extraSpacing: CGFloat = 0,
        type: ReadableContentGuideType = .padding
    ) -> some View
    {
        modifier(
            ReadableContentGuideViewModifier(
                extraSpacing: extraSpacing,
                readableContentGuideType: type
            )
        )
    }
}

