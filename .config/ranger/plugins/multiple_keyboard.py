#!/usr/bin/env python3
# coding: utf-8
# multiple_keyboard.py. [ranger](https://github.com/ranger/ranger)

#  ----------------------------------------------------------------------
#  It is plugin for ranger ;). It allows you to enable support input
#  commands for other keyboard layouts. By default, Russian and Ukrainian
#  are supported. You can add or replace support for your keyboard
#  layouts. To do this, fill in the following fields: other_keys, en_keys
#  You can use merge mode (usually used for S-[0-9]), other_keys_mm.
#  To use it you need to fill in the other_keys_mm.
#  ----------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)
import ranger.api
HOOK_READY_OLD = ranger.api.hook_init

other_keys    = "фисвуапршолдьтщзйкыіегмцчнябюхъїжэєё'" + 'ФИСВУАПРШОЛДЬТЩЗЙКЫІЕГМЦЧНЯБЮХЪЇЖЭЄЁʼ' + '№'
en_keys       = "abcdefghijklmnopqrsstuvwxyz,.[]];''``" + 'ABCDEFGHIJKLMNOPQRSSTUVWXYZ<>{}}:""~ʼ' + '#' \
                '@$^?/?'
other_keys_mm = '";:&.,'

import os
import sys
import curses

from ranger.ext.keybinding_parser import ALT_KEY

def hook_ready(fm):
    try:
        import ranger.core.keyboard
    except ImportError:
        import ranger.gui.ui as ui
        ui.UI.handle_input = handle_input
    return HOOK_READY_OLD(fm)

def handle_input(self):
    def _key_is_merge_getter(ch):  # Handle keys S-[ 0-9]
        i = len(other_keys) + other_keys_mm.index(ch)
        if i < len(en_keys): return ord(en_keys[i])
        return -1

    def key_translate(keys, cv=not self.console.visible):  # translate key from other_keys into en_keys
        if cv or self.console.question_queue:
            a = []
            for i in keys:
                s = '{0:X}'.format(i)
                if len(s)%2!=0: s = '0' + s
                a.append(bytes.fromhex(s))
            try:
                ch = b''.join(a).decode('utf-8')
            except UnicodeDecodeError:
                return []
            if ch in other_keys:
                ch = en_keys[other_keys.index(ch)]
                return [ord(ch)]

    def simple_key(key):  # Handle simple key presses, CTRL+X, etc here:
        if key >= 0:
            if self.settings.flushinput and not self.console.visible:
                curses.flushinp()
            if key == curses.KEY_MOUSE:
                self.handle_mouse()
            elif key == curses.KEY_RESIZE:
                self.update_size()
            else:
                if not self.fm.input_is_blocked():
                    if chr(key) in other_keys_mm and not self.console.visible:
                        key = _key_is_merge_getter(chr(key))
                    self.handle_key(key)
        elif key == -1 and not os.isatty(sys.stdin.fileno()):
            self.fm.exit()  # STDIN has been closed

    keys = self.win.getch()
    if keys == 27 or (keys >= 128 and keys < 256):  # Handle special keys like ALT+X or unicode here
        keys = [keys]
        previous_load_mode = self.load_mode
        self.set_load_mode(True)
        for _ in range(4):
            getkey = self.win.getch()
            if getkey != -1: keys.append(getkey)
        tkeys = key_translate(keys)
        if tkeys: return simple_key(tkeys[0])
        if len(keys) == 1:
            keys.append(-1)
        elif keys[0] == 27:
            keys[0] = ALT_KEY
            tkeys = key_translate(keys[1:], True)
            if tkeys: keys = keys[0:1] + tkeys
        if self.settings.xterm_alt_key:
            if len(keys) == 2 and keys[1] in range(127, 256):
                if keys[0] == 195:
                    keys = [ALT_KEY, keys[1] - 64]
                elif keys[0] == 194:
                    keys = [ALT_KEY, keys[1] - 128]
        self.handle_keys(*keys)
        self.set_load_mode(previous_load_mode)
        if self.settings.flushinput and not self.console.visible:
            curses.flushinp()
    else:
        simple_key(keys)

ranger.api.hook_ready = hook_ready
