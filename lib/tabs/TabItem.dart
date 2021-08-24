import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/sources.dart';

class TabItem extends StatelessWidget {
  Sources _sources;
  bool isSelected;
  TabItem(this._sources, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: isSelected
            ? BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50))
            : BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Theme.of(context).primaryColor,
                    width: 1),
                color: Colors.transparent),
        child: Text(_sources.name,
            style: GoogleFonts.exo(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            )));
  }
}
