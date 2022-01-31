import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart';

changeStatusColor(Color color) {
  StatusBar.color(color);
}

launchScreen(context, String tag, {Object? arguments}) {
  if (arguments == null) {
    Navigator.pushNamed(context, tag);
  } else {
    Navigator.pushNamed(context, tag, arguments: arguments);
  }
}

back(var context) {
  Navigator.pop(context);
}


// toCapitalized(var content) {
//   return content != ""
//       ? content.replaceFirst(content[0], content[0].toUpperCase())
//       : "";
// }

// toTitleCase(var content) {
//   return content != ""
//       ? content
//           .replaceAll(RegExp(' +'), ' ')
//           .split(' ')
//           .map((content) => toCapitalized(content))
//           .join(' ')
//       : "";
// }

// toLowerCase(var content){
//   return content != "" ?
//   content.toLowerCase() : "" ;

// }
