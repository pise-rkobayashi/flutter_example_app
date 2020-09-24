class BuildConfig {
  /// アプリ名
  static const APP_NAME =
      String.fromEnvironment('APP_NAME', defaultValue: 'サンプルアプリ');

  /// アプリのモード
  static const FLAVOR = String.fromEnvironment('FLAVOR', defaultValue: '');

  /// デバッグモード
  final bool isDebug;

  BuildConfig({
    this.isDebug = false,
  });
}
