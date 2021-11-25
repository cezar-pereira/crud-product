abstract class FailureProductInterface implements Exception {
  String get message;
}

class ErrorRemoveProduct implements FailureProductInterface {
  @override
  final String message;
  ErrorRemoveProduct({required this.message});
}

class ErrorSaveProduct implements FailureProductInterface {
  @override
  final String message;
  ErrorSaveProduct({required this.message});
}

class ErrorUpdateProduct implements FailureProductInterface {
  @override
  final String message;
  ErrorUpdateProduct({required this.message});
}
