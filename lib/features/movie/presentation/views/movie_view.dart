import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_clean_arch/core/string_extension.dart';
import 'package:the_movie_clean_arch/features/movie/presentation/views/widgets/like_button.dart';

import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: controller.isLoading
              ? CircularProgressIndicator()
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: height / 2,
                      stretch: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.2, 0.8, 1],
                            ),
                          ),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/original${controller.movie!.image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    controller.movie!.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                LikeButton()
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                    '${formatNumberToK(controller.movie!.voteCount)} Likes'),
                                const SizedBox(width: 24),
                                const Icon(
                                  Icons.radio_button_off,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                    '${controller.movie!.popularity.toStringAsFixed(1)}k View'),
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final similar = controller.similar![index];
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border(
                              top: index == 0
                                  ? BorderSide(
                                      color: Colors.grey.withOpacity(0.1),
                                    )
                                  : BorderSide.none,
                              bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.1),
                              ),
                            )),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 54,
                                  child: CachedNetworkImage(
                                    height: 80,
                                    width: 54,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/original${similar.image}',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        similar.name,
                                        style: TextStyle(),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        similar.description.toDate(),
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount:
                            controller.similar!.length, // 1000 list items
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  String formatNumberToK(num number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return controller.movie!.voteCount.toString();
  }
}
