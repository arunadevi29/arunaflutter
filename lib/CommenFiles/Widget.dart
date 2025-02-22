import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'functions.dart';

Widget titleBoxCard(
    {required String text, required IconData icon, required ontab}) {
  return GestureDetector(
    onTap: ontab,
    child: Container(
      height: 210,
      width: MediaQuery
          .sizeOf(Get.context!)
          .width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 8,
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget doctorListCard(
    {required String text, required IconData icon, required ontab}) {
  return GestureDetector(
    onTap: ontab,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 8,
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.indigo[600],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(
                    fontSize: contentSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

AppBar appbar({screens}) {
  return AppBar(
    backgroundColor: primaryColor,
    leading: handleGestureAction(screens: screens),
    centerTitle: true,
    title: Text(
      screens,
      style: TextStyle(
          fontSize: headingSize,
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
    actions: const [
      Icon(
        Icons.notification_add,
        color: Colors.white,
        size: 30,
      ),
      SizedBox(
        width: 10,
      )
    ],
  );
}

/// Appbar leading button
handleGestureAction({screens}) {
  switch (screens) {
    case 'Dashboard':
      return GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      );

    default:
      return GestureDetector(
        onTap: () {
          // patientDetailsController.onClose();

          Get.back();
        },
        child: const Icon(
          Icons.navigate_before_outlined,
          color: Colors.white,
          size: 30,
        ),
      );
  }
}

Widget buttonWidget({required void Function() onPress,
  required String text,
  buttonTextSize,
  width,
  height,
  icon,
  bool? isLoading}) {
  return SizedBox(
    width: width ?? MediaQuery
        .sizeOf(Get.context!)
        .width * 0.9,
    height: height ?? 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(16), // Rectangular border radius
          ),
          backgroundColor: primaryColor),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: buttonTextSize ?? contentSize),
            ),
          ),
          CircleAvatar(
            backgroundColor: secondarycolor,
            child: isLoading ?? false
                ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 4.0,
                  // color: Colors.red,
                ))
                : (icon ??
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )),
          )
        ],
      ),
    ),
  );
}

Widget buttonWidgetSmall({required void Function() onPress,
  required String text,
  buttonTextSize,
  width,
  height,
  icon}) {
  return SizedBox(
    width: width ?? MediaQuery
        .sizeOf(Get.context!)
        .width * 0.9,
    height: height ?? 50,
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: buttonTextSize ?? contentSize),
              ),

              // if()...[]
              // icon ??
              //     const Icon(
              //       Icons.arrow_forward,
              //       color: Colors.white,
              //       size: 20,
              //     )
            ],
          ),
        ),
      ),
    ),
  );
}

/// commonText field
// Widget textField(
//     {required TextEditingController AddContractor,
//     required String label,
//     required String hint,
//     heading,
//     headingSize,
//     required String? Function(String?) validate,
//     focusNode,
//     prefixIcon,
//     suffixIcon,
//     obscureText,
//     keyboardLength,
//     TextInputType? keyboardType,
//     void Function()? ontab,
//     void Function(String)? onFieldSubmited,
//     required BuildContext context,
//     key}) {
//   return Padding(
//     padding: const EdgeInsets.all(5.0),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         heading != null
//             ? Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 child: Text(
//                   heading,
//                   style: TextStyle(
//                       fontSize: headingSize ?? contentSize,
//                       fontWeight: FontWeight.bold),
//                 ),
//               )
//             : Container(),
//         TextFormField(
//           obscureText: obscureText ?? false,
//           onTap: ontab,
//           focusNode: focusNode,
//           maxLength:
//               keyboardLength ?? getInputSettings(type: label)["maxLength"],
//           AddContractor: AddContractor,
//           decoration: inputDecoration(
//               prefixIcon: prefixIcon,
//               suffixIcon: suffixIcon,
//               label: label,
//               hint: hint,
//               prefix: label == "Mobile No" ? const Text("+ ") : const Text("")),
//           validator: validate,
//           // autovalidateMode: AutovalidateMode.onUserInteraction,
//           keyboardType:
//               keyboardType ?? getInputSettings(type: label)["keyboardType"],
//           inputFormatters: getInputSettings(type: label)["inputFormatters"],
//           onFieldSubmitted: onFieldSubmited,
//         ),
//       ],
//     ),
//   );
// }

InputDecoration inputDecoration({prefixIcon,
  suffixIcon,
  required String label,
  required String hint,
  required Text prefix}) {
  return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: label,
      hintText: hint,
      errorBorder: outlineInputBorder(color: Colors.red),
      focusedErrorBorder: outlineInputBorder(color: Colors.red),
      enabledBorder: outlineInputBorder(color: Colors.grey),
      focusedBorder: outlineInputBorder(color: const Color(0xff5669FF)),
      counterText: "",
      prefix: prefix);
}

