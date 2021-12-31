#
# Windows-only (right now)
# Copyright (c) 2016 Alexander Pruss. MIT License
#

from platform import system

if system() == 'Windows':
    from ctypes import windll

    LBUTTON = 1
    RBUTTON = 2
    CANCEL = 3
    MBUTTON = 4
    BACK = 8
    TAB = 9
    CLEAR = 12
    RETURN = 13
    SHIFT = 16
    CONTROL = 17
    MENU = 18
    PAUSE = 19
    CAPITAL = 20
    KANA = 21
    HANGUL = 21
    JUNJA = 23
    FINAL = 24
    HANJA = 25
    KANJI = 25
    ESCAPE = 27
    CONVERT = 28
    NONCONVERT = 29
    ACCEPT = 30
    MODECHANGE = 31
    SPACE = 32
    PRIOR = 33
    NEXT = 34
    END = 35
    HOME = 36
    LEFT = 37
    UP = 38
    RIGHT = 39
    DOWN = 40
    SELECT = 41
    PRINT = 42
    EXECUTE = 43
    SNAPSHOT = 44
    INSERT = 45
    DELETE = 46
    HELP = 47
    LWIN = 91
    RWIN = 92
    APPS = 93
    NUMPAD0 = 96
    NUMPAD1 = 97
    NUMPAD2 = 98
    NUMPAD3 = 99
    NUMPAD4 = 100
    NUMPAD5 = 101
    NUMPAD6 = 102
    NUMPAD7 = 103
    NUMPAD8 = 104
    NUMPAD9 = 105
    MULTIPLY = 106
    ADD = 107
    SEPARATOR = 108
    SUBTRACT = 109
    DECIMAL = 110
    DIVIDE = 111
    F1 = 112
    F2 = 113
    F3 = 114
    F4 = 115
    F5 = 116
    F6 = 117
    F7 = 118
    F8 = 119
    F9 = 120
    F10 = 121
    F11 = 122
    F12 = 123
    F13 = 124
    F14 = 125
    F15 = 126
    F16 = 127
    F17 = 128
    F18 = 129
    F19 = 130
    F20 = 131
    F21 = 132
    F22 = 133
    F23 = 134
    F24 = 135
    NUMLOCK = 144
    SCROLL = 145
    LSHIFT = 160
    RSHIFT = 161
    LCONTROL = 162
    RCONTROL = 163
    LMENU = 164
    RMENU = 165
    PROCESSKEY = 229
    ATTN = 246
    CRSEL = 247
    EXSEL = 248
    EREOF = 249
    PLAY = 250
    ZOOM = 251
    NONAME = 252
    PA1 = 253
    OEM_CLEAR = 254
    XBUTTON1 = 0x05
    XBUTTON2 = 0x06
    VOLUME_MUTE = 0xAD
    VOLUME_DOWN = 0xAE
    VOLUME_UP = 0xAF
    MEDIA_NEXT_TRACK = 0xB0
    MEDIA_PREV_TRACK = 0xB1
    MEDIA_PLAY_PAUSE = 0xB3
    BROWSER_BACK = 0xA6
    BROWSER_FORWARD = 0xA7

    def getPressState(key):
        v = windll.user32.GetAsyncKeyState(int(key))
        return bool(0x8000 & v), bool(0x0001 & v)
    
    def isPressedNow(key):
        return bool(0x8000 & windll.user32.GetAsyncKeyState(int(key)))

    def wasPressedSinceLast(key):
        return bool(0x0001 & windll.user32.GetAsyncKeyState(int(key)))
        
    def clearPressBuffer(key):
        while wasPressedSinceLast(key):
            pass

