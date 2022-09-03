import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class EcomercePage extends StatelessWidget {
  const EcomercePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
      "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
      "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
    ];

    //  var c = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecomerce'),
      ),
      backgroundColor: Colors.red,
      body: ListView(
        // padding: const EdgeInsets.all(20.0),
        children: [
          GFCarousel(
          //  pagerSize: 20.0,
            hasPagination: true,
             viewportFraction: 1.0,
           // enlargeMainPage: true,
            activeIndicator: Colors.white,
            // rowCount: 1,
            items: imageList.map(
              (url) {
                return Container(
                //  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
