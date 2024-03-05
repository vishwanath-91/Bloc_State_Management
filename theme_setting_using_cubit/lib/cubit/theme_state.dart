part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;
  const ThemeState({this.appTheme = AppTheme.light});

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeState(appTheme:$appTheme)';

  factory ThemeState.initial() {
    return const ThemeState();
  }

  ThemeState copyWith({AppTheme? appTheme}) {
    return ThemeState(appTheme: appTheme!);
  }
}
