import SwiftUI

// ユーザーメッセージを表示するビュー
struct UserMessageView: View {
    var message: String

    var body: some View {
        HStack {
            Spacer() // 右側にメッセージを寄せる
            Text(message)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(15)
        }
    }
}

// キャラクターメッセージを表示するビュー
struct CharacterMessageView: View {
    var message: String

    var body: some View {
        HStack {
            Text(message)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(15)
            Spacer() // 左側にメッセージを寄せる
        }
    }
}

// チャットビュー
struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel

    var body: some View {
        VStack {
            Image("BearCharacter") // Assets.xcassetsに追加した画像の名前を指定
                .resizable() // 画像がリサイズ可能になります
                .scaledToFit() // アスペクト比を保ちながらコンテナにフィットするようにサイズを調整します
                .frame(width: 120, height: 120) // 画像のサイズを指定します
                .padding(.top) // 上部に余白を追加します

            List(viewModel.messages) { message in
                if message.isFromUser {
                    UserMessageView(message: message.text)
                } else {
                    CharacterMessageView(message: message.text)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: ChatViewModel())
    }
}
