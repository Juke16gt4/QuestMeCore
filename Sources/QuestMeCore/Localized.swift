//
//  Localized.swift
//  QuestMeCore
//
//  📂 格納場所:
//      QuestMe/Core/Localization/Localized.swift
//
//  🎯 ファイルの目的:
//      多言語テキスト対応の唯一の正。
//      - UI層はこのAPIを呼ぶだけで翻訳済みテキストを取得。
//      - 言語追加はここにキーを追加するだけで全画面に反映。
//      - VoiceProfileと連動して音声言語コードも統一。
//

import Foundation

public enum QuestMeLocale: String {
    case ja = "ja"
    case en = "en"
}

public struct Localized {
    public static func text(for key: String, locale: QuestMeLocale = .ja) -> String {
        switch (key, locale) {
        case ("title", .ja): return "🧍‍♂️ コンパニオン生成"
        case ("title", .en): return "🧍‍♂️ Companion Creation"
        case ("voiceSelected", .ja): return "選択された声色: "
        case ("voiceSelected", .en): return "Selected Voice: "
        default: return key
        }
    }
}
