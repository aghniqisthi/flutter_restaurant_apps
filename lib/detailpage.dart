import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/restaurant_response.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';
  final RestaurantsItem dataRst;
  bool state = false;

  DetailPage(this.dataRst, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(dataRst.name),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Hero(
                tag: dataRst.pictureId,
                child: Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Image.network(
                      dataRst.pictureId,
                      width: MediaQuery.of(context).size.width,
                      errorBuilder: (ctx, error, _) =>
                          const Center(child: Icon(Icons.error)),
                    ))),
            Hero(
                tag: dataRst.name,
                child: Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Text(
                      dataRst.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ))),
            Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  "${dataRst.city}   |  ★ ${dataRst.rating}   |   ${dataRst.menus.drinks.length} Drinks   |   ${dataRst.menus.foods.length} Foods",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 4, bottom: 4),
                child: Text(
                  dataRst.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                )),
            const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 4),
                child: Text(
                  "Foods",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )),
            SizedBox(
                width: 200,
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataRst.menus.foods.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 200,
                        height: 70,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: ListTile(
                            title: Text(dataRst.menus.foods[index].name),
                          ),
                        ));
                  },
                )),
            const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 4),
                child: Text(
                  "Drinks",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )),
            SizedBox(
                width: 200,
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataRst.menus.drinks.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 200,
                        height: 70,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: ListTile(
                            title: Text(dataRst.menus.drinks[index].name),
                          ),
                        ));
                  },
                )),
          ],
        ));
  }
}