// Widget textFieldSmall(
//   Function(String) onChange, {
//   required TextEditingController AddContractor,
//   required String label,
//   required double h,
//   required double w,
//   required String? Function(String?) validate,
//   required void Function(String) onFieldSubmited,
//   required void Function() ontab,
//   required FocusNode focusNode,
// }) {
//   return SizedBox(
//     height: h,
//     width: w,
//     child: TextFormField(
//       style: TextStyle(fontSize: contentSize),
//       focusNode: focusNode,
//       textAlign: TextAlign.center,
//       maxLength: getInputSettings(type: label)["maxLength"],
//       AddContractor: AddContractor,
//       decoration: InputDecoration(
//         labelText: label,
//         errorBorder: outlineInputBorder(color: Colors.red),
//         focusedErrorBorder: outlineInputBorder(color: Colors.red),
//         enabledBorder: outlineInputBorder(color: Colors.blue),
//         focusedBorder: outlineInputBorder(color: Colors.green),
//         counterText: "",
//       ),
//       validator: validate,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onChanged: onChange,
//       keyboardType: getInputSettings(type: label)["keyboardType"],
//       inputFormatters: getInputSettings(type: label)["inputFormatters"],
//       onFieldSubmitted: onFieldSubmited,
//       onTap: ontab,
//     ),
//   );
// }

OutlineInputBorder outlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2.0),
    borderRadius: BorderRadius.circular(10.0),
  );
}

Widget togleButton({
  required dynamic AddContractor,
  required String headingText,
  required void Function(bool) onchanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Transform.scale(
        alignment: Alignment.centerLeft,
        scale: 0.8,
        child: Switch(
          value: AddContractor,
          onChanged: onchanged,
        ),
      ),
      Text(
        headingText,
        style: TextStyle(fontSize: contentSize - 3),
      ),
    ],
  );
}

Widget headingContainer(
    {required Widget widget, height, required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      ),
      color: primaryColor,
    ),
    height: height ?? MediaQuery
        .sizeOf(context)
        .height * 0.25,
    width: MediaQuery
        .sizeOf(context)
        .width,
    child: widget,
  );
}

Widget headingWidget({required String title, align, color}) {
  return Align(
    alignment: align ?? Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(
          color: color ?? primaryColor,
          fontSize: headingSize - 3,
          fontWeight: FontWeight.w700),
    ),
  );
}

Widget smallBoxWidget(
    {required void Function()? ontap, lable, AddContractor, height, width}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        height: height ?? 50,
        width: width ?? 50,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
            child: Text(
              AddContractor.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: contentSize),
            )),
      ),
    ),
  );
}

// AppBar appBar({
//   bool? showLeadingIcon,
//   String? title,
// }) {
//   return AppBar(
//     backgroundColor: primaryColor,
//     leading: showLeadingIcon ?? true
//         ? IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_rounded,
//               color: Colors.white,
//             ))
//         : null,
//     automaticallyImplyLeading: false,
//     title: WinngooText(
//       text: title ?? "",
//       color: Colors.white,
//       fontSize: headingSize,
//     ),
//     actions: [
//       Builder(
//         builder: (BuildContext context) {
//           return IconButton(
//             icon: const Icon(
//               Icons.menu,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Scaffold.of(context)
//                   .openEndDrawer(); // Open the right-side drawer
//             },
//           );
//         },
//       ),
//       // Removed duplicate menu icon
//       const SizedBox(
//         width: 10,
//       )
//     ],
//   );
// }
//
// Widget customAppbar({required bool menu, required String title}) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
//     child: WinngooBox(
//       fillColor: primaryColor,
//       radius: 20,
//       height: 60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           iconButton(
//               icon: Icons.arrow_back,
//               title: title,
//               onpress: () {
//                 Get.back();
//               }),
//           if (menu == true) ...[
//             Builder(
//               builder: (BuildContext innerContext) => IconButton(
//                 onPressed: () {
//                   Scaffold.of(innerContext).openEndDrawer();
//                 },
//                 icon: const Icon(
//                   Icons.menu,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ] else ...[
//             Container()
//           ]
//         ],
//       ),
//     ),
//   );
// }

SnackbarController snackBar({
  required String msg,
  required bool isBadReqested,
}) {
  return Get.snackbar(
    isBadReqested ? "Sorry" : "Success!",
    msg,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    backgroundColor: isBadReqested ? Colors.red : Colors.green,
    colorText: Colors.white,
    borderRadius: 10,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    icon: isBadReqested
        ? const Icon(Icons.error_outline_rounded, color: Colors.white)
        : const Icon(Icons.check_circle, color: Colors.white),
  );
}
