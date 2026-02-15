#!/usr/bin/env python3

import sys
import json
import os
import base64
from groq import Groq
from dotenv import load_dotenv
load_dotenv()

GROQ_API_KEY = os.getenv("GROQ_API_KEY")


# ---------------- DIRECT API KEY ----------------
# GROQ_API_KEY = ""
MODEL_NAME = "llama-3.1-8b-instant"

client = Groq(api_key=GROQ_API_KEY)

# ---------------- MEMORY FILE ----------------
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
MEMORY_FILE = os.path.join(BASE_DIR, "memory.json")

if not os.path.exists(MEMORY_FILE):
    with open(MEMORY_FILE, "w") as f:
        json.dump({"history": [], "user_info": {}}, f, indent=4)

# Load memory
with open(MEMORY_FILE, "r") as f:
    memory = json.load(f)

# ---------------- READ INPUT ----------------
if len(sys.argv) < 2:
    print(json.dumps({"reply": "No input received"}))
    sys.exit(0)

try:
    decoded_input = base64.b64decode(sys.argv[1]).decode("utf-8")
    data = json.loads(decoded_input)
    user_query = data.get("message", "").strip()
except Exception as e:
    print(json.dumps({"reply": f"Invalid input format: {str(e)}"}))
    sys.exit(0)

if not user_query:
    print(json.dumps({"reply": "Please send a query."}))
    sys.exit(0)

# ---------------- NAME MEMORY ----------------
lower_msg = user_query.lower()

if lower_msg.startswith("my name is "):
    name = user_query[11:].strip()
    memory["user_info"]["name"] = name
    reply = f"Nice to meet you, {name}."
else:
    user_name = memory.get("user_info", {}).get("name", "")
    
    if user_name:
        system_message = f"You are a helpful AI assistant. User's name is {user_name}."
    else:
        system_message = "You are a helpful AI assistant."

    try:
        response = client.chat.completions.create(
            model=MODEL_NAME,
            messages=[
                {"role": "system", "content": system_message},
                {"role": "user", "content": user_query}
            ]
        )

        reply = response.choices[0].message.content.strip()

    except Exception as e:
        reply = f"Error: {str(e)}"

# ---------------- SAVE MEMORY ----------------
memory["history"].append({"user": user_query})

if not reply.lower().startswith("error"):
    memory["history"].append({"assistant": reply})

# Keep last 40 messages
if len(memory["history"]) > 40:
    memory["history"] = memory["history"][-40:]

with open(MEMORY_FILE, "w") as f:
    json.dump(memory, f, indent=4)

# ---------------- RETURN RESPONSE ----------------
print(json.dumps({"reply": reply}))
