import 'package:db_username_suggester/src/db_username_suggester_field.dart';
import 'package:db_username_suggester/src/username_generate_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'common_colors.dart';
import 'common_text_style.dart';

class DbUsernameSuggesterTextFieldState extends State<DbUsernameSuggesterField> {
  late List<String> generatedUserNames=[];
  late TextEditingController controller;
  bool userNameExist = false;

  @override
  void initState() {
    super.initState();
    generatedUserNames = [];
    controller = TextEditingController();
    controller.addListener(_checkUsername);
  }


  void _checkUsername() async {
    userNameExist = await widget.checkUsernameInDb.call(controller.text) ?? false;
    if (userNameExist) {
      generatedUserNames = UserNameGeneratorList.generateList(controller.text);
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return _userNameTextField();
  }

  Widget _userNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          Text(
            widget.label??'',
            textAlign: TextAlign.start,
            style: CommonTextStyle.normalStyle,
          ),
        if (widget.label != null) const Gap(10),
        TextFormField(
          onTap: widget.onTap??() {},
          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
          maxLines: widget.maxLines ?? 1,
          minLines:widget.minLines ?? 1,
          maxLength:widget.maxLength ?? 20,
          textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
          readOnly:  widget.readOnly ?? false,
          keyboardType: widget.textInputType,
          controller: controller,
          textAlign: TextAlign.left,
          onChanged:widget.onChange ?? (value) {},
          onFieldSubmitted: widget.onSubmitted ??(value) {},
          validator: widget.validator,
          obscureText:  widget.obscureText ?? false,
          inputFormatters: widget.inputFormatters ?? [],
          autovalidateMode:  widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
          cursorColor: CommonColors.backButtonColor,
          textInputAction: widget.textInputAction,
          initialValue:  widget.initialText,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            counterText: '',
            alignLabelWithHint: false,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: widget.suffixIconColor ?? CommonColors.backButtonColor,
            contentPadding: widget.contentPadding ?? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
            prefixIcon: widget.prefixIcon,
            errorText: widget.errorText,
            hintText: widget.hintText,
            isDense: false,
            filled: true,
            fillColor: widget.fillColor ?? CommonColors.whiteColor,
            hintStyle: widget.hintTextStyle?? CommonTextStyle.normalStyle.copyWith(color: Colors.black),
            errorStyle: widget.errorTextStyle,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color:  widget.borderColor?? CommonColors.backButtonColor,
              ), //<-- SEE HERE
              borderRadius:  widget.borderRadius ??
                  BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color:  widget.borderColor?? CommonColors.backButtonColor,
              ), //<-- SEE HERE
              borderRadius:  widget.borderRadius ??
                  BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color:  widget.borderColor?? CommonColors.backButtonColor,
              ), //<-- SEE HERE
              borderRadius:  widget.borderRadius ??
                  BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color:  widget.borderColor ??CommonColors.backButtonColor,
              ), //<-- SEE HERE
              borderRadius:  widget.borderRadius ??
                  BorderRadius.circular(30),
            ),
          ),
        ),
        const Gap(25),
        if (userNameExist)
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.start,
              children: generatedUserNames.map(
                    (e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.text = e;
                      generatedUserNames.clear();
                    });
                  },
                  child: Theme(
                    data: ThemeData(
                      primaryColor: CommonColors.backButtonColor,
                      primaryColorDark: CommonColors.redButtonColor,
                    ),
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: CommonColors.redButtonColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                      label: Text(
                        e,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: "DmSans",
                        ),
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),

      ],
    );
  }

  @override
  void dispose() {
    controller.removeListener(_checkUsername);
    controller.dispose();
    super.dispose();
  }

}