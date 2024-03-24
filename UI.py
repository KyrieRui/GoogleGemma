from huggingface_hub import InferenceClient
import gradio as gr
import random

API_URL = "https://api-inference.huggingface.co/models/"

client = InferenceClient(
    "google/gemma-2b-it"
)

def format_prompt(message, history):
  prompt = "<s>"
  for user_prompt, bot_response in history:
    prompt += f"[INST] {user_prompt} [/INST]"
    prompt += f" {bot_response}</s> "
  prompt += f"[INST] {message} [/INST]"
  return prompt


def generate(prompt, history, temperature=0.9, max_new_tokens=512, top_p=0.95, repetition_penalty=1.0):
    temperature = float(temperature)
    
    top_p = float(top_p)

    gemma_model = dict(
        temperature=temperature,
        max_new_tokens=max_new_tokens,
        top_p=top_p,
        repetition_penalty=repetition_penalty,
        do_sample=True,
        seed=random.randint(0, 111111111),
    )

    formatted_prompt = format_prompt(prompt, history)

    stream = client.text_generation(formatted_prompt, **gemma_model, stream=True, details=True, return_full_text=False)
    output = ""

    for response in stream:
        output += response.token.text
        yield output
    return output

with gr.Blocks() as demo:
    gr.ChatInterface(
        generate,
    )

demo.queue().launch(debug=True, show_api=False)