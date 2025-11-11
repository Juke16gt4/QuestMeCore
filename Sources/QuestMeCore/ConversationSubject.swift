//
//  ConversationSubject.swift
//  QuestMeCore
//
//  📂 格納場所:
//      QuestMeCore/Core/Model/ConversationSubject.swift
//
//  🎯 ファイルの目的:
//      会話のトピックを表現するシンプルな構造体。
//      - CoreData では topicLabel として保存
//      - Codable 準拠で JSON 保存可能
//      - 多言語ラベル対応
//
//  👤 修正者: 津村 淳一
//  📅 修正日: 2025年11月12日
//

import Foundation

public struct ConversationSubject: Codable, Hashable, Sendable {
    public let label: String

    // ✅ 定義済みトピック一覧
    public static let health        = ConversationSubject(label: "health")
    public static let work          = ConversationSubject(label: "work")
    public static let family        = ConversationSubject(label: "family")
    public static let anxiety       = ConversationSubject(label: "anxiety")
    public static let entertainment = ConversationSubject(label: "entertainment")
    public static let life          = ConversationSubject(label: "life")
    public static let politics      = ConversationSubject(label: "politics")
    public static let growth        = ConversationSubject(label: "growth")
    public static let other         = ConversationSubject(label: "other")
    public static let general       = ConversationSubject(label: "general")

    public static let localizedLabels: [String: [String: String]] = [
        "health": ["ja": "健康", "en": "Health"],
        "work": ["ja": "仕事", "en": "Work"],
        "family": ["ja": "家族", "en": "Family"],
        "anxiety": ["ja": "不安", "en": "Anxiety"],
        "entertainment": ["ja": "娯楽", "en": "Entertainment"],
        "life": ["ja": "生活", "en": "Life"],
        "politics": ["ja": "政治", "en": "Politics"],
        "growth": ["ja": "成長", "en": "Growth"],
        "other": ["ja": "その他", "en": "Other"],
        "general": ["ja": "一般", "en": "General"]
    ]

    public func localizedLabel(for language: String) -> String {
        Self.localizedLabels[label]?[language] ?? label
    }
}
