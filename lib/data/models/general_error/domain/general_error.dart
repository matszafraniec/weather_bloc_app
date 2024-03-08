class GeneralError {
  final String message;

  GeneralError(this.message);

  factory GeneralError.unexpected() => GeneralError('UNEXPECTED');
}
