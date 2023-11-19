import SwiftUI

struct InputView: View {
    @ObservedObject var viewModel: ChatViewModel
    @State private var inputText: String = ""

    var body: some View {
        HStack {
            TextField("メッセージを入力してください", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // ユーザーが送信ボタンをタップしたときに実行されるアクション
                // 入力されたテキストをビューモデルを通して送信
                viewModel.sendMessage(inputText)
                // 入力フィールドをクリア
                inputText = ""
            }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .padding()
            }
            .disabled(inputText.isEmpty) // テキストが空の場合はボタンを無効化
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        // プレビュー用のビューモデルを渡す
        InputView(viewModel: ChatViewModel())
    }
}
