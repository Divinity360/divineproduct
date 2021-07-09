
import 'package:chiedoziedivine/models/ExtraItems.dart';
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleSelectListTile extends StatefulWidget {
  ExtraItems extraItem;
  AppState appState;

  SingleSelectListTile({Key key, this.extraItem, this.appState})
      : super(key: key);

  @override
  _SingleSelectListTileState createState() => _SingleSelectListTileState();
}

class _SingleSelectListTileState extends State<SingleSelectListTile> {
  bool isSelected = false;

  Widget build(BuildContext context) {
    return RadioListTile(
      groupValue: widget.appState
          .selectedSingleSelectListItem,
      controlAffinity: ListTileControlAffinity.trailing,
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.lora(
              textStyle: TextStyle(
                  color: Color(0xff3E3E3E),
                  fontSize: 15)),
          children: <TextSpan>[
            TextSpan(
              text: '${widget.extraItem.name} ',
            ),
            TextSpan(
                text:
                "${int.parse(widget.extraItem.price) > 0 ? "(\$${widget.extraItem.price})" : ""}",
                style: TextStyle(
                    color: Color(0xff979797),
                    fontSize: 13)),
          ],
        ),
      ),
      value: widget.extraItem.id,
      onChanged: (val) {
        setState(() => widget.appState
            .selectedSingleSelectListItem =
            val);
      },
    );
  }
// return makeListItem(widget.Visitor);
}
