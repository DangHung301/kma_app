import 'package:flutter/material.dart';

class ContainerNew extends StatelessWidget {
  String image;
  String title;
  String content;

  ContainerNew(
      {required this.image, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: size.height * 0.15,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow),
            ),
          ),

        const SizedBox(width: 10,),

          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$title',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    '$content',
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
