import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/aircondition/main/aurcondititioncity_mainpage.dart';
import 'package:czestochowa_app/views/districts/main/districts_mainpage.dart';
import 'package:czestochowa_app/views/weather/main/weather_homepage.dart';
import 'package:czestochowa_app/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/strings/strings.dart';
import '../../widgets/appbars/appbars.dart';
import '../../widgets/text_styles.dart';
import 'bloc/home_page_bloc.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

  static BlocProvider withBlocProvider() {
    return BlocProvider<HomePageBloc>(
      create: (context) => HomePageBloc(),
      child: const HomePage(),
    );
  }
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  bool _isEULADialogShown = false;

  @override
  Widget build(BuildContext context) {
    void initState() {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomePageBloc(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.basebuttonColor,
      appBar: CustomAppbarMain(),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/czestochowa.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: _buildGotoAirCondition()),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: _buildGotoDiscritsc()),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: _buildGotoWeather()),
                ],
              ),
            )),
      ),
    ));
  }

  Widget _buildRow({Widget? child}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: child,
    );
  }

  Widget _buildGotoAirCondition() {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: BaseButton(
            color: Theme.of(context).colorScheme.basebuttonColor,
            textView: Text(Str.buttons.aircondition,
                style: TextStyles.overline(
                    color: Theme.of(context).colorScheme.fontblacktext,
                    context: context)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AirConditionCityMainPage()),
              );
            },
          ));
    });
  }

  Widget _buildGotoDiscritsc() {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: BaseButton(
            color: Theme.of(context).colorScheme.basebuttonColor,
            textView: Text(Str.buttons.gotoczestochowadustrict,
                style: TextStyles.overline(
                    color: Theme.of(context).colorScheme.fontblacktext,
                    context: context)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DistrictsPageMain()),
              );
            },
          ));
    });
  }

  Widget _buildGotoWeather() {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: BaseButton(
            color: Theme.of(context).colorScheme.basebuttonColor,
            textView: Text(Str.buttons.gotowatherforecast,
                textAlign: TextAlign.left,
                style: TextStyles.overline(
                    color: Theme.of(context).colorScheme.fontblacktext,
                    context: context)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WeatherHomePage()),
              );
            },
          ));
    });
  }
}
