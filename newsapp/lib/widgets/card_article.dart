import 'package:flutter/material.dart';
import 'package:newsapp/common/navigation.dart';
import 'package:newsapp/common/styles.dart';
import 'package:newsapp/data/model/article.dart';
import 'package:newsapp/ui/article_detail_page.dart';

class CardArticle extends StatelessWidget{
  final Article article;

  CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        leading: Hero(
            tag: article.urlToImage!,
            child: Image.network(
              article.urlToImage!,
              width: 100,
            )
        ),
        title: Text(
          article.title
        ),
        subtitle: Text(
          article.author!
        ),
        onTap: (){
          Navigation.intentWithData(ArticleDetailPage.routeName, article);
        },
      ),
    );
  }
}