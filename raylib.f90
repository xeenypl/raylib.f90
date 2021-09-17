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

end module raylib
