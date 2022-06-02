import 'package:freezed_annotation/freezed_annotation.dart';

part 'freeze.freezed.dart';

@Freezed()

@Freezed()
class LoginResult with _$LoginResult {
  const LoginResult._();
  const factory LoginResult.loading() = _Loading;
  const factory LoginResult.success(String value) = _Success;

  const factory LoginResult.failure(String errorMessage) = _Failure;
}
