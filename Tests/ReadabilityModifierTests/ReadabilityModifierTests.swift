import XCTest
import SwiftUI
@testable import ReadabilityModifier

class ReadableContentGuideTests: XCTestCase
{
    func testViewModifier_Padding()
    {
        let view = ReadabilityModifierTestView(
            contentGuideType: .padding,
            extraSpacing: 0
        )
        {
            width in
            XCTAssertEqual(width, TestUtility.DeviceWidth.iPhone13Pro)
        }
        TestUtility.present(view: view)
    }

    func testViewModifier_Width()
    {
        let view = ReadabilityModifierTestView(
            contentGuideType: .padding,
            extraSpacing: 0
        )
        {
            width in
            XCTAssertEqual(width, TestUtility.DeviceWidth.iPhone13Pro)
        }
        TestUtility.present(view: view)
    }

    func testViewModifier_extraSpacing_Padding()
    {
        let compareWidth = TestUtility.DeviceWidth.iPhone13Pro - TestUtility.Constant.extraSpacing
        let view = ReadabilityModifierTestView(
            contentGuideType: .padding,
            extraSpacing: TestUtility.Constant.extraSpacing
        )
        {
            width in
            XCTAssertEqual(width, compareWidth)
        }
        TestUtility.present(view: view)
    }

    func testViewModifier_extraSpacing_Width()
    {
        let compareWidth = TestUtility.DeviceWidth.iPhone13Pro - TestUtility.Constant.extraSpacing
        let view = ReadabilityModifierTestView(
            contentGuideType: .padding,
            extraSpacing: TestUtility.Constant.extraSpacing
        )
        {
            width in
            XCTAssertEqual(width, compareWidth)
        }
        TestUtility.present(view: view)
    }
}
