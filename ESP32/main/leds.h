
#pragma once

#include <xnm/neocontroller.h>

#include <array>

namespace DURG {

enum led_type_t {
    MANE, MANE_HIGHLIGHT,
    HORN, EYE, TOP_FACE, BOTTOM_FACE, BOTTOMEST_FACE
};

struct led_position_t {
  int x;
  int y;
  led_type_t t;
};

struct face_pattern_t {
  std::array<XNM::Neo::Color, 7> colors;
};

static const std::array<face_pattern_t, 5> faces = {
  face_pattern_t({
    {0xA0A0A0, 0xA0A0A0, 0, 0xA0A0A0, 0, 0, 0}
  }),
  face_pattern_t({
    {Material::BLUE, Material::CYAN, 0xFFFFFF, Material::CYAN, Material::RED, Material::RED, 0xFFAAAA}
  }),
  face_pattern_t({
    {Material::AMBER, Material::YELLOW, 0xFFFFFF, 0xFFFF00, Material::BLUE, 0xFFFFFF, 0xFFFFFF}
  }),
  face_pattern_t({
    {Material::DEEP_PURPLE, Material::PURPLE, 0xFFFFFF, Material::PURPLE, Material::GREEN, Material::GREEN, 0xAAFFAA}
  }),
  face_pattern_t({
    {
      0, 0, 0x0000FF, 0, 0
    }})
};

static const std::array<led_position_t, 18> led_positions = {
    led_position_t({22 , -4 , MANE}),
    {19 , -10, MANE_HIGHLIGHT},
    {-2 , -18, MANE_HIGHLIGHT},
    {-9 , -14, MANE}, 
    {-17, -15, MANE_HIGHLIGHT},
    {-24, -8 , MANE}, 
    {-19, -4 , EYE},
    {-21, -6 , TOP_FACE},
    {-25, 5  , TOP_FACE}, 
    {-12, 0  , TOP_FACE},
    {-8,  -9 , TOP_FACE},
    {2,   -14, HORN},
    {3,   -4 , TOP_FACE},
    {15,  0  , TOP_FACE},
    {15,  14 , BOTTOMEST_FACE},
    {-4,  5  , BOTTOM_FACE},
    {-17, 11 , BOTTOM_FACE}
};

XNM::Neo::Color get_color_for(int n);

void init_leds();

}