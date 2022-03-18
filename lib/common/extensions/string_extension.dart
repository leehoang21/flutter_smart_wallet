extension StringExtension on String {
  String get toTitleCase {
    if (this.isEmpty) {
      return this;
    } else {
      final lowerCaseText = this.toLowerCase();
      return lowerCaseText.substring(0, 1).toUpperCase() +
          lowerCaseText.substring(1);
    }
  }
}
