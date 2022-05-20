import UIKit

public extension UIApplication
{
    ///
    /// Returns `true` when if the app is running on an iPad in splitscreen mode
    ///
    var isSplitOrSlideOver: Bool
    {
        guard let window = self.windows.filter({ $0.isKeyWindow }).first else { return false }
        return !(window.frame.width == window.screen.bounds.width)
    }

    ///
    /// Returns the safeAreaInsets of the currently displayed window
    ///
    var safeAreaInsets: UIEdgeInsets
    {
        UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
    }
}
