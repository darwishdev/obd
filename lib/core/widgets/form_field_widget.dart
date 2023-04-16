import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:obd/theme/dimensions.dart';

class FormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;
  final bool editingForm;
  final bool readOnly;
  final String? labelText;
  final String? icon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextAlign textAlign;
  final Color fillColor;
  final Color disabledColor;
  final Color borderColor;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final AutovalidateMode? autoValidateMode;
  final bool obscureText;
  final void Function(String)? onChanged;

  const FormFieldWidget({
    Key? key,
    required this.controller,
    this.validator,
    this.editingForm = true,
    this.labelText,
    this.readOnly = false,
    this.icon,
    this.suffixWidget,
    this.prefixWidget,
    this.textAlign = TextAlign.start,
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
    this.disabledColor = Colors.blueGrey,
    this.onTap,
    this.onFieldSubmitted,
    this.textInputType,
    this.inputFormatters,
    this.maxLines,
    this.maxLength,
    this.autoValidateMode,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.kSizeSmall,
        horizontal: AppDimensions.kSizeMedium,
      ),
      child: TextFormField(
        autovalidateMode:
            autoValidateMode ?? AutovalidateMode.onUserInteraction,
        textAlign: textAlign,
        onChanged: onChanged,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        obscureText: obscureText,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        controller: controller,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: editingForm ? fillColor : Colors.grey[200],
          enabled: editingForm,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.kMediumRadius),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.kMediumRadius),
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.kMediumRadius),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.kMediumRadius),
            borderSide: BorderSide(color: Colors.red),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.kMediumRadius),
            borderSide: BorderSide(color: disabledColor),
          ),
          prefixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsets.all(AppDimensions.kSizeMedium),
                  child: SvgPicture.asset(
                    icon!,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : prefixWidget,
          suffixIcon: suffixWidget,
        ),
      ),
    );
  }
}
