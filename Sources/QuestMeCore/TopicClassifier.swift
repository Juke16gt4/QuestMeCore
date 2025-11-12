//
//  TopicClassifier.swift
//  QuestMeSDK
//
//  📂 格納場所:
//      QuestMeSDK/Core/TopicClassifier.swift
//
//  🎯 ファイルの目的:
//      ConversationEntry の text を解析し、ConversationTopic を推定する。
//      - Entry 自体には topic を保持しない
//      - 分類結果を返すユーティリティ
//      - SwiftUI から監視可能な状態を提供
//
//  🔗 関連/連動ファイル:
//      - ConversationEntry.swift
//      - ConversationTopic.swift
//
//  👤 作成者: 津村 淳一 (Junichi Tsumura)
//  📅 修正版: 2025年11月11日
//

//
//  TopicClassifier.swift
//  QuestMe
//
//  📂 格納場所:
//      QuestMe/Core/TopicClassifier.swift
//
//  🎯 目的:
//      会話エントリを解析し、EmotionType と ConversationSubject に基づいてトピック分類を行う。
//      - 外部モジュールから利用可能（public API）
//      - CoreData やログ保存に利用
//
//  🔗 依存:
//      - ConversationEntry.swift
//      - EmotionType.swift
//      - ConversationSubject.swift
//
//  👤 作成者: 津村 淳一
//  📅 修正版: 2025年11月11日
//

import Foundation

/// トピック分類の結果
public struct TopicResult: Codable, Equatable {
    public let subject: ConversationSubject
    public let dominantEmotion: EmotionType
    public let confidence: Double

    public init(subject: ConversationSubject,
                dominantEmotion: EmotionType,
                confidence: Double) {
        self.subject = subject
        self.dominantEmotion = dominantEmotion
        self.confidence = confidence
    }
}

/// 会話分類器
public final class TopicClassifier {

    public init() {}

    /// 単一エントリを分類
    public func classify(entry: ConversationEntry) -> TopicResult {
        let subject = inferSubject(from: entry.text)
        let emotion = entry.emotion
        return TopicResult(subject: subject, dominantEmotion: emotion, confidence: 0.85)
    }

    /// 複数エントリを分類
    public func classify(entries: [ConversationEntry]) -> [TopicResult] {
        return entries.map { classify(entry: $0) }
    }

    /// 特定の感情に基づいて分類
    public func classify(entry: ConversationEntry, withEmotion emotion: EmotionType) -> TopicResult {
        let subject = inferSubject(from: entry.text)
        return TopicResult(subject: subject, dominantEmotion: emotion, confidence: 0.9)
    }

    // MARK: - 内部推定ロジック
    private func inferSubject(from text: String) -> ConversationSubject {
        if text.contains("仕事") {
            return ConversationSubject(label: "仕事")
        } else if text.contains("家族") {
            return ConversationSubject(label: "家族")
        } else if text.contains("健康") {
            return ConversationSubject(label: "健康")
        } else {
            return ConversationSubject(label: "一般")
        }
    }
}
