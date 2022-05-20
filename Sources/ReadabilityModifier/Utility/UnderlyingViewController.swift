import UIKit
import SwiftUI

extension View
{
    func inject<SomeView>(_ view: SomeView) -> some View where SomeView: View {
        overlay(view.frame(width: 0, height: 0))
    }

    func underlyingViewController(customize: @escaping (UIViewController) -> ()) -> some View
    {
        inject(
            UIKitUnderlyingViewController(
                selector: { $0.parent },
                customize: customize
            )
        )
    }
}

class UnderlyingUIViewController: UIViewController
{
    required init()
    {
        super.init(nibName: nil, bundle: nil)
        view = UnderlyingUIView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

struct UIKitUnderlyingViewController<TargetViewControllerType: UIViewController>: UIViewControllerRepresentable
{

    let selector: (UnderlyingUIViewController) -> TargetViewControllerType?
    let customize: (TargetViewControllerType) -> Void

    init(
        selector: @escaping (UIViewController) -> TargetViewControllerType?,
        customize: @escaping (TargetViewControllerType) -> Void
    )
    {
        self.selector  = selector
        self.customize = customize
    }

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<UIKitUnderlyingViewController>
    ) -> UnderlyingUIViewController
    {
        UnderlyingUIViewController()
    }

    func updateUIViewController(
        _ uiViewController: UnderlyingUIViewController,
        context: UIViewControllerRepresentableContext<UIKitUnderlyingViewController>
    )
    {
        DispatchQueue.main.async
        {
            guard let targetView = selector(uiViewController) else
            {
                return
            }
            customize(targetView)
        }
    }
}

class UnderlyingUIView: UIView
{
    required init()
    {
        super.init(frame: .zero)
        isHidden = true
        isUserInteractionEnabled = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
