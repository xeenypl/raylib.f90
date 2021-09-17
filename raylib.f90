module raylib
    use, intrinsic :: iso_c_binding
    implicit none

    type, bind(c) :: vector2
        real(c_float) :: x
        real(c_float) :: y
    end type vector2

    type, bind(c) :: vector3
        real(c_float) :: x
        real(c_float) :: y
        real(c_float) :: z
    end type vector3

    type, bind(c) :: vector4
        real(c_float) :: x
        real(c_float) :: y
        real(c_float) :: z
        real(c_float) :: w
    end type vector4

    type, bind(c) :: matrix
        real(c_float) :: m0,  m1,  m2,  m3
        real(c_float) :: m4,  m5,  m6,  m7
        real(c_float) :: m8,  m9,  m10, m11
        real(c_float) :: m12, m13, m14, m15
    end type matrix
    
    type, bind(c) :: color
        integer(c_int8_t) :: r
        integer(c_int8_t) :: g
        integer(c_int8_t) :: b
        integer(c_int8_t) :: a
    end type color
    
    type, bind(c) :: rectangle
        real(c_float) :: x
        real(c_float) :: y
        real(c_float) :: width
        real(c_float) :: height
    end type rectangle

    type, bind(c) :: image
        type(c_ptr) :: data
        integer(c_int) :: width
        integer(c_int) :: height
        integer(c_int) :: mipmaps
        integer(c_int) :: format
    end type image

    type, bind(c) :: texture
        integer(c_int) :: id
        integer(c_int) :: width
        integer(c_int) :: height
        integer(c_int) :: mipmaps
        integer(c_int) :: format
    end type texture
    
    type, bind(c) :: render_texture
        integer(c_int) :: id
        type(texture) :: texture
        type(texture) :: depth
    end type render_texture

    type, bind(c) :: n_patch_info
        type(rectangle) :: source
        integer(c_int) :: left
        integer(c_int) :: top
        integer(c_int) :: right
        integer(c_int) :: bottom
        integer(c_int) :: layout
    end type n_patch_info

    type, bind(c) :: char_info
        integer(c_int) :: value
        integer(c_int) :: offset_x
        integer(c_int) :: offset_y
        integer(c_int) :: advance_x
        type(image) :: image
    end type char_info

    ! todo: font

    type, bind(c) :: camera3d
        type(vector3) :: position
        type(vector3) :: terget
        type(vector3) :: up
        real(c_float) :: fovy
        integer(c_int) :: projection
    end type camera3d

    type, bind(c) :: camera2d
        type(vector2) :: offset
        type(vector2) :: terget
        real(c_float) :: rotation
        real(c_float) :: zoom
    end type camera2d

    ! todo mesh
    ! todo shader

    type, bind(c) :: material_map
        type(texture) :: texture
        type(color) :: color
        real(c_float) :: value
    end type material_map

    ! todo material

    type, bind(c) :: transform
        type(vector3) :: translation
        type(vector4) :: rotation
        type(vector3) :: scale
    end type transform

    type, bind(c) :: bone_info
        character(c_char), dimension(32) :: name
        integer(c_int) :: parent
    end type bone_info

    ! todo model
    ! todo model_animation

    type, bind(c) :: ray
        type(vector3) :: position
        type(vector3) :: direction
    end type ray

    type, bind(c) :: ray_hit_info
        logical(c_bool) :: hit
        real(c_float) :: distance
        type(vector3) :: position
        type(vector3) :: normal
    end type ray_hit_info

    type, bind(c) :: bounding_box
        type(vector3) :: min
        type(vector3) :: max
    end type bounding_box

    type, bind(c) :: wave
        integer(c_int) :: sample_count
        integer(c_int) :: sample_rate
        integer(c_int) :: sample_size
        integer(c_int) :: channels
        type(c_ptr) :: data
    end type wave

    type, bind(c) :: audio_stream
        type(c_ptr) :: buffer
        integer(c_int) :: sample_rate
        integer(c_int) :: sample_size
        integer(c_int) :: channels
    end type audio_stream

    type, bind(c) :: sound
        type(audio_stream) :: stream
        integer(c_int) :: sample_count
    end type sound

    type, bind(c) :: music
        type(audio_stream) :: stream
        integer(c_int) :: sample_count
        logical(c_bool) :: looping
        
        integer(c_int) :: ctx_type
        type(c_ptr) :: ctx_data
    end type music

    type, bind(c) :: vr_device_info
        integer(c_int) :: h_resolution
        integer(c_int) :: v_resolution
        real(c_float) :: h_screen_size
        real(c_float) :: v_screen_size
        real(c_float) :: v_screen_center
        real(c_float) :: eye_to_screen_distance
        real(c_float) :: lens_separation_distance
        real(c_float) :: interpupillary_distance
        real(c_float), dimension(4) :: lens_distortion_values
        real(c_float), dimension(4) :: chroma_ab_correction
    end type vr_device_info

    type, bind(c) :: vr_stereo_config
        type(matrix), dimension(2) :: projection
        type(matrix), dimension(2) :: view_offset
        real(c_float), dimension(2) :: left_lens_center
        real(c_float), dimension(2) :: right_lens_center
        real(c_float), dimension(2) :: left_screen_center
        real(c_float), dimension(2) :: right_screen_center
        real(c_float), dimension(2) :: scale
        real(c_float), dimension(2) :: scale_in
    end type vr_stereo_config

    ! todo ConfigFlags

    ! Trace log level
    integer(c_int) :: LOG_ALL     = 0
    integer(c_int) :: LOG_TRACE   = 1
    integer(c_int) :: LOG_DEBUG   = 2
    integer(c_int) :: LOG_INFO    = 3
    integer(c_int) :: LOG_WARNING = 4
    integer(c_int) :: LOG_ERROR   = 5
    integer(c_int) :: LOG_FATAL   = 6
    integer(c_int) :: LOG_NONE    = 7
    ! Keyboard keys
    integer(c_int) :: KEY_NULL            = 0
    ! Alphanumeric keys
    integer(c_int) :: KEY_APOSTROPHE      = 39
    integer(c_int) :: KEY_COMMA           = 44
    integer(c_int) :: KEY_MINUS           = 45
    integer(c_int) :: KEY_PERIOD          = 46
    integer(c_int) :: KEY_SLASH           = 47
    integer(c_int) :: KEY_ZERO            = 48
    integer(c_int) :: KEY_ONE             = 49
    integer(c_int) :: KEY_TWO             = 50
    integer(c_int) :: KEY_THREE           = 51
    integer(c_int) :: KEY_FOUR            = 52
    integer(c_int) :: KEY_FIVE            = 53
    integer(c_int) :: KEY_SIX             = 54
    integer(c_int) :: KEY_SEVEN           = 55
    integer(c_int) :: KEY_EIGHT           = 56
    integer(c_int) :: KEY_NINE            = 57
    integer(c_int) :: KEY_SEMICOLON       = 59
    integer(c_int) :: KEY_EQUAL           = 61
    integer(c_int) :: KEY_A               = 65
    integer(c_int) :: KEY_B               = 66
    integer(c_int) :: KEY_C               = 67
    integer(c_int) :: KEY_D               = 68
    integer(c_int) :: KEY_E               = 69
    integer(c_int) :: KEY_F               = 70
    integer(c_int) :: KEY_G               = 71
    integer(c_int) :: KEY_H               = 72
    integer(c_int) :: KEY_I               = 73
    integer(c_int) :: KEY_J               = 74
    integer(c_int) :: KEY_K               = 75
    integer(c_int) :: KEY_L               = 76
    integer(c_int) :: KEY_M               = 77
    integer(c_int) :: KEY_N               = 78
    integer(c_int) :: KEY_O               = 79
    integer(c_int) :: KEY_P               = 80
    integer(c_int) :: KEY_Q               = 81
    integer(c_int) :: KEY_R               = 82
    integer(c_int) :: KEY_S               = 83
    integer(c_int) :: KEY_T               = 84
    integer(c_int) :: KEY_U               = 85
    integer(c_int) :: KEY_V               = 86
    integer(c_int) :: KEY_W               = 87
    integer(c_int) :: KEY_X               = 88
    integer(c_int) :: KEY_Y               = 89
    integer(c_int) :: KEY_Z               = 90
    ! Function keys
    integer(c_int) :: KEY_SPACE           = 32
    integer(c_int) :: KEY_ESCAPE          = 256
    integer(c_int) :: KEY_ENTER           = 257
    integer(c_int) :: KEY_TAB             = 258
    integer(c_int) :: KEY_BACKSPACE       = 259
    integer(c_int) :: KEY_INSERT          = 260
    integer(c_int) :: KEY_DELETE          = 261
    integer(c_int) :: KEY_RIGHT           = 262
    integer(c_int) :: KEY_LEFT            = 263
    integer(c_int) :: KEY_DOWN            = 264
    integer(c_int) :: KEY_UP              = 265
    integer(c_int) :: KEY_PAGE_UP         = 266
    integer(c_int) :: KEY_PAGE_DOWN       = 267
    integer(c_int) :: KEY_HOME            = 268
    integer(c_int) :: KEY_END             = 269
    integer(c_int) :: KEY_CAPS_LOCK       = 280
    integer(c_int) :: KEY_SCROLL_LOCK     = 281
    integer(c_int) :: KEY_NUM_LOCK        = 282
    integer(c_int) :: KEY_PRINT_SCREEN    = 283
    integer(c_int) :: KEY_PAUSE           = 284
    integer(c_int) :: KEY_F1              = 290
    integer(c_int) :: KEY_F2              = 291
    integer(c_int) :: KEY_F3              = 292
    integer(c_int) :: KEY_F4              = 293
    integer(c_int) :: KEY_F5              = 294
    integer(c_int) :: KEY_F6              = 295
    integer(c_int) :: KEY_F7              = 296
    integer(c_int) :: KEY_F8              = 297
    integer(c_int) :: KEY_F9              = 298
    integer(c_int) :: KEY_F10             = 299
    integer(c_int) :: KEY_F11             = 300
    integer(c_int) :: KEY_F12             = 301
    integer(c_int) :: KEY_LEFT_SHIFT      = 340
    integer(c_int) :: KEY_LEFT_CONTROL    = 341
    integer(c_int) :: KEY_LEFT_ALT        = 342
    integer(c_int) :: KEY_LEFT_SUPER      = 343
    integer(c_int) :: KEY_RIGHT_SHIFT     = 344
    integer(c_int) :: KEY_RIGHT_CONTROL   = 345
    integer(c_int) :: KEY_RIGHT_ALT       = 346
    integer(c_int) :: KEY_RIGHT_SUPER     = 347
    integer(c_int) :: KEY_KB_MENU         = 348
    integer(c_int) :: KEY_LEFT_BRACKET    = 91
    integer(c_int) :: KEY_BACKSLASH       = 92
    integer(c_int) :: KEY_RIGHT_BRACKET   = 93
    integer(c_int) :: KEY_GRAVE           = 96
    ! Keypad keys
    integer(c_int) :: KEY_KP_0            = 320
    integer(c_int) :: KEY_KP_1            = 321
    integer(c_int) :: KEY_KP_2            = 322
    integer(c_int) :: KEY_KP_3            = 323
    integer(c_int) :: KEY_KP_4            = 324
    integer(c_int) :: KEY_KP_5            = 325
    integer(c_int) :: KEY_KP_6            = 326
    integer(c_int) :: KEY_KP_7            = 327
    integer(c_int) :: KEY_KP_8            = 328
    integer(c_int) :: KEY_KP_9            = 329
    integer(c_int) :: KEY_KP_DECIMAL      = 330
    integer(c_int) :: KEY_KP_DIVIDE       = 331
    integer(c_int) :: KEY_KP_MULTIPLY     = 332
    integer(c_int) :: KEY_KP_SUBTRACT     = 333
    integer(c_int) :: KEY_KP_ADD          = 334
    integer(c_int) :: KEY_KP_ENTER        = 335
    integer(c_int) :: KEY_KP_EQUAL        = 336
    ! Android key buttons
    integer(c_int) :: KEY_BACK            = 4
    integer(c_int) :: KEY_MENU            = 82
    integer(c_int) :: KEY_VOLUME_UP       = 24
    integer(c_int) :: KEY_VOLUME_DOWN     = 25
    ! Mouse buttons
    integer(c_int) :: MOUSE_LEFT_BUTTON   = 0
    integer(c_int) :: MOUSE_RIGHT_BUTTON  = 1
    integer(c_int) :: MOUSE_MIDDLE_BUTTON = 2
    ! Mouse cursor
    integer(c_int) :: MOUSE_CURSOR_DEFAULT       = 0
    integer(c_int) :: MOUSE_CURSOR_ARROW         = 1
    integer(c_int) :: MOUSE_CURSOR_IBEAM         = 2
    integer(c_int) :: MOUSE_CURSOR_CROSSHAIR     = 3
    integer(c_int) :: MOUSE_CURSOR_POINTING_HAND = 4
    integer(c_int) :: MOUSE_CURSOR_RESIZE_EW     = 5
    integer(c_int) :: MOUSE_CURSOR_RESIZE_NS     = 6
    integer(c_int) :: MOUSE_CURSOR_RESIZE_NWSE   = 7
    integer(c_int) :: MOUSE_CURSOR_RESIZE_NESW   = 8
    integer(c_int) :: MOUSE_CURSOR_RESIZE_ALL    = 9
    integer(c_int) :: MOUSE_CURSOR_NOT_ALLOWED   = 10
    ! Gamepad buttons
    integer(c_int) :: GAMEPAD_BUTTON_UNKNOWN = 0
    ! This is normally a DPAD
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_FACE_UP    = 1
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_FACE_DOWN  = 3
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_FACE_LEFT  = 4
    ! This normally corresponds with PlayStation and Xbox controllers
    ! XBOX: [Y,X,A,B]
    ! PS3: [Triangle,Square,Cross,Circle]
    ! No support for 6 button controllers though..
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_FACE_UP    = 5
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_FACE_DOWN  = 7
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_FACE_LEFT  = 8
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_TRIGGER_1   = 9
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_TRIGGER_2   = 10
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_TRIGGER_1  = 11
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_TRIGGER_2  = 12
    integer(c_int) :: GAMEPAD_BUTTON_MIDDLE_LEFT      = 13 ! PS3 Select
    integer(c_int) :: GAMEPAD_BUTTON_MIDDLE           = 14 ! PS Button/XBOX Button
    integer(c_int) :: GAMEPAD_BUTTON_MIDDLE_RIGHT     = 15 ! PS3 Start
    ! These are the joystick press in buttons
    integer(c_int) :: GAMEPAD_BUTTON_LEFT_THUMB       = 16
    integer(c_int) :: GAMEPAD_BUTTON_RIGHT_THUMB      = 17

end module raylib
