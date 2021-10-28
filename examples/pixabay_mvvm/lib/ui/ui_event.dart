abstract class UiEvent {
  factory UiEvent.showSnackBar(String message) = ShowSnackBar;
}

class ShowSnackBar implements UiEvent {
  final String message;

  ShowSnackBar(this.message);
}