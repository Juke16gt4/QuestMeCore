//
//  ConversationEntry.swift
//  QuestMe
//
//  📂 格納場所:
//      QuestMe/Core/Model/ConversationEntry.swift
//
//  🎯 ファイルの目的:
//      会話ログを保持する純粋データモデル。
//      - CoreData の ConversationEntryEntity とマッピング可能
//      - Codable に準拠して JSON 保存や同期に利用可能
//      - EmotionType を利用して感情を一元管理
//
//  🔗 関連/連動ファイル:
//      - ConversationEntryEntity+Mapping.swift
//      - ConversationSubject.swift
//      - CoreDataPersistence.swift
//      - EmotionType.swift
//
//  👤 修正者: 津村 淳一 (Junichi Tsumura)
//  📅 修正日: 2025/10/29
//

import Foundation

public struct ConversationEntry: Codable, Equatable {
    public let id: UUID
    public let speaker: String
    public let text: String
    public let createdAt: Date
    public let emotion: EmotionType
    public let topic: ConversationSubject

    public init(id: UUID = UUID(),
                speaker: String,
                text: String,
                createdAt: Date = Date(),
                emotion: EmotionType,
                topic: ConversationSubject) {
        self.id = id
        self.speaker = speaker
        self.text = text
        self.createdAt = createdAt
        self.emotion = emotion
        self.topic = topic
    }
}
