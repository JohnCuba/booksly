import 'package:booksly/view/app/app_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation.state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required int pageIndex,
    required List<AppPage> pages,
  }) = _NavigationState;
}