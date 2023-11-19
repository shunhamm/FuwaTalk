import SwiftUI

struct ContentView: View {
    // ViewModelのインスタンスを作成します。
    @ObservedObject var viewModel = ChatViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // チャットビューを表示するためのリストビューをここに配置します。
                ChatView(viewModel: viewModel)
                // ユーザーがテキストを入力し、送信ボタンを押すことでチャットが開始されます。
                InputView(viewModel: viewModel)
            }
            .navigationBarTitle("ふわトーク", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
