import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(6, errorText: 'Password must be at least\n6 characters')
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'Must be valid email'),
]);
final usernameValidator = MultiValidator([
  RequiredValidator(errorText: 'Name is required'),
  MinLengthValidator(4, errorText: 'Name must be at least 4 characters'),
  MaxLengthValidator(10, errorText: 'Name must be less than 12 characters')
]);
