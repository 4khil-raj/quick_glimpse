import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/comments/comments_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';
// Import or define CustomTextFormField widget

void commentBottomSheet(BuildContext context, String image) {
  // BlocProvider.of<CommentsBloc>(context).add(CheckComments(image: image));
  final commentController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Set this to true to allow the bottom sheet to be resizable
    builder: (context) {
      return BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
        if (state is CommentsFound) {
          return DraggableScrollableSheet(
            maxChildSize: 0.8, minChildSize: 0.5,
            expand:
                false, // Set this to true if you want the bottom sheet to be expandable
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Use mainAxisSize.min to prevent overflow
                  children: [
                    Text('Comments'),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'comment..',
                            controller: commentController,
                          ), // Close the widget with a closing parenthesis
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CommentsBloc>(context).add(
                                AddCommentEvent(
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
                              controller:
                                  scrollController, // Attach the scroll controller
                              itemCount: state.comments.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(state
                                          .comments[index].commentedUserImage),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              state.comments[index]
                                                  .commentedUserName,
                                              style: TextStyle(fontSize: 14.5),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                state.comments[index]
                                                    .commentedTime,
                                                style: TextStyle(fontSize: 12))
                                          ],
                                        ),
                                        Text(state.comments[index].comment)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Text('add your comment'),
                          )
                  ],
                ),
              );
            },
          );
        }
        return DraggableScrollableSheet(
          maxChildSize: 0.8, minChildSize: 0.5,
          expand:
              false, // Set this to true if you want the bottom sheet to be expandable
          builder: (context, scrollController) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      });
    },
  );
}
