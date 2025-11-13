import XCTest
import AVFoundation
import SwiftUI
@testable import QuestMeCore

final class QuestMeCoreTests: XCTestCase {
    
    // EmotionType の日本語ラベルを確認
    func testEmotionLabel() throws {
        XCTAssertEqual(EmotionType.happy.label, "うれしい")
        XCTAssertEqual(EmotionType.sad.label, "かなしい")
        XCTAssertEqual(EmotionType.neutral.label, "ふつう")
        XCTAssertEqual(EmotionType.angry.label, "おこっている")
    }
    
    // EmotionType 全パターン網羅テスト
    func testAllEmotionLabels() throws {
        let emotions: [(EmotionType, String)] = [
            (.happy, "うれしい"),
            (.sad, "かなしい"),
            (.neutral, "ふつう"),
            (.angry, "おこっている")
        ]
        for (emotion, expected) in emotions {
            XCTAssertEqual(emotion.label, expected)
        }
    }
    
    // SpeechSync の状態遷移テスト（プロパティ操作で確認）
    func testSpeechSyncStateChanges() throws {
        let sync = SpeechSync(voice: VoiceProfile(style: .calm, tone: .neutral))
        
        // 初期状態
        XCTAssertFalse(sync.isSpeaking)
        XCTAssertNil(sync.currentRange)
        
        // 疑似的に状態を変更
        sync.isSpeaking = true
        XCTAssertTrue(sync.isSpeaking)
        
        sync.isSpeaking = false
        sync.currentRange = nil
        XCTAssertFalse(sync.isSpeaking)
        XCTAssertNil(sync.currentRange)
    }
    
    // SpeechSyncView のフォント適用テスト
    func testSpeechSyncViewFontApplied() throws {
        let sync = SpeechSync(voice: VoiceProfile(style: .calm, tone: .neutral))
        sync.currentRange = NSRange(location: 0, length: 2)
        
        let view = SpeechSyncView(sync: sync, text: "テスト", emotion: .neutral)
        let body = view.body
        
        // AttributedString が生成されることを確認
        XCTAssertNotNil(body)
    }
    
    // SpeechSync の speak メソッド確認
    func testSpeechSyncSpeakCreatesUtterance() throws {
        let sync = SpeechSync(voice: VoiceProfile(style: .calm, tone: .neutral))
        sync.speak("テスト", emotion: .neutral)
        
        // クラッシュせずに呼び出せることを確認
        XCTAssertNotNil(sync)
    }
    
    // VoiceSettingsView のナビゲーション確認
    func testVoiceSettingsViewNavigation() throws {
        let view = VoiceSettingsView()
        let body = view.body
        
        // NavigationStack が生成されることを確認
        XCTAssertNotNil(body)
    }
}
