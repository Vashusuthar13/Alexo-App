import 'package:alexo_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String title, price, tag, image, condition, rating, location, date;
  final double width;

  const ProductCard({
    required this.title,
    required this.price,
    required this.tag,
    required this.image,
    required this.condition,
    required this.rating,
    required this.location,
    required this.date,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      margin: EdgeInsets.only(right: w * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(image, width: width, height: h * 0.18, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Color(0xffFDE68A), borderRadius: BorderRadius.circular(6)),
                  child: Text(tag, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: SvgPicture.asset('assets/svg_icons/fav.svg',)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(w * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                Text("Rs $price", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                      child: Text(condition,style: TextStyle(fontSize: 10),),
                    ),
                    SizedBox(width: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                      child: Text(rating,style: TextStyle(fontSize: 10),),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(location, style: TextStyle(fontSize: 10, color: AppColors().brand_light_blue,fontWeight: FontWeight.w400,)),
                    Spacer(),
                    Text(date, style: TextStyle(fontSize: 10, color: AppColors().brand_light_blue)),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}



