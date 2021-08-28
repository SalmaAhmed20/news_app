import 'package:flutter/material.dart';
import 'package:news_app/homeScreen/Home-Catagorized.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsCategory extends StatelessWidget {
  String title;
  String imagePath;
  Color color;
  final Function decorate;
  NewsCategory(this.title, this.imagePath, this.color, this.decorate);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
              child: Container(
                child: InkWell(
                  child: Container(
                    height: 171.0,
                    width: 135.0,
                    child: decorate(color, imagePath),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeCatogrized(title)));
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: "Exo"),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
