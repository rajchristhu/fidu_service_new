
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../resources/colors.dart';
import '../widget/topgrid.dart';

class TopTrending extends StatefulWidget {
  const TopTrending({Key? key}) : super(key: key);

  @override
  _TopTrendingState createState() => _TopTrendingState();
}

class _TopTrendingState extends State<TopTrending> {
  @override
  Widget build(BuildContext context) {
    const List<Choice> choices = <Choice>[
      Choice(title: 'KFC',image:"https://blog.onnbikes.com/wp-content/uploads/2018/12/vegetarian-restaurants-in-thrissur-featured.jpg", icon: Icons.home, ),
      Choice(title: 'mcdonalds',image:"https://media-cdn.tripadvisor.com/media/photo-s/06/17/c7/3f/item-shop.jpg", icon: Icons.home, ),
     Choice(title: 'KFC',image:"https://www.eatthis.com/wp-content/uploads/sites/4/2019/05/kfc-restaurant-exterior.jpg?quality=82&strip=1&resize=1200%2C675", icon: Icons.home, ),
      Choice(title: 'mcdonalds',image:"https://m.economictimes.com/thumb/msid-75892416,width-1200,height-900,resizemode-4,imgsize-890927/like-many-other-top-chefs-adria-has-been-sharing-some-of-his-own-recipes-to-encourage-the-home-cooking-revolution-.jpg", icon: Icons.home, ),
   Choice(title: 'Thalapakatti',image:"https://cdn.doordash.com/media/restaurant/cover/ThalappakattiRestaurant252MilpitasCA.png", icon: Icons.home, ),
      Choice(title: 'mcdonalds',image:"https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2017/10/The-Only-Place.jpg", icon: Icons.home, ),

    ];
    List<String> carousalLists = [
      "https://blog.dineout-cdn.co.in/blog/wp-content/uploads/2019/05/Indore_Blog-1030x538.jpg",
      "https://image.freepik.com/free-vector/flat-food-banner-template_23-2149048461.jpg",
      "https://c.neh.tw/thumb/f/720/4913631651168256.jpg",
      "https://picsum.photos/200",
      "https://static.vecteezy.com/system/resources/previews/001/254/978/original/creative-and-colorful-restaurant-food-social-media-banner-post-vector.jpg",
      "https://thumbs.dreamstime.com/b/fast-food-creative-poster-design-set-web-graphics-modern-vector-illustration-npremium-quality-logo-concept-pictogram-76858679.jpg",
      "https://c.neh.tw/thumb/f/720/4913631651168256.jpg", "https://static.vecteezy.com/system/resources/previews/001/254/978/original/creative-and-colorful-restaurant-food-social-media-banner-post-vector.jpg",
      "https://thumbs.dreamstime.com/b/fast-food-creative-poster-design-set-web-graphics-modern-vector-illustration-npremium-quality-logo-concept-pictogram-76858679.jpg",
    ];
    List<String> carousalList = ["https://image.freepik.com/free-vector/beautiful-happy-diwali-crackers-celebration-banner_1017-21664.jpg",
      "https://d2y0eb5zgg2xw9.cloudfront.net/siteImages/homePageBanners/mark-harpur-HUOvKWXEdFY-unsplash.jpg"];
    return  Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color:     whiteColor,

          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(
                  child: Text(
                    "Top Trending",
                    style: TextStyle(
                        color: blackColor, fontSize: 17.0, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 50.0,
                  height: 0,
                  margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      shape: BoxShape.rectangle,
                      color: ( primaryColor)
                    // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                  ),
                )
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
Padding(          padding: const EdgeInsets.only(right: 16, left: 16),
child:GridView.count(
    physics: const ClampingScrollPhysics(),
    crossAxisCount: 3,
    shrinkWrap: true,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
    children: List.generate(carousalLists.length, (index) {
      return Center(
        child: TopGrid(choice: carousalLists[index]),
      );
    }
    )) ,)
        ,
          const SizedBox(
          height: 20,
        ),
      ],
    );

  }

}
class Choice {
  const Choice({required this.title, required this.icon, required this.image});
  final String title;
  final String image;
  final IconData icon;
}


