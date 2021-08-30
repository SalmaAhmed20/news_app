import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsItem.dart';

import 'ArticalContent.dart';

class NewsListItem extends StatelessWidget {
  NewsItem _item;
  NewsListItem(this._item);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticalContent(_item)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                   child: CachedNetworkImage(
                     imageUrl: _item.urlToImage,
                     progressIndicatorBuilder: (context, url, downloadProgress) =>
                         CircularProgressIndicator(value: downloadProgress.progress),
                     errorWidget: (context, url, error) => Icon(Icons.error),
                   ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  _item.title,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text(
                  _item.description,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Date(_item.publishedAt),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA3A3A3)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Date(String publishtime) {
  var _datetime = DateTime.parse(publishtime);
  DateTime now = DateTime.now();
  var difference = now.difference(_datetime).inHours;
  if (difference < 24) {
    return difference.toString() + ' hours ago';
  } else if (difference == 24) {
    return ' Day ago';
  } else {
    int numDays = now.difference(_datetime).inDays;
    if (numDays < 7)
      return (numDays.toString() + " days ago");
    else if (numDays == 7)
      return (" Week ago");
    else {
      int numWeeks = numDays ~/ 7;
      if (numWeeks < 4)
        return (numWeeks.toString() + " weeks ago");
      else if (numWeeks == 4)
        return (" Month ago");
      else {
        int numMonths = numWeeks ~/ 4;
        if (numMonths < 12)
          return (numMonths.toString() + " month ago");
        else if (numMonths == 12)
          return (" year ago");
        else {
          int numYears = numMonths ~/ 12;
          return (numYears.toString() + " years ago");
        }
      }
    }
  }
}
