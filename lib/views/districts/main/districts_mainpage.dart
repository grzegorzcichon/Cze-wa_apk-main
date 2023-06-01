import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/widgets/appbars/appbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/strings/strings.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../districts_build.dart';
import '../model/districts.dart';
import 'bloc/districts_bloc.dart';

class DistrictsPageMain extends StatefulWidget {
  const DistrictsPageMain({super.key});

  @override
  State<DistrictsPageMain> createState() => _DistrictsPageMainState();
}

class _DistrictsPageMainState extends State<DistrictsPageMain> {
  late DistrictsBloc _districtsBloc;

  @override
  void initState() {
    super.initState();
    _districtsBloc = DistrictsBloc();
    _districtsBloc.add(FetchDistrictsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbarDistrictsScreen(),
        body: BlocBuilder<DistrictsBloc, DistrictsState>(
          bloc: _districtsBloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.error.isNotEmpty) {
              return Column(
                children: [
                  Text(
                    Str.errors.districtserror,
                    style: TextStyles.overline(
                      color: Theme.of(context).colorScheme.fontblacktext,
                      context: context,
                    ),
                  ),
                  Center(
                    child: ErrorButton(
                      color: Theme.of(context).colorScheme.errorbuttoncolor,
                      textView: Text(
                        Str.buttons.reloaddata,
                        style: TextStyleError.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context,
                        ),
                      ),
                      onPressed: () {
                        _districtsBloc.add(FetchDistrictsEvent());
                      },
                    ),
                  ),
                ],
              );
            } else {
              final items = state.items;
              return ListView(
                children: <Widget>[
                  if (state.isVisible)
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 9,
                      child: _buildDistrictsPageContainerInfo(),
                    ),
                  Container(
                    child: _buildDistricts(items),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildRow({Widget? child}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: child,
    );
  }

  Widget _buildDistrictsPageContainerInfo() {
    return BlocBuilder<DistrictsBloc, DistrictsState>(
      bloc: _districtsBloc,
      builder: (context, state) {
        return Visibility(
          visible: state.isVisible,
          child: Column(
            children: <Widget>[
              Row(
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
                              Str.label.disttrictpageinfo,
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
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _districtsBloc.add(ToggleVisibilityEvent());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDistricts(List<Districts> items) {
    return _buildRow(
      child: MergeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.25,
              margin: const EdgeInsets.only(bottom: 1.78),
              child: DistrictsBuild(),
            ),
          ],
        ),
      ),
    );
  }
}
