import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/aircondition/No2/model/NO2_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../widgets/text_styles.dart';
import '../bloc/NO2-bloc.dart';

class NO2Page extends StatefulWidget {
  const NO2Page({Key? key}) : super(key: key);

  @override
  _NO2PageState createState() => _NO2PageState();
}

class _NO2PageState extends State<NO2Page> {
  final NO2Bloc _no2Bloc = NO2Bloc();

  @override
  void initState() {
    _no2Bloc.add(GetNO2List());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListNO2(),
    );
  }

  Widget _buildListNO2() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _no2Bloc,
        child: BlocListener<NO2Bloc, NO2State>(
          listener: (context, state) {
            if (state is NO2Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<NO2Bloc, NO2State>(
            builder: (context, state) {
              if (state is NO2Initial) {
                return _buildLoading();
              } else if (state is NO2Loading) {
                return _buildLoading();
              } else if (state is NO2Loaded) {
                return _buildCard(context, state.no2Model);
              } else if (state is NO2Error) {
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

  Widget _buildCard(BuildContext context, NO2Model model) {
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
                  "${Str.label.no2value}${double.parse(model.values![index + 1].value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}",
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
