# TimeManagement
## 開発環境
- macOS Monterey 12.6.2
- Xcode 14.2
- Swift 5.7.2
- CocoaPods 1.12.0

## ブランチについて
- mainブランチをご参照ください。

## 起動方法
1. 以下のGitHubリポジトリからプロジェクトをクローンします。 
    https://github.com/syogo-user/TimeManagement.git
2. 1のフォルダ階層でターミナルを起動します。
3. ターミナル上で「pod install」コマンドを実行します。
4. 「TimeManagement.xcworkspace」からXcodeを起動します。
6. Xcodeにてアプリを実行します。

## アーキテクチャ
- 3層レイヤードアーキテクチャを採用(Presentation層、Domain層、Infra層)
- MVVMを採用
