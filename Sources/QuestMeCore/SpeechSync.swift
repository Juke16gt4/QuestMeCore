//
//  SpeechSync.swift
//  QuestMeCore
//
//  📂 ファイル場所:
//      QuestMeCore/Sources/QuestMeCore/SpeechSync.swift
//
//  🎯 目的:
//      SwiftUI と連動した音声合成処理を提供する。
//      - 読み上げ中の文字のみを 1.4 倍に拡大して強調表示。
//      - AVSpeechSynthesizer による音声出力を管理。
//      - Delegate コールバックで現在の発音範囲を追跡。
//
//  🔗 依存関係:
//      - SwiftUI
//      - Combine
//      - AVFoundation
//      - VoiceProfile (QuestMeCore モジュール)
//      - EmotionType (QuestMeCore モジュール)
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月12日
//

import SwiftUI
import Combine
import AVFoundation

#if canImport(UIKit)
import UIKit
typealias QMFont = UIFont
#elseif canImport(AppKit)
import AppKit
typealias QMFont = NSFont
#endif

final class SpeechSync: NSObject, ObservableObject, AVSpeechSynthesizerDelegate, @unchecked Sendable {
    private let voice: VoiceProfile
    private let synthesizer = AVSpeechSynthesizer()
    
    @Published var isSpeaking: Bool = false
    @Published var currentRange: NSRange? = nil   // 現在読み上げ中の文字範囲
    
    init(voice: VoiceProfile) {
        self.voice = voice
        super.init()
        synthesizer.delegate = self
    }
    
    func speak(_ text: String, emotion: EmotionType = .neutral) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: voice.speechCode)
        synthesizer.speak(utterance)
    }
    
    // MARK: - Delegate
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                           willSpeakRangeOfSpeechString characterRange: NSRange,
                           utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.currentRange = characterRange
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                           didStart utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isSpeaking = true
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                           didFinish utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isSpeaking = false
            self.currentRange = nil
        }
    }
}

// MARK: - SwiftUI View
public struct SpeechSyncView: View {
    @ObservedObject var sync: SpeechSync
    let text: String
    let emotion: EmotionType
    
    public var body: some View {
        let attributed = NSMutableAttributedString(string: text)
        
        if let range = sync.currentRange {
            let font = QMFont.systemFont(ofSize: 24) // iOSならUIFont, macOSならNSFont
            attributed.addAttribute(.font, value: font, range: range)
        }
        
        return Text(AttributedString(attributed))
            .onAppear {
                sync.speak(text, emotion: emotion)
            }
    }
}

// MARK: - SwiftUI Preview
struct SpeechSyncPreview: PreviewProvider {
    static var previews: some View {
        SpeechSyncView(
            sync: SpeechSync(voice: VoiceProfile(style: .calm, tone: .neutral)),
            text: "こんにちは、QuestMeCoreのテストです！",
            emotion: EmotionType.happy
        )
    }
}
