import 'package:czestochowa_app/resources/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../widgets/text_styles.dart';
import '../bloc/PM10-bloc.dart';
import '../model/pm10_model.dart';

class PM10Page extends StatefulWidget {
  const PM10Page({Key? key}) : super(key: key);

  @override
  _PM10PageState createState() => _PM10PageState();
}

class _PM10PageState extends State<PM10Page> {
  final PM10Bloc _pm10Bloc = PM10Bloc();

  @override
  void initState() {
    _pm10Bloc.add(GetPM10List());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListPM10(),
    );
  }

  Widget _buildListPM10() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _pm10Bloc,
        child: BlocListener<PM10Bloc, PM10State>(
          listener: (context, state) {
            if (state is PM10Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<PM10Bloc, PM10State>(
            builder: (context, state) {
              if (state is PM10Initial) {
                return _buildLoading();
              } else if (state is PM10Loading) {
                return _buildLoading();
              } else if (state is PM10Loaded) {
                return _buildCard(context, state.pm10Model);
              } else if (state is PM10Error) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, PM10Model model) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 20.0, bottom: 5),
          //padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${Str.label.pm10value}${double.parse(model.values![index + 1].value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}",
                  style: TextStyleSS.overline(
                      color: Theme.of(context).colorScheme.fontdistrictnametext,
                      context: context),
                ),
                //const SizedBox(height: 10),
              ]),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
