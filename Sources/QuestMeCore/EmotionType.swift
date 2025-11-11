//
//  EmotionType.swift
//  QuestMe
//
//  📂 格納場所:
//      QuestMe/Models/Emotion/EmotionType.swift
//
//  🎯 ファイルの目的:
//      - アプリ全体で利用する感情タイプを定義する（UI・ログ保存共通）。
//      - UI 表示用の色・ラベル・アイコンを提供する。
//      - CompanionAvatarView / CompanionSpeechBubbleView / FloatingCompanionOverlayView と連動。
//      - CompanionStyle に対応する拡張感情も含む（poetic, philosophical など）。
//      - ✅ 12言語対応ラベル取得メソッドを追加（label(for:)）
//
//  🔗 依存:
//      - Foundation
//      - SwiftUI
//
//  🔗 関連/連動ファイル:
//      - CoreDataEmotionLogDTO.swift（DTOからのラベル取得）
//      - EmotionLogRepository.swift（ログ保存時の言語対応）
//      - CompanionAvatarView.swift（アイコン表示）
//      - CompanionSpeechBubbleView.swift（感情ラベル表示）
//
//  👤 作成者: 津村 淳一 (Junichi Tsumura)
//  📅 改変日: 2025年10月29日
//

import Foundation
import SwiftUI

/// アプリ全体で利用する感情タイプ
public enum EmotionType: String, CaseIterable, Codable {
    case neutral, happy, sad, angry, thinking, sexy, encouraging, gentle, surprised, lonely, focused, nostalgic, sleepy
    case poetic, philosophical, childish, elderly, robotic, romantic, playful, shy, proud, confused
}

// MARK: - UI 表示用拡張（日本語ラベル・色・アイコン・定型フレーズ）
public extension EmotionType {
    var label: String {
        switch self {
        case .neutral:       return "ふつう"
        case .happy:         return "うれしい"
        case .sad:           return "かなしい"
        case .angry:         return "おこってる"
        case .thinking:      return "かんがえ中"
        case .sexy:          return "セクシー"
        case .encouraging:   return "おうえん"
        case .gentle:        return "やさしい"
        case .surprised:     return "びっくり"
        case .lonely:        return "さびしい"
        case .focused:       return "しゅうちゅう"
        case .nostalgic:     return "なつかしい"
        case .sleepy:        return "ねむい"
        case .poetic:        return "しとやか"
        case .philosophical: return "しさつてき"
        case .childish:      return "むじゃき"
        case .elderly:       return "おだやか"
        case .robotic:       return "むきしつ"
        case .romantic:      return "ときめき"
        case .playful:       return "あそびごころ"
        case .shy:           return "てれくさい"
        case .proud:         return "じしんまんまん"
        case .confused:      return "とまどい"
        }
    }
    
    var color: Color {
        switch self {
        case .neutral:       return .gray
        case .happy:         return .yellow
        case .sad:           return .blue
        case .angry:         return .red
        case .thinking:      return .purple
        case .sexy:          return .pink
        case .encouraging:   return .green
        case .gentle:        return .mint
        case .surprised:     return .orange
        case .lonely:        return .indigo
        case .focused:       return .cyan
        case .nostalgic:     return .brown
        case .sleepy:        return .teal
        case .poetic:        return .purple.opacity(0.7)
        case .philosophical: return .gray.opacity(0.6)
        case .childish:      return .yellow.opacity(0.8)
        case .elderly:       return .gray.opacity(0.4)
        case .robotic:       return .blue.opacity(0.5)
        case .romantic:      return .pink.opacity(0.7)
        case .playful:       return .orange.opacity(0.7)
        case .shy:           return .purple.opacity(0.5)
        case .proud:         return .red.opacity(0.6)
        case .confused:      return .gray.opacity(0.3)
        }
    }
    
    var icon: String {
        switch self {
        case .neutral:       return "circle"
        case .happy:         return "sun.max.fill"
        case .sad:           return "cloud.rain.fill"
        case .angry:         return "flame.fill"
        case .thinking:      return "brain.head.profile"
        case .sexy:          return "heart.fill"
        case .encouraging:   return "hands.sparkles.fill"
        case .gentle:        return "leaf.fill"
        case .surprised:     return "exclamationmark.triangle.fill"
        case .lonely:        return "person.fill.questionmark"
        case .focused:       return "scope"
        case .nostalgic:     return "clock.arrow.circlepath"
        case .sleepy:        return "moon.zzz.fill"
        case .poetic:        return "sparkles"
        case .philosophical: return "books.vertical.fill"
        case .childish:      return "face.smiling"
        case .elderly:       return "person.crop.circle.badge.clock"
        case .robotic:       return "cpu.fill"
        case .romantic:      return "heart.circle.fill"
        case .playful:       return "gamecontroller.fill"
        case .shy:           return "eye.slash.fill"
        case .proud:         return "star.fill"
        case .confused:      return "questionmark.circle.fill"
        }
    }
    
