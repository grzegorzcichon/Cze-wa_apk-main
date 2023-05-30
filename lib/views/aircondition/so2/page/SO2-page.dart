import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../widgets/text_styles.dart';
import '../bloc/SO2-bloc.dart';
import '../model/SO2_model.dart';

class SO2Page extends StatefulWidget {
  const SO2Page({Key? key}) : super(key: key);

  @override
  _SO2PageState createState() => _SO2PageState();
}

class _SO2PageState extends State<SO2Page> {
  final SO2Bloc _so2Bloc = SO2Bloc();

  @override
  void initState() {
    _so2Bloc.add(SO2List());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _so2Bloc,
        child: BlocListener<SO2Bloc, SO2State>(
          listener: (context, state) {
            if (state is SO2Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<SO2Bloc, SO2State>(
            builder: (context, state) {
              if (state is SO2dInitial) {
                return _buildLoading();
              } else if (state is SO2Loading) {
                return _buildLoading();
              } else if (state is SO2Loaded) {
                return _buildCard(context, state.so2Model);
              } else if (state is SO2Error) {
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

  Widget _buildCard(BuildContext context, SO2Model model) {
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
                  "${Str.label.so2value}${double.parse(model.values![index + 1].value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}",
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
