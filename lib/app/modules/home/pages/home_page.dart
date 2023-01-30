import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tjms_template/app/core/widgets/template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      title: const Text('Title App'),
      body: ResponsiveRowColumn(
        // rowPadding: const EdgeInsets.all(10),
        // columnPadding: const EdgeInsets.all(10),
        layout: ResponsiveWrapper.of(context).isMobile
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnFlex: 1,
            child: _containerVermelho(context),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnFlex: 1,
            child: _containerAzul(context),
          ),
          // ResponsiveRowColumnItem(
          //   rowFlex: 2,
          //   child: ResponsiveVisibility(
          //     visible: true,
          //     hiddenWhen: [Condition.largerThan(name: TABLET)],
          //     child: Container(
          //       color: Colors.red,
          //       height: 200,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

_containerAzul(BuildContext context) {
  return Container(
    color: Colors.blue,
    height: ResponsiveWrapper.of(context).screenHeight,
    //  width: ResponsiveWrapper.of(context).screenWidth,
  );
}

_containerVermelho(BuildContext context) {
  return Container(
    color: Colors.red,
    height: ResponsiveWrapper.of(context).screenHeight,
    //width: ResponsiveWrapper.of(context).screenWidth,
    // height: 200,
    // width: 200,
  );
}
