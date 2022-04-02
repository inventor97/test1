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
    this.selectedValue,
    required this.loadable,
    this.hasInternet,
    this.onUpdate
  }) : super(key: key);

  final List<String> items;
  final String label;
  final onChanged;
  final String hint;
  final String? selectedValue;
  final bool loadable;
  final bool? hasInternet;
  final onUpdate;

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 35.0),
          child: Text(widget.label, style: MyTextStyles.montserrat500(fontSize: 7, color:  Colors.white)),
        ),
        SizedBox(height: SizeConfig.v),
        DropdownButtonFormField(
          value: widget.selectedValue,
          focusNode: _focusNode,
          onTap: _requestFocus,
          items: widget.items.map( (e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e,style: MyTextStyles.montserrat500(fontSize: 7, color:  Colors.white)),
            );
          }).toList(),
          // isDense: false,
          onChanged: widget.onChanged,
          onSaved: widget.onChanged,
          isExpanded: true,
          dropdownColor: MyColors.color600,
          iconSize: SizeConfig.v*4,
          icon: widget.loadable?
              widget.hasInternet??true? const CircularProgressIndicator(color: Colors.white, strokeWidth: 1.5) : IconButton(
                  onPressed: widget.onUpdate,
                  icon: const Icon(Icons.refresh_outlined, color: Colors.white))
              : const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          decoration: InputDecoration(
            fillColor: MyColors.color600,
            hintStyle: MyTextStyles.montserrat500(color: MyColors.subTextColor),
            hintText: widget.hint,
            border:  OutlineInputBorder(
                borderSide: const BorderSide(color: MyColors.color500, width: 2),
                borderRadius: BorderRadius.circular(50.0)
            ),
            focusedBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(color: MyColors.color500,width: 2),
            ),
          ),
        )
      ],
    );
  }
}
