import 'package:drawer/model/sources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TabItem extends StatelessWidget {
  Sources _sources;
  bool isSelected;
  TabItem(this._sources, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(14),
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
                    width: 2),
                color: Colors.transparent),
        child: Text(_sources.name,
            style: GoogleFonts.exo(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            )));
  }
}
