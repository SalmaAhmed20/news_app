import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsItem.dart';
import 'package:news_app/reusableWidget/Marquee.dart';
import 'package:url_launcher/url_launcher.dart';

import 'NewsListItem.dart';

class ArticalContent extends StatelessWidget {
  NewsItem _newsItem;
  ArticalContent(this._newsItem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
            ),
          title: Center(
              child: MarqueeWidget(
                child: Text(_newsItem.title,
                    style: TextStyle(
                      fontFamily: 'Exo',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
              ))
        )
      ),
      body: Container(
        // margin: const EdgeInsets.fromLTRB(0,20,0,0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/3.0x/pattern@3x.png'),
                fit: BoxFit.fill)),
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),

                      child:CachedNetworkImage(
                        imageUrl:   _newsItem.urlToImage,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _newsItem.source.name,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF79828B)),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(
                        _newsItem.description,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      Date(_newsItem.publishedAt),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA3A3A3)),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                          child: Card(
                            elevation: 0,
                            shape: ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            color: Colors.white,
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        _newsItem.content,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    _launchURL(_newsItem.url);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,8.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('View Full Article',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF42505C))),
                                          Icon(Icons.play_arrow,
                                              color: Color(0xFF303030)),
                                        ]),
                                  ))
                            ]),
                          )))
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

void _launchURL(_url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
