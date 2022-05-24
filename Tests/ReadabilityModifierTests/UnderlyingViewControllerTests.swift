@testable import ReadabilityModifier
import SwiftUI
import XCTest

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
            _ in
            completionHandler()
        }
    }
}

class UnderlyingViewControllerTest: XCTestCase
{
    func testViewController()
    {
        let expectation = XCTestExpectation()

        let view = UnderlyingViewControllerTestView
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