    var defaultPhrase: String {
        switch self {
        case .happy:         return "嬉しい気持ちです！"
        case .sad:           return "少し落ち込んでいます…"
        case .angry:         return "ちょっと怒ってるかも。"
        case .thinking:      return "考え中です。"
        case .surprised:     return "びっくりしました！"
        case .gentle:        return "穏やかな気持ちです。"
        case .encouraging:   return "あなたを応援しています！"
        case .neutral:       return "落ち着いています。"
        case .sexy:          return "魅力的な気分です。"
        default:             return "今の気持ちを整理しています。"
        }
    }
    
    /// 12言語対応ラベル取得
    func label(for languageCode: String) -> String {
        let labels: [EmotionType: [String: String]] = [
            .neutral:       ["en": "Neutral", "ja": "ふつう", "fr": "Neutre", "de": "Neutral", "es": "Neutral", "zh": "中性", "ko": "중립", "ru": "Нейтральный", "ar": "محايد", "hi": "तटस्थ", "pt": "Neutro", "it": "Neutro"],
            .happy:         ["en": "Happy", "ja": "うれしい", "fr": "Heureux", "de": "Glücklich", "es": "Feliz", "zh": "开心", "ko": "행복", "ru": "Счастливый", "ar": "سعيد", "hi": "खुश", "pt": "Feliz", "it": "Felice"],
            .sad:           ["en": "Sad", "ja": "かなしい", "fr": "Triste", "de": "Traurig", "es": "Triste", "zh": "伤心", "ko": "슬픔", "ru": "Грустный", "ar": "حزين", "hi": "उदास", "pt": "Triste", "it": "Triste"],
            .angry:         ["en": "Angry", "ja": "おこってる", "fr": "Fâché", "de": "Wütend", "es": "Enojado", "zh": "生气", "ko": "화남", "ru": "Злой", "ar": "غاضب", "hi": "गुस्सा", "pt": "Bravo", "it": "Arrabbiato"],
            .thinking:      ["en": "Thinking", "ja": "かんがえ中", "fr": "Pensif", "de": "Nachdenklich", "es": "Pensando", "zh": "思考中", "ko": "생각중", "ru": "Размышляющий", "ar": "يفكر", "hi": "सोच रहा है", "pt": "Pensando", "it": "Pensieroso"],
            .sexy:          ["en": "Sexy", "ja": "セクシー", "fr": "Sexy", "de": "Sexy", "es": "Sexy", "zh": "性感", "ko": "섹시", "ru": "Сексуальный", "ar": "جذاب", "hi": "सेक्सी", "pt": "Sexy", "it": "Sexy"],
            .encouraging:   ["en": "Encouraging", "ja": "おうえん", "fr": "Encourageant", "de": "Ermutigend", "es": "Motivador", "zh": "鼓舞", "ko": "격려", "ru": "Воодушевляющий", "ar": "مشجع", "hi": "प्रोत्साहन", "pt": "Incentivador", "it": "Incoraggiante"],
            .gentle:        ["en": "Gentle", "ja": "やさしい", "fr": "Doux", "de": "Sanft", "es": "Amable", "zh": "温柔", "ko": "부드러운", "ru": "Нежный", "ar": "لطيف", "hi": "कोमल", "pt": "Gentil", "it": "Gentile"],
            .surprised:     ["en": "Surprised", "ja": "びっくり", "fr": "Surpris", "de": "Überrascht", "es": "Sorprendido", "zh": "惊讶", "ko": "놀람", "ru": "Удивлённый", "ar": "مندهش", "hi": "आश्चर्यचकित", "pt": "Surpreso", "it": "Sorpreso"],
            .lonely:        ["en": "Lonely", "ja": "さびしい", "fr": "Solitaire", "de": "Einsam", "es": "Solitario", "zh": "孤独", "ko": "외로운", "ru": "Одинокий", "ar": "وحيد", "hi": "अकेला", "pt": "Solitário", "it": "Solitario"],
            .focused:       ["en": "Focused", "ja": "しゅうちゅう", "fr": "Concentré", "de": "Fokussiert", "es": "Concentrado", "zh": "专注", "ko": "집중", "ru": "Сосредоточенный", "ar": "مركز", "hi": "एकाग्र", "pt": "Concentrado", "it": "Concentrato"],
            .nostalgic:     ["en": "Nostalgic", "ja": "なつかしい", "fr": "Nostalgique", "de": "Nostalgisch", "es": "Nostálgico", "zh": "怀旧", "ko": "향수", "ru": "Ностальгический", "ar": "حنين", "hi": "नॉस्टैल्जिक", "pt": "Nostálgico", "it": "Nostalgico"],
            .sleepy:        ["en": "Sleepy", "ja": "ねむい", "fr": "Fatigué", "de": "Schläfrig", "es": "Somnoliento", "zh": "困", "ko": "졸림", "ru": "Сонный", "ar": "نعسان", "hi": "नींद आ रही", "pt": "Sonolento", "it": "Assonnato"],
            .poetic:        ["en": "Poetic", "ja": "しとやか", "fr": "Poétique", "de": "Poetisch", "es": "Poético", "zh": "诗意", "ko": "시적", "ru": "Поэтичный", "ar": "شاعري", "hi": "काव्यात्मक", "pt": "Poético", "it": "Poetico"],
            .philosophical: ["en": "Philosophical", "ja": "しさつてき", "fr": "Philosophique", "de": "Philosophisch", "es": "Filosófico", "zh": "哲学的", "ko": "철학적", "ru": "Философский", "ar": "فلسفي", "hi": "दार्शनिक", "pt": "Filosófico", "it": "Filosofico"],
            .childish:      ["en": "Childish", "ja": "むじゃき", "fr": "Enfantin", "de": "Kindisch", "es": "Infantil", "zh": "幼稚", "ko": "유치한", "ru": "Детский", "ar": "طفولي", "hi": "बचकाना", "pt": "Infantil", "it": "Infantile"],
            .elderly:       ["en": "Elderly", "ja": "おだやか", "fr": "Âgé", "de": "Alt", "es": "Anciano", "zh": "年长", "ko": "노인", "ru": "Пожилой", "ar": "مسن", "hi": "वृद्ध", "pt": "Idoso", "it": "Anziano"],
            .robotic:       ["en": "Robotic", "ja": "むきしつ", "fr": "Robotique", "de": "Roboterhaft", "es": "Robótico", "zh": "机械", "ko": "로봇같은", "ru": "Роботизированный", "ar": "آلي", "hi": "रोबोटिक", "pt": "Robótico", "it": "Robotico"],
            .romantic:      ["en": "Romantic", "ja": "ときめき", "fr": "Romantique", "de": "Romantisch", "es": "Romántico", "zh": "浪漫", "ko": "로맨틱", "ru": "Романтичный", "ar": "رومانسي", "hi": "रोमांटिक", "pt": "Romântico", "it": "Romantico"],
            .playful:       ["en": "Playful", "ja": "あそびごころ", "fr": "Ludique", "de": "Verspielt", "es": "Juguetón", "zh": "活泼", "ko": "장난기", "ru": "Игривый", "ar": "مرِح", "hi": "चंचल", "pt": "Brincalhão", "it": "Giocoso"],
            .shy:           ["en": "Shy", "ja": "てれくさい", "fr": "Timide", "de": "Schüchtern", "es": "Tímido", "zh": "害羞", "ko": "수줍은", "ru": "Застенчивый", "ar": "خجول", "hi": "संकोची", "pt": "Tímido", "it": "Timido"],
            .proud:         ["en": "Proud", "ja": "じしんまんまん", "fr": "Fier", "de": "Stolz", "es": "Orgulloso", "zh": "自豪", "ko": "자랑스러운", "ru": "Гордый", "ar": "فخور", "hi": "गर्वित", "pt": "Orgulhoso", "it": "Orgoglioso"],
            .confused:      ["en": "Confused", "ja": "とまどい", "fr": "Confus", "de": "Verwirrt", "es": "Confundido", "zh": "困惑", "ko": "혼란스러운", "ru": "Сбитый с толку", "ar": "مرتبك", "hi": "उलझन", "pt": "Confuso", "it": "Confuso"]
        ]

        // Normalize language code to two-letter if possible (e.g., "en-US" -> "en")
        let normalized = languageCode.split(separator: "-").first.map(String.init)?.lowercased() ?? languageCode.lowercased()

        // Try exact match for the emotion and language
        if let localized = labels[self]?[normalized] {
            return localized
        }
        // Fallback to Japanese (app's base) if available
        if let jp = labels[self]?["ja"] {
            return jp
        }
        // Fallback to the default Japanese label property
        return self.label
    }
}

