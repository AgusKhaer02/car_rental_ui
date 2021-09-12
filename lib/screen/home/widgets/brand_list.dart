import 'package:car_rental_ui/constants/text_constants.dart';
import 'package:flutter/material.dart';

class BrandList extends StatefulWidget {
  const BrandList({
    Key? key,
  }) : super(key: key);

  @override
  _BrandListState createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  int _brandCategoryIndex = 0;
  var brandList = [
    {
      "name": "all",
      "icon": "",
    },
    {
      "name": "tesla",
      "icon": "assets/logos/ic_tesla_black.png",
    },
    {
      "name": "audi",
      "icon": "assets/logos/ic_audi_black.png",
    },
    {
      "name": "mitsubishi",
      "icon": "assets/logos/ic_mitsubish_black.png",
    },
  ];

  void setBrandIndex(int currentIndex) {
    setState(() {
      _brandCategoryIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Brands",
              style: TextConstants.titleSection,
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              itemCount: brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      setBrandIndex(index);
                      print(brandList[index]["name"]!);
                    },
                    child: BrandItem(
                      imgAsset: brandList[index]["icon"]!,
                      index: 0,
                      isSelected: (_brandCategoryIndex == index) ? true : false,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      setBrandIndex(index);
                      print(brandList[index]["name"]!);
                    },
                    child: BrandItem(
                      imgAsset: brandList[index]["icon"]!,
                      index: index,
                      isSelected: (_brandCategoryIndex == index) ? true : false,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final String imgAsset;
  final int index;
  final bool isSelected;

  const BrandItem({
    Key? key,
    required this.imgAsset,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (index == 0)
          ? EdgeInsets.fromLTRB(20, 12, 10, 12)
          : EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      padding: (index == 0)
          ? EdgeInsets.symmetric(vertical: 20, horizontal: 25)
          : EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (isSelected)
            ? Colors.blue
            : (index == 0)
                ? Colors.black12
                : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: (index == 0)
          ? Center(
              child: Text(
                "All",
                style: TextConstants.titleSection,
              ),
            )
          : Image.asset(
              imgAsset,
              width: 30,
              height: 30,
            ),
    );
  }
}
