import XCTest
import SwiftUI
@testable import ReadabilityModifier

private struct UnderlyingViewControllerTestView: View
{
    let completionHandler: () -> Void

    var body: some View
    {
        NavigationView
        {
            List
            {
                EmptyView()
            }
        }
        .underlyingViewController
        {
            viewController in
            completionHandler()
        }
    }
}

class UnderlyingViewControllerTest: XCTestCase
{
    func testViewController()
    {
        let expectation = XCTestExpectation()

        let view = UnderlyingViewControllerTestView()
        {
            expectation.fulfill()
        }

        TestUtility.present(view: view)

        wait(
            for: [expectation],
            timeout: TestUtility.Constant.timeout
        )
    }
}
