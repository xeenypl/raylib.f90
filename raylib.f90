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

end module raylib
