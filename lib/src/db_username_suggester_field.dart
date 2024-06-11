import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'db_username_suggester_text_field_state.dart';


typedef Validator = String? Function(String? validator);
typedef  OnTap = void Function();
typedef  OnChange = void Function(String? onChange);
typedef  OnSubmitted = void Function(String? onSubmitted) ;
typedef CheckUsernameInDb = Future<bool>? Function(String userName);

class DbUsernameSuggesterField extends StatefulWidget {
  final String? label;
  final TextStyle? textStyle;
  final OnTap? onTap;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final TextInputType? textInputType;
  final OnChange? onChange;
  final OnSubmitted? onSubmitted;
  final Validator validator;
  final CheckUsernameInDb checkUsernameInDb;
  final bool? obscureText;
  final bool isInputFormatters;
  final TextInputAction? textInputAction;
  final String? initialText;
  // final ApiUrl apiUrl;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final String? errorText;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final Color? suffixIconColor;
  final TextStyle? hintTextStyle;
  final TextStyle? errorTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final BorderRadius? borderRadius;

  const DbUsernameSuggesterField({
    this.prefixIcon,
    this.maxLength,
    this.textCapitalization,
    this.hintText,
    this.borderRadius,
    this.textInputType,
    this.onTap,
    this.fillColor,
    this.suffixIconColor,
    this.borderColor,
    this.obscureText,
    required this.validator,
    required this.checkUsernameInDb,
    // required this.apiUrl,
    this.onChange,
    this.suffixIcon,
    this.readOnly,
    this.autoValidateMode,
    this.maxLines,
    this.label,
    this.textStyle,
    this.minLines,
    this.onSubmitted,
    this.inputFormatters,
    this.isInputFormatters = false,
    this.textInputAction,
    this.initialText,
    this.contentPadding,
    this.errorText,
    this.hintTextStyle,
    super.key,
    this.errorTextStyle,
  });

  @override
  State<StatefulWidget> createState() {
    return DbUsernameSuggesterTextFieldState();
  }

}

