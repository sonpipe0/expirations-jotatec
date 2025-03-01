import 'package:expirations/components/FeedCard.dart';
import 'package:expirations/hooks/mockUseFeed.dart';
import 'package:expirations/types/FeedCardInfo.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/SegmentedSelector.dart';




class Feed extends StatefulWidget  {
  const Feed({super.key});
  @override
  State<Feed> createState() => _FeedState();
}


class _FeedState extends State<Feed> {

  int prevIndex = 0;
  int segmentIndex = 0;
  late void Function(int) updateIndex;
  late PreloadPageController _pageController;
  List<bool> loading = [true, true, true];
  late List<List<FeedCardInfo>> feedCards = [
    [],
    [],
    [],
  ];

  awaitFeed() async {
    if (feedCards[segmentIndex].isNotEmpty && !loading[segmentIndex]) return;
    setState(() {
      loading[segmentIndex] = true;
    });
    feedCards[segmentIndex] = await getFeed(segmentIndex);
    setState(() {
      loading[segmentIndex] = false;
    });
  }

  void _onValueChanged(int newIndex) {
    setState(() {
      prevIndex = segmentIndex;
      segmentIndex = newIndex;
      _pageController.animateToPage(
        newIndex,
        duration: Duration(milliseconds: (newIndex - prevIndex).abs()*500),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  void initState() {
    super.initState();
    _pageController = PreloadPageController();
    awaitFeed();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox.fromSize(size: Size.fromHeight(20)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SegmentedSelector(
            items: ['Today', 'Month', 'Custom'],
            onValueChanged: (newIndex) {
              _onValueChanged(newIndex);
            },
            selectedIndex: segmentIndex,
            builder:
                (BuildContext context, void Function(int) methodFromChild) {
              updateIndex = methodFromChild;
            },
            ratio: 96,
            correction: 26,
          ),
        ),
        SizedBox.fromSize(size: Size.fromHeight(16)),
        Expanded(
          child: PreloadPageView.builder(
            controller: _pageController,
            onPageChanged: (int newIndex) {
              setState(() {
                if ((prevIndex - segmentIndex).abs() > 1) {
                  prevIndex = segmentIndex;
                  segmentIndex = newIndex;
                  return;
                }
                prevIndex = segmentIndex;
                segmentIndex = newIndex;
                updateIndex(newIndex);
              });
              awaitFeed();
            },
            itemCount: 3,
            preloadPagesCount: 2,
            itemBuilder: (context, pageIndex) {
              bool isLoading = loading[pageIndex];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Skeletonizer(
                  enabled: isLoading,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: feedCards[pageIndex].isNotEmpty? feedCards[pageIndex].length : populateSkeletons().length,
                    separatorBuilder: (context, index) =>
                        SizedBox.fromSize(size: Size.fromHeight(12)),
                    itemBuilder: (context, index) {
                      return FeedCard(information: feedCards[pageIndex].isNotEmpty? feedCards[pageIndex][index] : populateSkeletons()[index]);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}