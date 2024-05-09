import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_glimpse/application/comments/comments_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/comment_lile.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';
// Import or define CustomTextFormField widget

void commentBottomSheet(BuildContext context, String image, String uid) {
  // BlocProvider.of<CommentsBloc>(context).add(CheckComments(image: image));
  final commentController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
        if (state is CommentsFound) {
          return DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.5,
              expand: false,
              builder: (context, scrollController) {
                return Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        'Comments',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'comment..',
                              controller: commentController,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<CommentsBloc>(context).add(
                                  AddCommentEvent(
                                      uid: uid,
                                      comment: commentController.text,
                                      image: image));
                              commentController.clear();
                            },
                            icon: Icon(Icons.send),
                          ),
                        ],
                      ),
                      state.comments.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: state.comments.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: CommentListTile(
                                            index: index, state: state));
                                  }))
                          : const Center(
                              child: Text('add your comment'),
                            )
                    ]));
              });
        }
        return DraggableScrollableSheet(
          maxChildSize: 0.8, minChildSize: 0.5,
          expand:
              false, // Set this to true if you want the bottom sheet to be expandable
          builder: (context, scrollController) {
            return Center(
              child: LoadingAnimationWidget.stretchedDots(
                  color: const Color.fromARGB(255, 0, 0, 0), size: 40),
            );
          },
        );
      });
    },
  );
}
