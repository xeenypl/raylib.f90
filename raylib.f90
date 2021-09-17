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

end module raylib
