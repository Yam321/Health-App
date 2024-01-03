
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:healthapp/Widgets/custom_text_falid.dart';
import 'package:sizer/sizer.dart';

class CustomDropDown extends StatefulWidget {
  final bool isValidator;
  final String title;
  final String? validatorMessage;
  final bool isSearch;
  final String? hintSearch;
  final String? hintText;
  final Color? fillColor;
  final Color borderColor;
  final List<String> values;
  final String? dropdownValue;
  final TextEditingController controller;

  final Function(String?) onChanged;

  const CustomDropDown(
      {this.validatorMessage,
      required this.controller,
      this.dropdownValue,
      required this.title,
      required this.values,
      this.isSearch = false,
      this.borderColor = Colors.transparent,
      this.hintText,
      this.fillColor,
      this.isValidator = false,
      this.hintSearch,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownsState();
}

class _CustomDropDownsState extends State<CustomDropDown> {
  TextEditingController textEditingController = TextEditingController();

  String? dropdownValue;
  @override
  void initState() {
    super.initState();
    if (widget.dropdownValue != null) {
      dropdownValue = widget.dropdownValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          child: Row(
            children: [
              CustomText(
                textData: widget.title,
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
        DropdownButtonFormField2<String>(
          validator: widget.isValidator
              ? (input) {
                  if (input == null) {
                    return widget.validatorMessage!;
                  }
                  return null;
                }
              : null,
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
          dropdownSearchData: widget.isSearch
              ? DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 5.h,
                  searchMatchFn: (item, searchValue) {
                    return item.value!.toString().contains(searchValue);
                  },
                  searchInnerWidget: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: CustomTextField(
                      textInputType: TextInputType.name,
                      fillColor: AppColors.textFieldColor,
                      hintText: widget.hintSearch,
                      controller: textEditingController,
                    ),
                  ))
              : null,
          dropdownStyleData: DropdownStyleData(
            
            maxHeight: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              color: AppColors.whiteColor,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: Radius.circular(5.w),
              thumbColor:
                  const MaterialStatePropertyAll(AppColors.primaryColor),
              thickness: MaterialStateProperty.all(2.w),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          isExpanded: true,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: widget.fillColor != null,
            fillColor: widget.fillColor,
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7E7E7), width: 1),
              borderRadius: BorderRadius.circular(2.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7E7E7), width: 1),
              borderRadius: BorderRadius.circular(2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7E7E7), width: 1),
              borderRadius: BorderRadius.circular(2.w),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.w),
                borderSide: const BorderSide(color: Colors.red)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.w),
                borderSide:
                    const BorderSide(color: Color(0xFFE7E7E7), width: 1)),
            contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10),
            alignLabelWithHint: true,
            counterText: '',
            hintStyle: const TextStyle(color: Color(0xFF8A8A8A)),
            errorStyle: const TextStyle(height: 1.5),
          ),
          value: widget.dropdownValue,
          style: const TextStyle(
            color: AppColors.primaryColor, 
            overflow: TextOverflow.ellipsis,
          ),
          items: widget.values.map((value) {
            return DropdownMenuItem(
                value: value,
                child: CustomText(
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textData: value,
                  textColor: Colors.black,
                ));
          }).toList(),
          onChanged: (newValue) {
            widget.onChanged(newValue);
          },
        ),
      ],
    );
  }
}
