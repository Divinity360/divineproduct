
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/widgets/extraItemListTile/extraItemListTile.dart';
import 'package:chiedoziedivine/widgets/primaryButton/primaryButton.dart';
import 'package:chiedoziedivine/widgets/singleItemListTile/singleItemListTile.dart';

import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailModal extends StatefulWidget {
  static const routeName = '/ProductDetailModal';

  @override
  _ProductDetailModalState createState() => _ProductDetailModalState();
}

class _ProductDetailModalState extends State<ProductDetailModal> {
  int _selectedItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppState>(context, listen: false).loadData(context);
    return Consumer<AppState>(
        builder: (context, appState, child) => appState.product != null
            ? Scaffold(
                backgroundColor: AppColors.OUTLINE_FADED,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(appState.product.images.fullSize,
                          width: MediaQuery.of(context).size.width,
                          height: 230, fit: BoxFit.cover),
                      SizedBox(
                        height: 10,
                      ),
                      HeadingText(
                        appState.product.name,
                        textStyle: TextStyle(color: Color(0xff3E3E3E)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      BodyText(
                        appState.product.description,
                        textStyle:
                            TextStyle(color: Color(0xff919191), fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadingText(
                            " \$ ${appState.totalPrice}",
                            textStyle: TextStyle(color: Color(0xff3E3E3E)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              MaterialButton(
                                onPressed: () => appState.decrementCounter(),
                                height: 27,
                                minWidth: 40,
                                color: Color(0xffACACB1),
                                textColor: Colors.white,
                                child: Icon(
                                  Icons.remove,
                                  size: 24,
                                ),
                                shape: CircleBorder(),
                              ),
                              Text(appState.counter.toString()),
                              MaterialButton(
                                onPressed: () => appState.incrementCounter(),
                                height: 27,
                                minWidth: 40,
                                color: Color(0xff9A6F4C),
                                textColor: Colors.white,
                                child: Icon(
                                  Icons.add,
                                  size: 24,
                                ),
                                shape: CircleBorder(),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        color: Color(0xffF1F1F1),
                        height: 60,
                        padding: EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                    color: Color(0xff3E3E3E), fontSize: 15)),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${appState.product.extras.elementAt(0).name.toUpperCase()} ',
                              ),
                              TextSpan(
                                  text: int.parse(appState.product.extras
                                              .elementAt(0)
                                              .min) >=
                                          0
                                      ? '(REQUIRED)'
                                      : "",
                                  style: TextStyle(color: Color(0xff979797))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xffE4E4E4),
                        height: 40,
                        padding: EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: BodyBoldText(
                          int.parse(appState.product.extras.elementAt(0).min) >=
                                      0 &&
                                  int.parse(appState.product.extras
                                          .elementAt(0)
                                          .max) >
                                      0
                              ? "Please select ${appState.product.extras.elementAt(0).max} item"
                              : "",
                          textStyle:
                              TextStyle(color: Color(0xff454545), fontSize: 12),
                        ),
                      ),
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: appState.product.extraItems
                            .map((extraItem) =>
                                appState.product.extras.elementAt(0).max == "1"
                                    ? SingleSelectListTile(
                                        appState: appState,
                                        extraItem: extraItem)
                                    : MultiSelectListTile(
                                        extraItem: extraItem,
                                        appState: appState,
                                      ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.white,
                              size: 21,
                            ),
                            Text(
                              "ADD ${appState.counter} TO CART",
                              style: GoogleFonts.lora(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$ ${appState.totalPrice}",
                              style: GoogleFonts.lora(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        buttonColor: Color(0xff372A22),
                        onTap: () {
                          validate(appState, context);
                        },
                      )
                    ],
                  ),
                ),
                floatingActionButton: new FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xffABABB0),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startTop,
              )
            : Container());
  }

  void validate(AppState appState, BuildContext context) {
    int extraMaximum = int.parse(
        appState.product.extras.elementAt(0).max);
    int extraMinimum = int.parse(
        appState.product.extras.elementAt(0).min);
    if (extraMinimum >= 0) {
      if (extraMaximum == 1 &&
          appState.selectedSingleSelectListItem != null) {
        showToast(
            "Successfully added item to cart", context);
      } else if (extraMaximum > 1 &&
          appState.selectedMultiSelectListItem.length <=
              extraMaximum) {
        showToast(
            "Successfully added items to cart", context);
      } else
        showToast("Invalid number of items", context);
    } else
      showToast("An item must be selected", context);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast(
      String title, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
    ));
  }
}
