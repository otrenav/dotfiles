import os
import sys
import base64
import requests
import subprocess

API_KEY = os.environ.get("GOOGLE_TTS_API_KEY", "[MISSING]")

text = sys.argv[1] if len(sys.argv) > 1 else "Task completed"
payload = {
    "input": {"text": text},
    "voice": {
        "languageCode": "en-US",
        "name": "en-US-Standard-J",
        "ssmlGender": "FEMALE",
    },
    "audioConfig": {
        "audioEncoding": "MP3",
        "speakingRate": 1.0,
    },
}
resp = requests.post(
    f"https://texttospeech.googleapis.com/v1/text:synthesize?key={API_KEY}",
    headers={"Content-Type": "application/json"},
    json=payload,
)

if resp.status_code == 200:
    audio = base64.b64decode(resp.json()["audioContent"])
    subprocess.run(["mpg123", "-q", "-"], input=audio)
else:
    subprocess.run(["spd-say", '"Error on voice repsonse"'])
