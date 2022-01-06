import 'package:flutter/material.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  // with AutomaticKeepAliveClientMixin - Para que al ir a otra
  //pagina y regresar mantenga en el estado la posicion en la
  //que me encuentro en el scroll
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: (headlines.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NewsList(news: headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
