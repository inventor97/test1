
import 'package:flutter/material.dart';
import 'package:test1/pages/home_page/view/home_page_view.dart';

import 'utils/utils.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.initWidthAndHeight(context);
      return const HomePageView();
    }
  }
