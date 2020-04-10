from pynput import mouse,keyboard
import subprocess
import time
import os

MY_FOLDER = os.environ["MY_FOLDER"]
def on_move(x, y):
    subprocess.run(["pmset", "displaysleepnow"])
    subprocess.run(["afplay", f"{MY_FOLDER}/Library/quienteconoce.mp3"])
    subprocess.run(["exit"])


def on_click(x, y, button, pressed):
    print('{0} at {1}'.format(
        'Pressed' if pressed else 'Released',
        (x, y)))
    if not pressed:
        # Stop listener
        return False

time.sleep(3)
with mouse.Listener(
        on_move=on_move,
        on_click=on_click,
        on_scroll=on_move) as listener:
    listener.join()


listener = mouse.Listener(
    on_move=on_move,
    on_click=on_click,
    on_scroll=on_move)
listener.start()
