import XCTest
@testable import QuestMeCore

final class QuestMeCoreTests: XCTestCase {
    func testEmotionLabel() {
        XCTAssertEqual(EmotionType.happy.label(for: "en"), "Happy")
    }
}
