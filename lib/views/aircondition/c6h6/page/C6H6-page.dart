import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/aircondition/c6h6/model/c6h6_model.dart';
import 'package:czestochowa_app/views/aircondition/c6h6/bloc/C6H6-bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../widgets/text_styles.dart';

class C6H6Page extends StatefulWidget {
  const C6H6Page({Key? key}) : super(key: key);

  @override
  _C6H6PageState createState() => _C6H6PageState();
}

class _C6H6PageState extends State<C6H6Page> {
  final C6H6Bloc _covidBloc = C6H6Bloc();

  @override
  void initState() {
    _covidBloc.add(GetC6H6List());
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
        create: (_) => _covidBloc,
        child: BlocListener<C6H6Bloc, C6H6State>(
          listener: (context, state) {
            if (state is C6H6Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<C6H6Bloc, C6H6State>(
            builder: (context, state) {
              if (state is C6H6dInitial) {
                return _buildLoading();
              } else if (state is C6H6Loading) {
                return _buildLoading();
              } else if (state is C6H6Loaded) {
                return _buildCard(context, state.c6h6Model);
              } else if (state is C6H6Error) {
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

  Widget _buildCard(BuildContext context, C6H6Model model) {
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
                  "${Str.label.c6h6value}${double.parse(model.values![index + 1].value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}",
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
