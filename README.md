# TimeManagement
## 開発環境
- Mac OS Ventura 13.6.2 
- Xcode 15.0.1
- Swift 5.8.1 
- CocoaPods 1.14.3

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
