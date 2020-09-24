# Flutterサンプルプロジェクト

Flutter Sample Application

## プロジェクトをクローンしたら

最初にrun_build_runnerで各自動生成ファイルを生成してください

## プロジェクトのパッケージ構成
・app - アプリケーションクラスやビルド時の設定  
・di - Providerを利用した依存性注入周りの処理  
・data - Network・DBなどデータ取得・保存API層  
・model - 共通ロジック・repositoryで扱う用のクラス  
・repository - data層から各種データの取得を抽象化・modelへ変換する層  
・feature - ユーザー入力の加工やデータを画面に表示するUI層  
・navigation - アプリの画面遷移周りの処理  
・util - その他便利クラス  
