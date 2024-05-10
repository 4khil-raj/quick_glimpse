import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/gemini_bloc/gemini_bloc.dart';
import 'package:quick_glimpse/domain/models/gemini/model.dart';

class GeminiFriend extends StatelessWidget {
  GeminiFriend({super.key});

  final GeminiBloc chatBloc = GeminiBloc();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GeminiBloc, GeminiState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case GeminiSuccessState:
              List<GeminiModel> messages = (state as GeminiSuccessState).msg;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 1,
                        image: NetworkImage(
                            "https://img.freepik.com/free-vector/ai-technology-microchip-background-vector-digital-transformation-concept_53876-112222.jpg?size=338&ext=jpg&ga=GA1.1.1369675164.1715299200&semt=ais"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              )),
                          Text(
                            "Ai Friend",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: const Color.fromARGB(
                                  255, 255, 255, 255), // Set the color here
                            ),
                          ),

                          // Icon(Icons.image_search, color: Colors.white)
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 12, left: 16, right: 16),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(0.9)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        messages[index].role == "user"
                                            ? "${users?.name}"
                                            : "Ai Friend",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                messages[index].role == "user"
                                                    ? Colors.amber
                                                    : const Color.fromARGB(
                                                        255, 196, 116, 210)),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        messages[index].parts.first.text,
                                        style: TextStyle(
                                            height: 1.3, color: Colors.white),
                                      ),
                                    ],
                                  ));
                            })),
                    // if (chatBloc.generating)

                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            controller: textEditingController,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fillColor: Colors.white,
                                hintText: "Ask Something from AI",
                                hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 133, 130, 130)),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor))),
                          )),
                          const SizedBox(width: 12),
                          chatBloc.generating
                              ? LoadingAnimationWidget.threeRotatingDots(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  size: 40)
                              : InkWell(
                                  onTap: () {
                                    if (textEditingController.text.isNotEmpty) {
                                      String text = textEditingController.text;
                                      textEditingController.clear();
                                      chatBloc.add(GeminiNewTextMessageEvent(
                                          inputMessage: text));
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      child: Center(
                                        child: Icon(Icons.send,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
