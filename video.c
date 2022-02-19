#include "video.h"
#include "emustate.h"

extern unsigned char charrom_bin[2048]; // Character ROM contents

// Original Aquarius palette
// static const uint32_t palette[16] = {
//     0x101010, 0xf71010, 0x10f710, 0xf7ef10,
//     0x2121de, 0xf710f7, 0x31c6c6, 0xf7f7f7,
//     0xc6c6c6, 0x29adad, 0xc621c6, 0x42108c,
//     0xf7f773, 0x21ce42, 0xad2121, 0x313131};

// 2-Bit Aquarius palette
// optimized for a better color range.
// static const uint32_t palette[16] = {
//     0x000000, 0xff0000, 0x55ff55, 0xffaa00,
//     0x0000ff, 0xff00ff, 0x55aaff, 0xffffff,
//     0xaaaaaa, 0x0055aa, 0xaa00aa, 0x000055,
//     0xffff55, 0x55aa55, 0xaa0000, 0x555555};

// 2-Bit Aquarius palette
// optimized to match STOCK color.
// static const uint32_t palette[16] = {
//     0x000000, 0xff0000, 0x55ff55, 0xffff00,
//     0x0000ff, 0xff00ff, 0x00ffff, 0xffffff,
//     0xaaaaaa, 0x00aaaa, 0xaa00aa, 0x0000aa,
//     0xffffaa, 0x55aa55, 0xaa0000, 0x555555};

static uint8_t screen[VIDEO_WIDTH * VIDEO_HEIGHT];

static const uint8_t text_palette[16] = {
    0x00, 0x03, 0x1D, 0x1F,
    0x30, 0x33, 0x29, 0x3F,
    0x2A, 0x28, 0x22, 0x20,
    0x2F, 0x19, 0x02, 0x15};

const uint8_t *video_get_fb(void) {
    return screen;
}

static inline void draw_char(uint8_t ch, uint8_t color, int row, int column) {
    uint8_t        fgcol = text_palette[color >> 4];
    uint8_t        bgcol = text_palette[color & 0xF];
    const uint8_t *ps    = &charrom_bin[ch * 8];

    uint8_t *pd = &screen[(row * 8) * VIDEO_WIDTH + column * 8];

    for (int j = 0; j < 8; j++) {
        for (int i = 0; i < 8; i++) {
            pd[i] = (ps[j] & (1 << (7 - i))) ? fgcol : bgcol;
        }
        pd += VIDEO_WIDTH;
    }
}

void draw_screen(void) {
    uint8_t border_ch    = emustate.ram[0];
    uint8_t border_color = emustate.ram[0x400];

    for (int row = 0; row < 28; row++) {
        for (int column = 0; column < 44; column++) {
            if (row >= 2 && row < 26 && column >= 2 && column < 42)
                continue;

            draw_char(border_ch, border_color, row, column);
        }
    }

    for (int row = 0; row < 24; row++) {
        for (int column = 0; column < 40; column++) {
            uint8_t ch    = emustate.ram[(row + 1) * 40 + column];
            uint8_t color = emustate.ram[0x400 + (row + 1) * 40 + column];
            draw_char(ch, color, row + 2, column + 2);
        }
    }
}