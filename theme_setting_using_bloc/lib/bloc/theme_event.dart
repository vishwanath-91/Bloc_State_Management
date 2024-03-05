part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final int randint;
  const ChangeThemeEvent({required this.randint});

  @override
  String toString() => 'changeThemeEvent(randint:$randint)';

  @override
  List<Object> get props => [randint];
}
