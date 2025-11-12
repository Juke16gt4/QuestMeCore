//
//  ConfirmationView.swift
//  QuestMeCore
//
//  Purpose: 声色設定画面。
//           声質設定で確定したパラメータをベースにサンプル発話を行い、
//           「戻る」で声質設定へ戻り、「✔ 確定」で音声設定を保存。
//  Dependencies: SwiftUI, AVFoundation
//  Related Files: VoiceSettingsView.swift
//  Author: Junichi Tsumura
//  Created: 2025-11-12
//

import SwiftUI
import AVFoundation

struct ConfirmationView: View {
    var speed: Double
    var tone: Double
    var vibrato: Double
    var breakInterval: Double
    
    @State private var showTooltip = false
    @State private var fadeOut = false
    
    private let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("声色設定")
                .font(.system(size: 10.5))
                .foregroundColor(.black)
                .padding(.top, 8)
            
            Spacer()
            
            // サンプル発話（声色確認）
            Button("サンプル再生") {
                speakSample("今日は何が食べたい？")
                speakSample("明日のご予定は？")
            }
            .padding()
            
            Spacer()
            
            // 操作ボタン群
            HStack {
                Button("戻る") {
                    // 声質設定へ戻る処理
                }
                .padding()
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                
                Spacer()
                
                Button("✔ 確定") {
                    // 音声設定を保存
                }
                .padding()
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 2))
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
        .overlay(
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Button("ヘルプ") {
                            showTooltip = true
                            fadeOut = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.easeOut(duration: 0.6)) {
                                        fadeOut = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                        showTooltip = false
                                    }
                                }
                            }
                        }
                        .font(.system(size: 10.5))
                        .foregroundColor(.black)
                        .padding(4)
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                        
                        if showTooltip {
                            Text("声色を設定できます")
                                .font(.system(size: 10.5))
                                .foregroundColor(.black)
                                .padding(6)
                                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1))
                                .opacity(fadeOut ? 0 : 1)
                        }
                    }
                }
                Spacer()
            }
            .padding(.top, 8)
            .padding(.trailing, 8)
        )
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
