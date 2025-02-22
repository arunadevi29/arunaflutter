import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class AppbarName extends StatefulWidget {
  var title;
  var leading;
  var actions;

  AppbarName({super.key, this.title, this.leading, this.actions});

  @override
  State<AppbarName> createState() => _AppbarNameState();
}

class _AppbarNameState extends State<AppbarName> {
  @override
  SampleItem? selectedItem;
  final String title = "";
  final String leading = "";
  final String actions = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 220, top: 20),
            //   child: IconButton(
            //     icon: const Icon(
            //       Icons.search,
            //       size: 20,
            //     ),
            //     //tooltip: 'Setting Icon',
            //     onPressed: () {
            //       showSearch(
            //           context: context, delegate: CustomSearchDelegate());
            //     },
            //   ),
            // ),
          ],
        ),
        leading: widget.leading,
      ),
    );
  }
}
