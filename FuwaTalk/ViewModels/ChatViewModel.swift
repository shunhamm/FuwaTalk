import Foundation
import SwiftUI

// チャットメッセージを表す構造体
struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isFromUser: Bool
}

class ChatViewModel: ObservableObject {
    // チャットメッセージの配列
    @Published var messages: [ChatMessage] = []
    
    // ユーザーからのメッセージを受け取り、応答を生成するメソッド
    func sendMessage(_ text: String) {
        // ユーザーからのメッセージを追加
        let userMessage = ChatMessage(text: text, isFromUser: true)
        messages.append(userMessage)
        
        // ここで外部APIやChatGPT APIなどを呼び出してクマのキャラクターからの応答を取得します。
        // この例では、応答が即座に返ってくると仮定しています。
        // 実際のアプリでは非同期処理を行い、APIからの応答を待ちます。
        let characterResponse = ChatMessage(text: "これはクマの応答です！", isFromUser: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // 応答メッセージを追加
            self.messages.append(characterResponse)
        }
    }
}
