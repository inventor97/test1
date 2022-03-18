import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/utils/utils.dart';

class RegionDropDown extends StatefulWidget {
  const RegionDropDown({
    Key? key,
    required this.items,
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.onSaved,
    this.selectedValue,
  }) : super(key: key);

  final List<String> items;
  final String label;
  final onChanged;
  final onSaved;
  final String hint;
  final String? selectedValue;

  @override
  _RegionDropDownState createState() => _RegionDropDownState();

}

class _RegionDropDownState extends State<RegionDropDown> {

  FocusNode _focusNode = FocusNode();

  void _requestFocus(){
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: widget.selectedValue,
        focusNode: _focusNode,
        onTap: _requestFocus,
        items: widget.items.map( (e) {
          return DropdownMenuItem(
          value: e,
          child: Text(e,style: Theme.of(context).textTheme.headline6),
        );
        }).toList(),
      isDense: false,

      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      isExpanded: true,
      decoration: InputDecoration(
        floatingLabelBehavior:FloatingLabelBehavior.always,
        hintStyle: MyTextStyles.montserrat500(color: MyColors.subTextColor),
        label: Text(widget.label,
            style: Theme.of(context).textTheme.headline6
          ),
          hintText: widget.hint,
          border:  OutlineInputBorder(
              borderSide: const BorderSide(color: MyColors.black, width: 2),
              borderRadius: BorderRadius.circular(20.0)
          ),
          focusedBorder:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: MyColors.color800,width: 2),
          ),
      ),
    );
  }
}
