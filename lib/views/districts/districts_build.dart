import 'package:cached_network_image/cached_network_image.dart';
import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/districts/page/districts_page.dart';
import 'package:czestochowa_app/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/strings/strings.dart';
import '../../widgets/buttons/buttons.dart';
import 'main/bloc/districts_bloc.dart';

class DistrictsBuild extends StatefulWidget {
  @override
  State<DistrictsBuild> createState() => _DistrictsBuildState();
}

class _DistrictsBuildState extends State<DistrictsBuild> {
  late DistrictsBloc _districtsBloc;

  @override
  void initState() {
    super.initState();
    _districtsBloc = DistrictsBloc();
    _districtsBloc.add(FetchDistrictsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DistrictsBloc, DistrictsState>(
      bloc: _districtsBloc,
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
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
                child: Container(
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
              ),
            ],
          );
        } else {
          final items = state.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: ClipPath(
                          child: Row(
                            children: [
                              Column(
                                children: <Widget>[
                                  Stack(
                                    children: [
                                      TextButton(
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              95),
                                          height: state.minTileHeight,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  item.urlAvatar),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 90),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        Str.label.districtname +
                                                            item.name,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            TextStyleS.overline(
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .fontdistrictnametext,
                                                          context: context,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            height: 25,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  Str.label
                                                                      .districtpopulation,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyleS
                                                                      .overline(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .fontdistrictnametext,
                                                                    context:
                                                                        context,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  item.population,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyleS
                                                                      .overline(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .fontdistrictnametext,
                                                                    context:
                                                                        context,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DistrictsPage(item: item),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
