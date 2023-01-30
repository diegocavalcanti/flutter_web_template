abstract class ErroCustom {
  String get message;
  final StackTrace? stackTrace;

  const ErroCustom({this.stackTrace});
}
