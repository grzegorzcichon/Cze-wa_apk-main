import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../widgets/text_styles.dart';
import '../bloc/CO-bloc.dart';
import '../model/co_model.dart';

class COPage1 extends StatefulWidget {
  const COPage1({Key? key}) : super(key: key);

  @override
  _COPageState createState() => _COPageState();
}

class _COPageState extends State<COPage1> {
  final COBloc _coBloc = COBloc();

  @override
  void initState() {
    _coBloc.add(GetCOList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListCO(),
    );
  }

  Widget _buildListCO() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _coBloc,
        child: BlocListener<COBloc, COState>(
          listener: (context, state) {
            if (state is COError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<COBloc, COState>(
            builder: (context, state) {
              if (state is COInitial) {
                return _buildLoading();
              } else if (state is COLoading) {
                return _buildLoading();
              } else if (state is COLoaded) {
                return _buildCard(context, state.coModel);
              } else if (state is COError) {
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
                  "${Str.label.covalue}${double.parse(model.values![index + 1].value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}",
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
