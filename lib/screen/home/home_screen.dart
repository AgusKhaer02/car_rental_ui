import 'package:car_rental_ui/constants/text_constants.dart';
import 'package:car_rental_ui/screen/detail_cars/detail_cars.dart';
import 'package:car_rental_ui/screen/home/widgets/brand_list.dart';
import 'package:car_rental_ui/screen/home/widgets/cars_item.dart';
import 'package:car_rental_ui/screen/home/widgets/search_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9ffff),
      body: SafeArea(
        child: Column(
          children: [
            SearchButton(),
            BrandList(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available cars",
                          style: TextConstants.titleSection,
                        ),
                        IconButton(
                          onPressed: () {
                            print("filter cars");
                          },
                          icon: Icon(Icons.sort),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CarItem();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black87,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setSelectedIndex(index);
          },
          elevation: 0,
          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedItemColor: Color(0xFF686868),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.doorbell),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
