import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../widgets/text_styles.dart';
import '../bloc/CO_bloc.dart';
import '../model/o3_model.dart';

class O3Page extends StatefulWidget {
  const O3Page({Key? key}) : super(key: key);

  @override
  _O3PageState createState() => _O3PageState();
}

class _O3PageState extends State<O3Page> {
  final O3Bloc _covidBloc = O3Bloc();

  @override
  void initState() {
    _covidBloc.add(O3List());
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
        child: BlocListener<O3Bloc, O3State>(
          listener: (context, state) {
            if (state is O3Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<O3Bloc, O3State>(
            builder: (context, state) {
              if (state is O3dInitial) {
                return _buildLoading();
              } else if (state is O3Loading) {
                return _buildLoading();
              } else if (state is O3Loaded) {
                return _buildCard(context, state.o3Model);
              } else if (state is O3Error) {
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

  Widget _buildCard(BuildContext context, COModel model) {
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
                  "${Str.label.o3value}${double.parse(model.values![index + 1].value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}",
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
