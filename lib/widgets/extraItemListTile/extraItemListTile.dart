
import 'package:chiedoziedivine/models/ExtraItems.dart';
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MultiSelectListTile extends StatefulWidget {
  ExtraItems extraItem;
  AppState appState;

  MultiSelectListTile({Key key, this.extraItem, this.appState})
      : super(key: key);

  @override
  _MultiSelectListTileState createState() => _MultiSelectListTileState();
}

class _MultiSelectListTileState extends State<MultiSelectListTile> {
  bool isSelected = false;

  Widget build(BuildContext context) {
    return ListTile(
        selected: isSelected,
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.lora(
                textStyle: TextStyle(color: Color(0xff3E3E3E), fontSize: 15)),
            children: <TextSpan>[
              TextSpan(
                text: '${widget.extraItem.name} ',
              ),
              TextSpan(
                  text:
                      "${int.parse(widget.extraItem.price) > 0 ? "(\$${widget.extraItem.price})" : ""}",
                  style: TextStyle(color: Color(0xff979797), fontSize: 13)),
            ],
          ),
        ),
        trailing: isSelected
            ? Icon(Icons.radio_button_checked)
            : Icon(Icons.radio_button_off),
        onTap: () {
          if (isSelected) {
            print("un select");
            setState(() => isSelected = false);
            if (widget.appState.selectedMultiSelectListItem
                .contains(widget.extraItem.id))
              widget.appState.selectedMultiSelectListItem.remove(widget.extraItem.id);
          } else {
            print(" select");
            setState(() => isSelected = true);
            if (!(widget.appState.selectedMultiSelectListItem
                .contains(widget.extraItem.id)))
              widget.appState.selectedMultiSelectListItem.add(widget.extraItem.id);
          }
          print(widget.appState.selectedMultiSelectListItem);
        });
  }
// return makeListItem(widget.Visitor);
}
