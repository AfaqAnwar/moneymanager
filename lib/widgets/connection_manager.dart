import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanager/data/user.dart';
import 'package:moneymanager/utils/colors.dart';
import 'package:moneymanager/widgets/transaction_item%20mini.dart';
import 'package:loop_page_view/loop_page_view.dart';

// ignore: prefer_typing_uninitialized_variables
var connectedNames;

Widget buildConnectionManager(BuildContext context) {
  return Expanded(
    child: Center(
      child: LoopPageView.builder(
          itemCount: CurrentUser.connectedUsers.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            'Your Connections',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 36,
                              color: AppColor.customLightGreen,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.arrow_right_arrow_left_circle,
                        size: 32.0,
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Text(
                      "${CurrentUser.connectedUsers[index].keys.elementAt(0)}'s Recent Transactions",
                      style: GoogleFonts.roboto(
                          fontSize: 14, color: AppColor.customDarkGreen),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: buildConnectionTiles(index),
                    )
                  ]),
            );
          }),
    ),
  );
}

List<Widget> buildConnectionTiles(int index) {
  List<Widget> widgets = [];
  connectedNames = CurrentUser.connectedUsers[index].keys;
  for (int i = 0;
      i < CurrentUser.connectedUsers[index].values.elementAt(0).length;
      i++) {
    Widget widget = Row(children: [
      Expanded(
        child: Column(children: [
          TransactionItemMini(
              transaction:
                  CurrentUser.connectedUsers[index].values.elementAt(0)[i]),
          const SizedBox(height: 10)
        ]),
      )
    ]);

    widgets.add(widget);
  }
  return widgets;
}
