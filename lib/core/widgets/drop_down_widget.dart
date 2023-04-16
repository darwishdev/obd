import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:obd/theme/dimensions.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String? validatorMessage;
  final String title;
  final List<T> items;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final String? icon;
  final T? value;
  final String Function(T) itemAsString;
  final void Function(T?) onChanged;
  final bool Function(T, T)? compareFn;
  final Future<List<T>> Function(String)? asyncItems;
  final bool showSelectedItems;
  final bool enabled;

  const DropDownWidget({
    Key? key,
    this.validatorMessage,
    required this.title,
    this.items = const [],
    required this.onChanged,
    required this.itemAsString,
    this.compareFn,
    this.asyncItems,
    this.showSelectedItems = false,
    this.enabled = true,
    this.fillColor,
    this.hintColor,
    this.borderColor,
    this.icon,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      asyncItems: asyncItems,
      validator: (value) {
        if (value == null && validatorMessage != null) {
          return validatorMessage;
        }
        return null;
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: title,
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: hintColor,
                fontSize: AppDimensions.kSizeLarge,
              ),
          fillColor: fillColor ?? Colors.grey,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.71),
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.71),
              ),
              borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.71),
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.71),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      items: items,
      itemAsString: itemAsString,
      onChanged: onChanged,
      selectedItem: value,
      compareFn: compareFn,
      enabled: enabled,
      dropdownButtonProps: const DropdownButtonProps(color: Colors.grey),
      clearButtonProps: const ClearButtonProps(isVisible: true),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: showSelectedItems,
        isFilterOnline: true,
        // menuProps: const MenuProps(
        //   backgroundColor: AppColors.cardDetailsBackground,
        // ),
      ),
    );
  }
}
