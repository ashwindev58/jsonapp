import 'package:flutter/material.dart';
import 'package:textfields/resources/countrycodes.dart';

class BorderTextFieldWithIcon extends StatelessWidget {
  const BorderTextFieldWithIcon(
      {Key? key,
      this.controller,
      this.obscureText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.colorTextField,
      this.hintTextColor,
      this.textFieldColor,
      this.validator,
      this.autofocus,
      this.onChanged,  this.isPassword=false})
      : super(key: key);
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final Color? colorTextField;
  final Color? hintTextColor;
  final Color? textFieldColor;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:  EdgeInsets.fromLTRB(20, 15, 20, 0),
      decoration: BoxDecoration(
          color: colorTextField ?? Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(3, 3),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          onChanged: onChanged,
          autofocus: autofocus ?? false,
          validator: validator,
          style: TextStyle(color: textFieldColor),
          controller: controller,
          obscureText: obscureText == null ? false : true,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: hintTextColor),
            hintText: "$hintText!",
            prefixIcon: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: prefixIcon),
            suffixIcon: suffixIcon,
            fillColor: Colors.grey,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class SimpleTextFieldWithBorder extends StatelessWidget {
  const SimpleTextFieldWithBorder(
      {Key? key,
      this.controller,
      required this.label,
      required this.bordercolor,
      this.validator,
    
      this.autofocus,
      this.onChanged, this.isPassword=false})
      : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  final Color? bordercolor;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: bordercolor ?? Colors.blueAccent)),
      child: TextFormField(
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label ?? "label",
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}

class TextFieldWithCountryMobileNo extends StatefulWidget {
  const TextFieldWithCountryMobileNo(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onChangedDropDown,
      this.selectedCountryCode,
      this.validator,
      this.autofocus,
      this.borderColor,
      this.colorOfTextBox,
      this.width})
      : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onChangedDropDown;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final String? selectedCountryCode;
  final Color? borderColor;
  final Color? colorOfTextBox;
  final double? width;

  @override
  State<TextFieldWithCountryMobileNo> createState() =>
      _TextFieldWithCountryMobileNoState();
}

class _TextFieldWithCountryMobileNoState
    extends State<TextFieldWithCountryMobileNo> {
  List<String> languageslist = [];
  List<String> uniquelanguageslist = [];

  @override
  void initState() {
    addLanguagesFromFileToList();
    super.initState();
  }

  void addLanguagesFromFileToList() {
    for (var i = 0; i < countryCodes.length; i++) {
      languageslist.add("+${countryCodes[i]["e164_cc"]}");
    }
    uniquelanguageslist = languageslist.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.colorOfTextBox == null
              ? Colors.white
              : widget.colorOfTextBox!,
          border: Border.all(
              width: widget.width ?? 1,
              color: widget.borderColor == null
                  ? Colors.grey
                  : widget.borderColor!),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: SizedBox(
              width: 80,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text(widget.selectedCountryCode == null
                      ? "+91"
                      : widget.selectedCountryCode!),
                  value: widget.selectedCountryCode ?? "+91",
                  onChanged: widget.onChangedDropDown,
                  items: uniquelanguageslist.map((language) {
                    return DropdownMenuItem(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0, right: 10),
            child: SizedBox(
              height: 25,
              width: 1,
              // color: Color.fromARGB(115, 33, 24, 24),
            ),
          ),
          Expanded(
              child: TextFormField(
            autofocus: widget.autofocus ?? false,
            onChanged: widget.onChanged,
            controller: widget.controller,
            keyboardType: TextInputType.number,
            // onChanged:
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Mobile Number",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
            validator: widget.validator,
          ))
        ],
      ),
    );
  }
}

class TextFieldWithCountryName extends StatefulWidget {
  const TextFieldWithCountryName(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onChangedDropDown,
      this.selectedCountryCode,
      this.validator,
      this.autofocus,
      this.borderColor,
      this.colorOfTextBox,
      this.width})
      : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onChangedDropDown;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final String? selectedCountryCode;
  final Color? borderColor;
  final Color? colorOfTextBox;
  final double? width;

  @override
  State<TextFieldWithCountryName> createState() =>
      _TextFieldWithCountryNameState();
}

class _TextFieldWithCountryNameState extends State<TextFieldWithCountryName> {
  List<String> languageslist = [];
  List<String> uniquelanguageslist = [];

  @override
  void initState() {
    addLanguagesFromFileToList();
    super.initState();
  }

  void addLanguagesFromFileToList() {
    for (var i = 0; i < countryCodes.length; i++) {
      languageslist.add("${countryCodes[i]["name"]}");
    }
    uniquelanguageslist = languageslist.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.colorOfTextBox == null
              ? Colors.white
              : widget.colorOfTextBox!,
          border: Border.all(
              width: widget.width ?? 1,
              color: widget.borderColor == null
                  ? Colors.grey
                  : widget.borderColor!),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text(widget.selectedCountryCode == null ||
                          widget.selectedCountryCode!.isEmpty
                      ? "India"
                      : widget.selectedCountryCode!),
                  value: widget.selectedCountryCode == null ||
                          widget.selectedCountryCode!.isEmpty
                      ? "India"
                      : widget.selectedCountryCode,
                  onChanged: widget.onChangedDropDown,
                  items: uniquelanguageslist.map((countryname) {
                    return DropdownMenuItem(
                      value: countryname,
                      child: Text(countryname),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField(
      {Key? key,
      this.controller,
      this.label,
      required this.bordercolor,
      this.validator,
      this.autofocus,
      this.onChanged,
      required this.maxLines})
      : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final Color? bordercolor;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final Function(String)? onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: bordercolor ?? Colors.blueAccent)),
      child: TextFormField(
        maxLines: maxLines,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: InputBorder.none,
          labelText: label ?? "label",
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
