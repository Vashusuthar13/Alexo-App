import 'package:alexo_app/common/widgets/app_dropdown.dart';
import 'package:alexo_app/common/widgets/product_card.dart';
import 'package:alexo_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatelessWidget {

  final List<Map<String, String>> categories = [
    {"name": "Mobiles", "image": "assets/images/categories/cat_phone.jpg"},
    {"name": "Property\n for Sale", "image":"assets/images/categories/cat_propertie.jpg"},
    {"name": "Vehicles", "image": "assets/images/categories/cat_vechile.jpg"},
    {"name": "Bikes", "image": "assets/images/categories/cat_bike.jpg"},
    {"name": "Business", "image": "assets/images/categories/cat_business.jpg"},
  ];

  final List<Map<String, String>> featuredProducts = [
    {
      "title": "Macbook 14",
      "price": "450,000",
      "tag": "Featured",
      "image": "assets/images/product_images/product_img1.jpg",
      "condition": "New",
      "rating": "10/10",
      "location": "Gulberg Phase 4, Lahore",
      "date": "22 Sep"
    },
    {
      "title": "iPhone 14 Pro Max",
      "price": "600,000",
      "tag": "Featured",
      "image": "assets/images/product_images/product_img2.jpg",
      "condition": "Used",
      "rating": "08/10",
      "location": "Gulberg Phase 4, Lahore",
      "date": "22 Sep"
    },
  ];


  final List<Map<String, String>> mobileProduct = [
    {
      "title": "Iphone 14",
      "price": "450,000",
      "tag": "Featured",
      "image": "assets/images/product_images/product_img4.jpg",
      "condition": "New",
      "rating": "10/10",
      "location": "Gulberg Phase 4, Lahore",
      "date": "22 Sep"
    },
    {
      "title": "iPhone 14 Pro Max",
      "price": "600,000",
      "tag": "Featured",
      "image": "assets/images/product_images/product_img3.jpg",
      "condition": "Used",
      "rating": "08/10",
      "location": "Gulberg Phase 4, Lahore",
      "date": "22 Sep"
    },
  ];

   DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(child: Image.asset('assets/logos/alexo_logo.png',height: 60,)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                ),
                      child: Row(
                        children: [
                          Text('Accessories'),
                          const SizedBox(width: 5,),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child: Icon(Icons.search, size: w * 0.07)),
                    SizedBox(width: w * 0.04),
                    Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SvgPicture.asset("assets/svg_icons/notification.svg",height: w * 0.07)),
                  ],
                ),
              ),
              SizedBox(height: h * 0.015),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.015),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey),
                        SizedBox(width: w * 0.02),
                        Expanded(
                          child: Text(
                            "Gulberg Phase 4, Lahore",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: w * 0.04, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.02),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Browse Categories", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(width: 5,),
                    Text("15+", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                    Spacer(),
                    SizedBox(
                      width: 180,
                      child: const ProductConditionDropdown(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.015),
              SizedBox(
                height: h * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: w * 0.04),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: w * 0.08,
                            backgroundImage: AssetImage(categories[index]['image']!),
                          ),
                          SizedBox(height: h * 0.005),
                          Text(categories[index]['name']!, style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: h * 0.02),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Featured", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    const SizedBox(width: 5,),
                    Text(
                      textAlign: TextAlign.center,
                        "10+", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors().brand_light_blue)),
                    Spacer(),
                    Text("See more", style: TextStyle(color: AppColors().brand_light_blue,decoration: TextDecoration.underline,decorationColor: AppColors().brand_light_blue)),
                  ],
                ),
              ),
              SizedBox(height: h * 0.015),
              SizedBox(
                height: h * 0.30,
                child: ListView.builder(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredProducts.length,
                  itemBuilder: (context, index) {
                    var product = featuredProducts[index];
                    return ProductCard(
                      title: product['title']!,
                      price: product['price']!,
                      tag: product['tag']!,
                      image: product['image']!,
                      condition: product['condition']!,
                      rating: product['rating']!,
                      location: product['location']!,
                      date: product['date']!,
                      width: w * 0.47,
                    );
                  },
                ),
              ),

              SizedBox(height: h * 0.02),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Mobile", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    const SizedBox(width: 5,),
                    Text(
                        textAlign: TextAlign.center,
                        "100+", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors().brand_light_blue)),
                    Spacer(),
                    Text("See more", style: TextStyle(color: AppColors().brand_light_blue,decoration: TextDecoration.underline,decorationColor: AppColors().brand_light_blue)),
                  ],
                ),
              ),
              SizedBox(height: h * 0.015),
              SizedBox(
                height: h * 0.32,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: mobileProduct.length,
                  itemBuilder: (context, index) {
                    var product = mobileProduct[index];
                    return ProductCard(
                      title: product['title']!,
                      price: product['price']!,
                      tag: product['tag']!,
                      image: product['image']!,
                      condition: product['condition']!,
                      rating: product['rating']!,
                      location: product['location']!,
                      date: product['date']!,
                      width: w * 0.47,
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );


  }
}

