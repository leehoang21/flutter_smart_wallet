extension NumExtension on num{
  String get toStandardized {
    if (this < 10 && -10 < this) {
      return '0$this';
    }
    return toString();
  }
}