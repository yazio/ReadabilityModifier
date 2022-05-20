import SwiftUI

enum TestUtility
{
    enum DeviceWidth
    {
        static let iPhone13Pro: CGFloat  = 358
        static let iPhone13Mini: CGFloat = 343
    }

    enum Constant
    {
        static let timeout: TimeInterval = 3
        static let extraSpacing: CGFloat = 25.4
    }

    static func present<ViewType: View>(
        view: ViewType
    )
    {
        let hostingController = UIHostingController(rootView: view)

        let application = UIApplication.shared
        application.windows.forEach
        {
            window in
            if let presentedViewController = window.rootViewController?.presentedViewController
            {
                presentedViewController.dismiss(
                    animated: false,
                    completion: nil
                )
            }
            window.isHidden = true
        }

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.layer.speed = 10

        hostingController.beginAppearanceTransition(true, animated: false)
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
        window.layoutIfNeeded()
        hostingController.endAppearanceTransition()
    }
}
