//
//  VoiceProfile.swift
//  QuestMeCore
//
//  📂 格納場所:
//      QuestMeCore/Core/Voice/VoiceProfile.swift
//
//  🎯 ファイルの目的:
//      コンパニオンの声の性格（スタイル/トーン/速度/言語コード）を唯一の正として定義。
//      - SpeechSync で AVSpeechSynthesisVoice(language:) に渡す speechCode を保持。
//
//  👤 修正者: 津村 淳一
//  📅 修正日: 2025年11月12日
//

import Foundation

public enum VoiceStyle: String, Codable, CaseIterable, Hashable, Sendable {
    case calm      = "落ち着いた"
    case energetic = "元気"
    case gentle    = "優しい"
    case lively    = "軽快"
    case sexy      = "セクシー"
}

public enum VoiceTone: String, Codable, CaseIterable, Hashable, Sendable {
    case neutral = "ノーマル"
    case husky   = "ハスキー"
    case bright  = "高め"
    case deep    = "低め"
}

public enum VoiceSpeed: String, Codable, CaseIterable, Hashable, Sendable {
    case slow   = "ゆっくり"
    case normal = "普通"
    case fast   = "速い"
}

public struct VoiceProfile: Codable, Equatable, Hashable, Sendable {
    public var style: VoiceStyle
    public var tone: VoiceTone
    public var speed: VoiceSpeed
    public var speechCode: String

    public init(style: VoiceStyle,
                tone: VoiceTone,
                speed: VoiceSpeed = .normal,
                speechCode: String = "ja-JP") {
        self.style = style
        self.tone = tone
        self.speed = speed
        self.speechCode = speechCode
    }
}
