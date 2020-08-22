import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

import 'favorite-badge.dart';

Widget recipeListLargePreview(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 100,
    itemBuilder: (context, index) {
      double width = MediaQuery.of(context).size.width;
      double height = 0.5 * width;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            _backgroundImage(width, height, index),
            Positioned(
              top: 8,
              right: 8,
              child: FavBadge(count: 100),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: _infoCard(context, index),
            )
          ],
        ),
      );
    },
  );
}

Widget _backgroundImage(double width, double height, int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.network(
      'https://source.unsplash.com/${width}x$height/?food $index',
      width: width,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

Widget _infoCard(BuildContext context, int index) {
  return Card(
    color: Colors.grey.withOpacity(0.6),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoCardTitle(context, index),
          SizedBox(
            height: 10.0,
          ),
          _infoCardCookTime(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoCardAuthor(index),
              _infoCardAuthorRatingIndicator(),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _infoCardTitle(BuildContext context, int index) {
  return Text(
    'Lamb and Spinach curry recipe $index',
    style: TextStyle(
      color: Theme.of(context).cardColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    maxLines: 3,
  );
}

Widget _infoCardCookTime() {
  return Text(
    '50 mins cook time',
    style: TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    maxLines: 3,
  );
}

Widget _infoCardAuthor(int index) {
  return InputChip(
    avatar: CircleAvatar(
      backgroundImage:
          NetworkImage('https://source.unsplash.com/24x24/?chef$index'),
      backgroundColor: Colors.transparent,
    ),
    label: Text('Ole Moses'),
    onPressed: () {},
  );
}

Widget _infoCardAuthorRatingIndicator() {
  return RatingBar.readOnly(
    initialRating: 3.5,
    isHalfAllowed: true,
    halfFilledIcon: Icons.star_half,
    filledIcon: Icons.star,
    emptyIcon: Icons.star_border,
    size: 16,
  );
}

/*

RatingBar(
   initialRating: 3,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => Icon(
     Icons.star,
     color: Colors.amber,
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
);

RatingBar(
   initialRating: 3,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   ratingWidget: RatingWidget(
     full: _image('assets/heart.png'),
     half: _image('assets/heart_half.png'),
     empty: _image('assets/heart_border.png'),
   ),
   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
   onRatingUpdate: (rating) {
     print(rating);
   },
);

*/
