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

end module raylib
