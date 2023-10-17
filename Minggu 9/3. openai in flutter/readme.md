# OpenAI In Flutter

OpenAI API adalah antarmuka pemrograman aplikasi yang disediakan oleh OpenAI untuk mengakses model-model bahasa buatan mereka, seperti GPT-3. API ini memungkinkan pengembang untuk mengintegrasikan kemampuan pemrosesan bahasa alami yang canggih ke dalam aplikasi, situs web, atau layanan mereka. Dengan menggunakan OpenAI API, pengguna dapat menghasilkan teks, menjawab pertanyaan, menerjemahkan bahasa, membuat konten, dan melakukan berbagai tugas lain yang melibatkan pemahaman bahasa manusia.

Untuk menggunakan api open ai maka diharuskan membuat akun dan membuat api key dari website openai.com

Untuk melakukan request sama seperti api request pada umumnya

Contoh menggunakan library dio
```
final Dio dio = Dio();
  final String baseUrl = "https://api.openai.com/v1/chat/completions";
  final String token = ""; // Masukan token yang sudah di generate dari dashboard openai

  Future<GptResponse> getPhoneRecomendation({
    String? budget = "3000000",
    String? camera = "16",
    String? storage = "128",
  }) async {
    try {
      final Map<String, dynamic> data = {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content":
                "I'm looking for a list of mobile phone recommendations. My budget is around $budget IDR, and I'm interested in phones with a good camera (at least $camera MP) and a minimum of $storage GB of storage. Can you suggest some options?"
          }
        ]
      };
      final response = await dio.post(
        baseUrl,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer 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'
          },
        ),
      );
      return gptResponseFromJson(response.toString());
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
```

bentuk response dari api tersebut yaitu
```
{
    "id": "XXX",
    "object": "chat.completion",
    "created": 1697550869,
    "model": "gpt-3.5-turbo-0613",
    "choices": [
        {
            "index": 0,
            "message": {
                "role": "assistant",
                "content": "OpenAi generated response ....."
            },
            "finish_reason": "stop"
        }
    ],
    "usage": {
        "prompt_tokens": 17,
        "completion_tokens": 13,
        "total_tokens": 30
    }
}
```

Text hasil generate dari open ai terdapat pada message.content.