import 'package:api_getx/controler/productcontroler.dart';
import 'package:api_getx/screens/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController productControler = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ShopX',
                style: TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.ac_unit_sharp), onPressed: null),
                  IconButton(icon: Icon(Icons.people), onPressed: null),
                ],
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productControler.productList.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (BuildContext context, int index) {
                  return ProductTile(productControler.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BtmNavBar(),
    );
  }
}

class BtmNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildNavBarItem(Icon icon, String title) {
      return BottomNavigationBarItem(
        icon: icon,
        label: (title),
      );
    }

    return BottomNavigationBar(
      elevation: 0.0,
      items: <BottomNavigationBarItem>[
        _buildNavBarItem(
          Icon(Icons.timer),
          ('Timer'),
        ),
        _buildNavBarItem(
          Icon(Icons.slow_motion_video),
          ('Timer'),
        ),
        _buildNavBarItem(
          Icon(Icons.settings),
          ('Timer'),
        ),
      ],
    );
  }
}
