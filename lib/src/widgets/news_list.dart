import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(noticia: news[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article noticia;
  final int index;

  const _New({Key? key, required this.noticia, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(noticia: noticia, index: index),
        _TitleCard(noticia),
        _ImageCard(noticia),
        _BodyCard(noticia),
        const _ButtonsCard(),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TopBarCard({
    Key? key,
    required this.noticia,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextStyle(color: myTheme.colorScheme.secondary)),
          Text('${noticia.source.name}. '),
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article noticia;
  const _TitleCard(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article noticia;
  const _ImageCard(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != '')
                ? FadeInImage(
                    placeholder: const AssetImage('assets/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage),
                  )
                : const Image(image: AssetImage('assets/no-image.png'))),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article noticia;

  const _BodyCard(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description),
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: myTheme.colorScheme.secondary,
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10),
          RawMaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.blue,
            child: const Icon(Icons.more),
          )
        ],
      ),
    );
  }
}
