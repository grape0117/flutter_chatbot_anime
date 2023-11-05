import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common/headers.dart';
import '../../../model/text_completion_model.dart';

class ChatTextController extends GetxController {
  //TODO: Implement ChatTextController

  @override
  void onInit() {
    super.onInit();
    initializationMessage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Toggle
  RxBool toggle_flag = true.obs;
  void changeFlag(bool value) {
    toggle_flag.value = value;
  }

  List<TextCompletionData> messages = <TextCompletionData>[].obs;

  TextCompletionData system_prompt = TextCompletionData(message: {
    'role': 'system',
    'content':
        "Sophia, the impulsive black magic apprentice, possesses remarkable power that rivals even her mentor's"
  }, index: 0, finish_reason: "");

  TextCompletionData internal_prompt = TextCompletionData(message: {
    'role': 'assistant',
    'content':
        "The Magic Academy corridor is bustling with students hurrying to class. Sophia, in her usual haphazard way, runs through the corridor, her magical books and supplies spilling out of her open satchel."
  }, index: 1, finish_reason: "");

  void initializationMessage() {
    messages.addAll([system_prompt, internal_prompt]);
  }

  var state = ApiState.notFound.obs;

  getTextCompletion(String query) async {
    addMyMessage();

    state.value = ApiState.loading;
    // Map<String, String> message =  {"role": "user", "content": query};
    // messages.add();

    print('^^^^^^^^^^^^^^ ${messages[messages.length - 1].message}');
    try {
      Map<String, dynamic> rowParams = {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            'role': 'system',
            'content':
                "Sophia, the impulsive black magic apprentice, possesses remarkable power that rivals even her mentor's. Despite her disorganized theoretical knowledge, her natural talent and enthusiasm shine through. Join her as she embarks on a journey at the Magic Academy, balancing her impulsive nature with disciplined study. With your belief and encouragement, Sophia can unleash breathtaking displays of black magic, unlocking remarkable achievements together. Please note to make the response as simple as possible and pay more attention to desrcibe the Sophia's Facial expression and body language"
          },
          {
            'role': 'assistant',
            'content':
                "The Magic Academy corridor is bustling with students hurrying to class. Sophia, in her usual haphazard way, runs through the corridor, her magical books and supplies spilling out of her open satchel. *Sophia, caught up in her own chaotic world, crashes into ..., their bodies entangled. She looks up at ... with sparkling eyes and a bright smile, exclaiming, 'Oh, I am so sorry! I didn't see you there! Are you new here?'*"
          },
          {'role': 'user', 'content': query}
        ]
      };

      print('rowParams ${rowParams['messages']}');
      final encodedParams = json.encode(rowParams);

      print(endPoint('completions'));
      print('EncodedParams' + encodedParams);
      final response = await http.post(
        Uri.parse(endPoint("completions")),
        body: encodedParams,
        headers: headerBearerOption(OPEN_AI_KEY),
      );
      print("Response  body     ${response.body}");
      final test = json.decode(response.body)['choices'];
      print('%%%%%%%%%%%%%% $test');
      if (response.statusCode == 200) {
        // messages =
        //     TextCompletionModel.fromJson(json.decode(response.body)).choices;
        addServerMessage(
            TextCompletionModel.fromJson(json.decode(response.body)).choices);
        state.value = ApiState.success;
      } else {
        // throw ServerException(message: "Image Generation Server Exception");
        state.value = ApiState.error;
      }
    } catch (e) {
      print(e);
      print("Errorrrrrrrrrrrrrrr  ");
    } finally {
      searchTextController.clear();
      update();
    }
  }

  addServerMessage(List<TextCompletionData> choices) {
    print('%%%%%&&&&&&&');
    // for (int i = 0; i < choices.length; i++) {
    //   print('here');
    messages.add(choices[0]);
    // }
    print('serverMessage ${messages.length}');
  }

  addMyMessage() {
    // {"text":":\n\nWell, there are a few things that you can do to increase","index":0,"logprobs":null,"finish_reason":"length"}
    print('MyMessage   ${messages.length}');
    TextCompletionData message = TextCompletionData(
        message: {'role': 'Assistant', 'content': searchTextController.text},
        index: -999999,
        finish_reason: "");
    messages.add(message);
  }

  TextEditingController searchTextController = TextEditingController();
}
