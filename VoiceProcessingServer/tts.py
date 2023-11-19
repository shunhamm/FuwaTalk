from openai import OpenAI
import io

# TTS関連の処理を担当するクラスまたは関数
def convert_text_to_speech(text):
    client = OpenAI()
    response = client.audio.speech.create(
        model="tts-1",
        voice="alloy",
        input=text
    )
    audio_stream = io.BytesIO()
    response.stream_to_file(audio_stream)
    audio_stream.seek(0)
    return audio_stream
