import 'dart:convert';
import 'dart:io';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/aircondition/c6h6/page/C6H6-page.dart';
import 'package:czestochowa_app/views/aircondition/o3/page/O3-page.dart';
import 'package:czestochowa_app/views/aircondition/page/airconditionNO2_build.dart';
import 'package:czestochowa_app/views/aircondition/so2/page/SO2-page.dart';
import 'package:czestochowa_app/widgets/appbars/appbars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:http/http.dart' as http;

import '../../../resources/strings/strings.dart';
import '../../../widgets/text_styles.dart';
import '../page/airconditionCO_build.dart';
import '../page/airconditionPM10_build.dart';

class AirConditionCityMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext ct) {
    return Scaffold(
      body: AirConditionCityMainPageMain(),
    );
  }
}

class AirConditionCityMainPageMain extends StatefulWidget {
  @override
  State<AirConditionCityMainPageMain> createState() =>
      _AirConditionCityMainPageMainState();
}

class _AirConditionCityMainPageMainState
    extends State<AirConditionCityMainPageMain> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbarAirConditionScreen(),
      body: ListView(
        //physics: NeverScrollableScrollPhysics(),
        children: [
          if (isVisible)
            Container(
                margin: EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 5,
                child: _buildAirConditionContainerInfo()),
          Container(
              margin: EdgeInsets.only(left: 30),
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height ,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    // Container(
                    // width: MediaQuery.of(context).size.width / 1.2,
                    //child: _buildCOValue()),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: _buildNO2Value()),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: _buildO3Value()),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: _buildPM10Value()),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: _buildSO2Value()),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: _buildC6H6Value()),
                    Container(
                        margin: EdgeInsets.only(right: 30),
                        child: _buildImage()),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1,
                        child: _buildinfo())
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  Widget _buildAirConditionContainerInfo() {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: <Widget>[
          Container(
            //decoration: Border.all(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          Str.label.airconditioninfo,
                          style: TextStyleSS.overline(
                              color: Theme.of(context)
                                  .colorScheme
                                  .fontdistrictnametext,
                              context: context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          Str.label.airconditioninfoimage,
                          style: TextStyleSS.overline(
                            color: Theme.of(context)
                                .colorScheme
                                .fontdistrictnametext,
                            context: context,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          Str.label.airconditioninfoclose,
                          style: TextStyleSS.overline(
                            color: Theme.of(context)
                                .colorScheme
                                .fontdistrictnametext,
                            context: context,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => setState(() => isVisible = !isVisible),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow({Widget? child}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: child,
    );
  }

  Widget _buildO3Value({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height / 20,
                margin: EdgeInsets.only(bottom: 1.7),
                child: O3Page());
          }),
        ],
      ),
    )));
  }

  Widget _buildCOValue({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height / 105,
                margin: EdgeInsets.only(bottom: 1.7),
                child: GetCOValue());
          }),
        ],
      ),
    )));
  }

  Widget _buildNO2Value({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height / 45,
                margin: EdgeInsets.only(bottom: 1.7),
                child: GetNO2Value());
          }),
        ],
      ),
    )));
  }

  Widget _buildPM10Value({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height / 45,
                margin: EdgeInsets.only(bottom: 1.7),
                child: GetPM10Value());
          }),
        ],
      ),
    )));
  }

  Widget _buildSO2Value({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height / 15,
                margin: EdgeInsets.only(bottom: 1.7),
                child: SO2Page());
          }),
        ],
      ),
    )));
  }

  Widget _buildC6H6Value({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height / 15,
                //width: MediaQuery.of(context).size.width / 10,
                margin: EdgeInsets.only(bottom: 1.7),
                child: //GetC6H6Value()
                    C6H6Page());
          }),
        ],
      ),
    )));
  }

  Widget _buildinfo({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return SingleChildScrollView(
              //height: MediaQuery.of(context).size.height / 2,
              //margin: EdgeInsets.only(bottom: 1.7),
              child: Text(
                Str.label.aboutdata,
                style: TextStyleSS.overline(
                    color: Theme.of(context).colorScheme.fontdistrictnametext,
                    context: context),
              ),
            );
          }),
        ],
      ),
    )));
  }

  Widget _buildImage({Widget? child}) {
    return _buildRow(
      child: FullScreenWidget(
          disposeLevel: DisposeLevel.High,
          child: Container(
              // width: MediaQuery.of(context).size.width,
              //   margin: EdgeInsets.only(right: 30),
              //height: MediaQuery.of(context).size.height / 4,
              child: Image.asset(
            "assets/images/indeks.png",
            fit: BoxFit.fill,
          ))),
    );
  }

  _buildTableRow(List<String> lists) => TableRow(
          children: lists.map((list) {
        return Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(list),
            ));
      }).toList());
}
