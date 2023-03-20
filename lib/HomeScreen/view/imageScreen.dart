import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_slider/HomeScreen/provider/image_provider.dart';
import 'package:provider/provider.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of(context, listen: true);
    homeProviderF = Provider.of(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "ImageSlider",
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: homeProviderF!.imgList.length,
                itemBuilder: (context, index, realIndex) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(homeProviderF!.imgList[index]),
                    ),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  initialPage: 0,
                  autoPlayCurve: Curves.easeInQuart,
                  autoPlayInterval: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    print(index);
                    homeProviderT!.ChangeIndex(index);
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: homeProviderT!.imgList
                  .asMap()
                  .entries
                  .map((e) => Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: e.key == homeProviderT!.imgindex
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    ));
  }
}
