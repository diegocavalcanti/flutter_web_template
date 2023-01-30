abstract class ErroPersonalizado {
  String get message;
  final StackTrace? stackTrace;

  const ErroPersonalizado({this.stackTrace});
}
