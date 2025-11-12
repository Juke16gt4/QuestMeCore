import XCTest
@testable import QuestMeSDK

final class QuestMeSDKTests: XCTestCase {
    func testHello() {
        XCTAssertEqual(QuestMeSDK.hello(), "QuestMeSDKは生きています！")
    }

    func testAnother() {
        XCTAssertTrue(1 + 1 == 2)
    }
}
