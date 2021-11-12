import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/Model/home.dart';
import 'package:kma_app/View/Screen/HomeScreen/widget/container_new.dart';

import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
 final  HomeViewModel viewModel;

 HomeScreen({required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.getListSlideNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          margin: const EdgeInsets.only(left: 23, top: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trang Chủ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<List<SlideNews>>(
                stream: widget.viewModel.listSlideNewsStream,
                builder: (context, snapshot) {
                  if(!snapshot.hasData) {
                    return CarouselSlider.builder(
                        itemCount: 6,
                        options: CarouselOptions(autoPlay: true, height: 140),
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            width: size.width * 0.7,
                            height: size.height * 0.15,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: Text('$index'),
                          );
                        });
                  }
                  List<SlideNews> data = snapshot.data ?? [];

                  return CarouselSlider.builder(
                      itemCount: data.length,
                      options: CarouselOptions(autoPlay: true, height: 140),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: size.width * 0.7,
                          height: size.height * 0.15,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage('${data[index].image}')),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                        );
                      });
                }
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Tin tức & sự kiện',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ContainerNew(
                          image: 'ac',
                          title:
                              "Rộn ràng không khí bầu cử tại Học viện kỹ thuật Mật Mã",
                          content:
                              'Người đến/về thành phố Hà Nội không phải xuất trình kết quả xét nghiệm SARS-CoV-2. Không chỉ định xét nghiệm đối với việc đi lại của người dân; chỉ thực hiện xét nghiệm đối với trường hợp đến từ địa bàn có dịch ở cấp độ 4 hoặc cách ly y tế vùng (phong tỏa) và các trường hợp nghi ngờ hoặc có chỉ định điều tra dịch tễ đến từ địa bàn có dịch ở cấp độ 3.');
                    }),
              ),
            ],
          ),
        ));
  }

}
