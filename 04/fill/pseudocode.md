```
n = SCREEN_HEIGHT * REG_PER_LINE;

while(true) {
    key_is_pressed = SCREEN != 0;
    if (key_is_pressed) {
        fill_colour = -1;
    } else {
        fill_colour = 0;
    }
    for (i = 0; i < n; ++i) {
        SCREEN[i] = fill_colour;
    }
}
```
