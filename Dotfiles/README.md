A note on the `setxkbmap_us_mac` file:
It's a modified version of the original us Keymap file to have accent marks and symbols like "~" with dead keys in MacOs.
Changing the "Option" key on Mac keyboard for the "Right Alt" on regular keyboards
`Right Alt+e + [aeiouAEIOU] = áéíóúÁÉÍÓÚ`
`Right Alt+n + [n] = ñ`

```
mv ./setxkbmap_us_mac /usr/share/X11/xkb/symbols/us
setxkbmap -layout us -variant mac
```
