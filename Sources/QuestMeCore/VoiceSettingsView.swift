//
//  VoiceSettingsView.swift
//  QuestMeCore
//
//  Purpose: 声質調整画面。
//           速さ・トーン・ビブラート・途切れ声をスライダーで調整し、
//           サンプル発話で確認後、確定すると声色設定画面へ遷移。
//  Dependencies: SwiftUI, AVFoundation
//  Related Files: ConfirmationView.swift
//  Author: Junichi Tsumura
//  Created: 2025-11-12
//

import SwiftUI
import AVFoundation

struct VoiceSettingsView: View {
    @State private var speed: Double = 1.0
    @State private var tone: Double = 0.0
    @State private var vibrato: Double = 0.0
    @State private var breakInterval: Double = 0.1
    
    @State private var navigateToConfirmation = false
    
    private let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text("音声設定（声質調整）")
                    .font(.system(size: 10.5))
                    .foregroundColor(.black)
                
                // 速さ
                VStack {
                    Text("速さ: \(String(format: "%.1f", speed))倍")
                    Slider(value: $speed, in: 0.5...1.5, step: 0.1)
                }
                .padding(8)
                .background(Color.white)
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                
                // トーン
                VStack {
                    Text("トーン: \(String(format: "%.2f", tone))")
                    Slider(value: $tone, in: -1.0...1.0, step: 0.1)
                }
                .padding(8)
                .background(Color.white)
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                
                // ビブラート
                VStack {
                    Text("ビブラート: \(String(format: "%.2f", vibrato))")
                    Slider(value: $vibrato, in: 0...1.0, step: 0.05)
                }
                .padding(8)
                .background(Color.white)
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                
                // 途切れ声
                VStack {
                    Text("途切れ声: \(String(format: "%.2f", breakInterval))秒")
                    Slider(value: $breakInterval, in: 0.0...0.5, step: 0.01)
                }
                .padding(8)
                .background(Color.white)
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                
                Spacer()
                
                // サンプル発話
                Button("サンプル再生") {
                    speakSample("おはようございます")
                    speakSample("今日は心地よい気分ですよ")
                }
                .padding()
                
                // 操作ボタン群
                HStack {
                    Button("戻る") {
                        // 戻る処理（必要なら親画面へ）
                    }
                    .padding()
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                    
                    Spacer()
                    
                    Button("✔ 確定") {
                        // 声質を保存 → 声色設定画面へ遷移
                        navigateToConfirmation = true
                    }
                    .padding()
                    .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 2))
                }
                
                // まず NavigationStack の中で
                NavigationLink(value: "confirmation") {
                    EmptyView()
                }
                .navigationDestination(for: String.self) { value in
                    if value == "confirmation" {
                        ConfirmationView(
                            speed: speed,
                            tone: tone,
                            vibrato: vibrato,
                            breakInterval: breakInterval
                        )
                    }
                }
            }
            .padding()
        }
    }
    
    // MARK: - 発話処理
    private func speakSample(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = Float(speed)
        utterance.pitchMultiplier = Float(1.0 + tone * 0.2)
        utterance.preUtteranceDelay = breakInterval
        synthesizer.speak(utterance)
    }
}
