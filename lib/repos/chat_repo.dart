import 'dart:math';

import 'package:space_pod/constant/constant.dart';

import '../models/chat_message_model.dart';
import 'package:dio/dio.dart';

class SpaceRepo {
  static genenerateChatTextMessage(List<ChatMessageModel> previousMessages) async {
    Dio dio = Dio();
  try{
    final response = await dio.post(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=${API_KEY}',
        data: {
          "contents": previousMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {
            "temperature": 1,
            "topK": 0,
            "topP": 0.95,
            "maxOutputTokens": 8192,
            "stopSequences": []
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
          ]
        });

    if(response.statusCode!>=200 && response.statusCode !<300){
      return response.data['candidates'].first['content']['parts'].first['text'];
    }



  }catch(e){
    print(e.toString());
  }
  }
}
