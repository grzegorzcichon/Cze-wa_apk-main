import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/information/main/device_info_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/strings/strings.dart';
import '../text_styles.dart';

class CustomAppbarMain extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.transparent,
      title: Center(
          child: Text(Str.label.welcome,
              style: TextStyles.overline(
                  color: Theme.of(context).colorScheme.fontblacktext,
                  context: context))),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actions: [
        PopupMenuButton(
            icon: Icon(Icons.info_outlined),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(Str.label.sendanemail),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(Str.label.deviceinfo),
                ),
              ];
            },
            onSelected: (dynamic value) {
              if (value == 0) {
                launch('mailto:grzegorz@cichon.dev?'
                    'subject=Aplkacja "O Częstochowie"');
              } else if (value == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BugInfoPage()));
              }
            })
      ],
      shadowColor: Color.fromARGB(255, 246, 218, 127),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}

class CustomAppbarDistrictsScreen extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.appBarcolor,
        title: Center(
            child: FittedBox(
          fit: BoxFit.scaleDown, // Skaluje tekst do szerokości AppBar
          child: Text(Str.label.chosedistricts,
              textAlign: TextAlign.center,
              style: TextStyles.overline(
                  color: Theme.of(context).colorScheme.fontblacktext,
                  context: context)),
        )),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ));
    //Navigator.of(context, rootNavigator: true).pop(context)));
  }
}

class CustomAppbarAirConditionScreen extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.appBarcolor,
        title: Center(
            child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(Str.label.airconditioninform,
              style: TextStyles.overline(
                  color: Theme.of(context).colorScheme.fontblacktext,
                  context: context)),
        )),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ));
  }
}

class CustomAppbarDeviceInfoScreen extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.appBarcolor,
        title: Center(
            child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(Str.label.deviceinformationappbar,
              textAlign: TextAlign.left,
              style: TextStyles.overline(
                  color: Theme.of(context).colorScheme.fontblacktext,
                  context: context)),
        )),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ));
    //Navigator.of(context, rootNavigator: true).pop(context)));
  }
}

class CustomAppbarWeatherScreen extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.appBarcolor,
        title: Center(
            child: FittedBox(
          fit: BoxFit.scaleDown, // Skaluje tekst do wielkości rodzica

          child: Text(Str.label.weather,
              style: TextStyles.overline(
                  color: Theme.of(context).colorScheme.fontblacktext,
                  context: context)),
        )),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ));
    //Navigator.of(context, rootNavigator: true).pop(context)));
  }
}
