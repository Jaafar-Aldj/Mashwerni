import 'package:flutter/material.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? hideText;
  final bool? arabic;
  final void Function()? onTapIcon;
  final void Function(String)? onChanged;
  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.hideText,
    this.arabic,
    this.onTapIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        textDirection: arabic == null || arabic == false
            ? TextDirection.ltr
            : TextDirection.rtl,
        onChanged: onChanged,
        obscureText: hideText == null || hideText == false ? false : true,
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: onTapIcon,
            child: Icon(iconData),
          ),
          suffixIconColor: AppColor.primary,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