elif system() == 'Linux':
    from pynput.keyboard import Key, KeyCode, Listener as KListener
    from pynput.mouse import Button, Listener as MListener

    LBUTTON = Button.left
    RBUTTON = Button.right
    CANCEL = Key.delete
    MBUTTON = Button.middle
    BACK = Key.backspace
    TAB = Key.tab
    CLEAR = Key.delete
    RETURN = Key.enter
    SHIFT = Key.shift
    CONTROL = Key.ctrl
    MENU = Key.menu
    PAUSE = Key.media_play_pause
    CAPITAL = Key.caps_lock
    KANA = 21
    HANGUL = 21
    JUNJA = 23
    FINAL = 24
    HANJA = 25
    KANJI = 25
    ESCAPE = Key.esc
    CONVERT = 28
    NONCONVERT = 29
    ACCEPT = 30
    MODECHANGE = 31
    SPACE = 32
    PRIOR = 33
    NEXT = 34
    END = Key.end
    HOME = Key.home
    LEFT = Key.left
    UP = Key.up
    RIGHT = Key.right
    DOWN = Key.down
    SELECT = 41
    PRINT = Key.print_screen
    EXECUTE = 43
    SNAPSHOT = 44
    INSERT = Key.insert
    DELETE = Key.delete
    HELP = 47
    LWIN = Key.cmd
    RWIN = Key.cmd_r
    APPS = 93
    NUMPAD0 = 96
    NUMPAD1 = 97
    NUMPAD2 = 98
    NUMPAD3 = 99
    NUMPAD4 = 100
    NUMPAD5 = 101
    NUMPAD6 = 102
    NUMPAD7 = 103
    NUMPAD8 = 104
    NUMPAD9 = 105
    MULTIPLY = 106
    ADD = 107
    SEPARATOR = 108
    SUBTRACT = 109
    DECIMAL = 110
    DIVIDE = 111
    F1 = Key.f1
    F2 = Key.f2
    F3 = Key.f3
    F4 = Key.f4
    F5 = Key.f5
    F6 = Key.f6
    F7 = Key.f7
    F8 = Key.f8
    F9 = Key.f9
    F10 = Key.f10
    F11 = Key.f11
    F12 = Key.f12
    F13 = Key.f13
    F14 = Key.f14
    F15 = Key.f15
    F16 = Key.f16
    F17 = Key.f17
    F18 = Key.f18
    F19 = Key.f19
    F20 = Key.f20
    F21 = 132
    F22 = 133
    F23 = 134
    F24 = 135
    NUMLOCK = Key.num_lock
    SCROLL = Key.scroll_lock
    LSHIFT = Key.shift
    RSHIFT = Key.shift_r
    LCONTROL = Key.ctrl
    RCONTROL = Key.ctrl_r
    LMENU = Key.menu
    RMENU = Key.menu
    PROCESSKEY = 229
    ATTN = 246
    CRSEL = 247
    EXSEL = 248
    EREOF = 249
    PLAY = Key.media_play_pause
    ZOOM = 251
    NONAME = 252
    PA1 = 253
    OEM_CLEAR = 254
    XBUTTON1 = 0x05
    XBUTTON2 = 0x06
    VOLUME_MUTE = Key.media_volume_mute
    VOLUME_DOWN = Key.media_volume_down
    VOLUME_UP = Key.media_volume_up
    MEDIA_NEXT_TRACK = Key.media_next
    MEDIA_PREV_TRACK = Key.media_previous
    MEDIA_PLAY_PAUSE = Key.media_play_pause
    BROWSER_BACK = 0xA6
    BROWSER_FORWARD = 0xA7

    PAGE_DOWN = Key.page_down
    PAGE_UP = Key.page_up


    class KeyStatus:
        pressed = []
        released = []

    def convertKey(key):
        if type(key) == Key:
            return key if key.value.char is None else key.value
        elif type(key) != int:
            return key
        return KeyCode(char=chr(key))

    def getPressState(key):
        return isPressedNow(key), wasPressedSinceLast(key)

    def isPressedNow(key):
        k = convertKey(key)
        if k in KeyStatus.pressed:
            KeyStatus.pressed.remove(k)
            return True
        return False

    def wasPressedSinceLast(key):
        k = convertKey(key)
        if k in KeyStatus.released:
            KeyStatus.released.remove(k)
            return True
        return False

    def clearPressBuffer(key):
        while wasPressedSinceLast(key):
            pass

    def matchable_key(key):
        if type(key) == Key:
            return key if key.value.char is None else key.value
        if type(key) == KeyCode:
            return key
        if type(key) != int:
            return key
        return KeyCode(char=key if type(key) == int else chr(key))

    def key_down(key):
        k = matchable_key(key)
        if len(KeyStatus.pressed) > 0 and KeyStatus.pressed[len(KeyStatus.pressed) - 1] == k:
            return
        KeyStatus.pressed.append(k)

    def key_up(key):
        k = matchable_key(key)
        KeyStatus.released.append(k)

    listener = KListener(on_press=key_down, on_release=key_up)
    listener.start()
else:
    raise Exception('Platform '+system()+' not supported.')
            
if __name__ == '__main__':
    from time import sleep
    print("Press ESC to exit. Testing spacebar and backspace.")
    while True:
        if wasPressedSinceLast(ESCAPE):
            print("Done")
            break
        if isPressedNow(BACK):
            print("BACKSPACE is pressed")
        now, last = getPressState(ord(' '))
        if now or last:
            print(now, last)
        sleep(0.01)
