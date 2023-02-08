import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

// Widget entryField(
//   String title, {
//   bool isPassword = false,
//   TextEditingController? controller,
//   bool require = false,
//   bool isDatePicker = false,
// }) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(
//           // height: 30,
//           child: Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//               ),
//               require == true
//                   ? Text(
//                       "(*)",
//                       style: TextStyle(color: Colors.red),
//                     )
//                   : Container()
//             ],
//           ),
//         ),
//         // SizedBox(
//         //   height: 8,
//         // ),
//         TextField(
//             onTap: () {
//               if (isDatePicker) {
//                 DatePicker.showDatePicker(context,
//                     showTitleActions: true,
//                     minTime: DateTime(2018, 3, 5),
//                     maxTime: DateTime(2019, 6, 7), onChanged: (date) {
//                   print('change $date');
//                 }, onConfirm: (date) {
//                   print('confirm $date');
//                 }, currentTime: DateTime.now(), locale: LocaleType.zh);
//               }
//             },
//             controller: controller,
//             obscureText: isPassword,
//             decoration: InputDecoration(
//                 //labelText: title ,  // you can change this with the top text  like you want
//                 hintText: "Nhập ${title.toLowerCase()}",
//                 hintStyle: TextStyle(fontSize: 16)
//                 // border: InputBorder.none,
//                 ))
//       ],
//     ),
//   );
// }

class entryField extends StatelessWidget {
  entryField(
    this.title, {
    this.isPassword = false,
    this.controller,
    this.require = false,
    this.isDatePicker = false,
  });
  String title;
  bool isPassword = false;
  TextEditingController? controller;
  bool require = false;
  bool isDatePicker = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            // height: 30,
            child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                require == true
                    ? Text(
                        "(*)",
                        style: TextStyle(color: Colors.red),
                      )
                    : Container()
              ],
            ),
          ),
          // SizedBox(
          //   height: 8,
          // ),
          TextField(
              onTap: () {
                if (isDatePicker) {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1950, 1, 1),
                      maxTime: DateTime.now(), onChanged: (date) {
                    //    controller?.text = "${date.day}/${date.month}/${date.year}";
                  }, onConfirm: (date) {
                    final df = new DateFormat('dd/MM/yyyy');
                    var timer = df.format(date);
                    // print("${date.day}/${date.month}/${date.year}");
                    controller?.text = timer.toString();
                  }, currentTime: DateTime.now(), locale: LocaleType.vi);
                }
              },
              readOnly: isDatePicker,
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                  //labelText: title ,  // you can change this with the top text  like you want
                  hintText: "Nhập ${title.toLowerCase()}",
                  hintStyle: TextStyle(fontSize: 16)
                  // border: InputBorder.none,
                  ))
        ],
      ),
    );
  }
}
