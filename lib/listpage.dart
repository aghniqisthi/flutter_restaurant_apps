import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/restaurant_response.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/listpage';
  bool state = false;

  ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant List'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {

            try {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              else if (!snapshot.hasData || snapshot.data == null) {
                return const Text('No data available');
              }
              else {
                final dynamic dataRst = parseRestaurantsItem(snapshot.data!);

                return ListView.builder(
                        itemCount: dataRst.length,
                        itemBuilder: (context, index) {
                          return _buildRstItem(context, dataRst[index]);
                        });
              }
            } catch (e) {
              return Text("err ${e.toString()}");
            }
          }),
    );
  }
}

Widget _buildRstItem(BuildContext context, RestaurantsItem rst) {
  return Padding(padding: const EdgeInsets.only(left: 4, right: 4), child: Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        onTap: () => Navigator.pushNamed(context, '/detail', arguments: rst),
        title: Column(
          children: [
            Hero(
              tag: rst.pictureId,
              child: Padding(padding: const EdgeInsets.only(top: 4, bottom: 4), child:
              Image.network(
                rst.pictureId,
                width: 300,
                errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
              )
            ),
            ),
            Hero(
                tag: rst.name,
                child: Padding(padding: const EdgeInsets.only(top: 4, bottom: 4), child:
              Text(
                rst.name,
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              )
            ),
            ),
          ],
        ),
        subtitle: Text(
          "${rst.city}   |  ★ ${rst.rating}   |   ${rst.menus.drinks.length} Drinks   |   ${rst.menus.foods.length} Foods",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
        ),
      )
  )
  );
}
