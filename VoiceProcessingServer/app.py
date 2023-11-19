from flask import Flask, request, send_file
from tts import convert_text_to_speech
# from stt import recognize_speech (将来的に追加)

app = Flask(__name__)

@app.route('/text_to_speech', methods=['POST'])
def text_to_speech():
    text = request.json['text']
    audio_stream = convert_text_to_speech(text)
    return send_file(audio_stream, mimetype='audio/mpeg')

# 将来的にSTTのルートもここに追加

if __name__ == '__main__':
    app.run(debug=True)
