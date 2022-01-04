import 'package:chewie/chewie.dart';
import 'package:exam/core/configs/size_config.dart';
import 'package:exam/core/schema/recipe_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RecipeWidget extends StatefulWidget {
  final RecipeSchema recipe;

  const RecipeWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  VideoPlayerController? _controller;
  ChewieController? chewieController;
  @override
  void initState() {
    _playVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(452.0),
      child: Column(
        children: [
          SizedBox(
            height: getHeight(16.0),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: _controller!.value.isInitialized
                    ? Chewie(controller: chewieController!)
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(16.0),
          ),
          Text(
            widget.recipe.instruction![0].intro![0].title.toString(),
            // 'Resep Ayam Kuah Santan Pedas Lezat',
            style: TextStyle(
              fontSize: getFont(24.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: getHeight(16.0),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.recipe.userPhoto.toString(),
                ),
                backgroundColor: Colors.redAccent,
                radius: 20.0,
              ),
              SizedBox(
                width: getWidth(16.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipe.username.toString(),
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.orange,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: getWidth(12.0),
                        ),
                        Text(
                          '${widget.recipe.like} · 103 Reviews',
                          style: TextStyle(
                            fontSize: getFont(14.0),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: getWidth(16.0),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.heart),
              )
            ],
          ),
          SizedBox(
            height: getHeight(16.0),
          ),
        ],
      ),
    );
  }

  _playVideo() async {
    _controller = VideoPlayerController.network(
        widget.recipe.instruction![0].intro![0].viedoUrl!);

    await _controller!.initialize();

    chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }
}
