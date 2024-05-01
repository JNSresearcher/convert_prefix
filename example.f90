program main
! Converting a string to a number using decimal prefixes.
! (Spice-like format used in electrical circuit simulation programs).

! Accepted decimal prefix formats in this program  :
! 'f',   femto    1e-15
! 'p',   pico     1e-12
! 'n',   nano     1e-9
! 'u',   micro    1e-6
! 'm',   milli    1e-3
! 'c'    centi    1e-2
! 'h'    hecto    1e+2
! 'k',   kilo     1e+3
! 'meg'  mega     1e+6
! 'g',   giga     1e+9
! 't',   tera     1e+12
! 'pet'  peta     1e+15

! some features:
! - Instead of a decimal point, on can use a prefix: 1.3k = 1k3
! - can put exponential format at the end 
! - spaces inside are ignored
! - prefixes are automatically converted to uppercase during conversion

implicit none
integer,parameter :: siz = 6
type tmp
    character(:), allocatable :: words
endtype tmp

type (tmp) :: w(siz)          ! input array
real(8)    :: nums(siz)       ! output array

real(8)    :: numeric         ! function name
integer i

! Representation of the number 1230 in different formats
    ! most often used:
    w(1)%words = ' 1.23k'  
    w(2)%words = ' 1,23k'
    w(3)%words = '1k23'
    
    ! this is for demonstration:
    w(4)%words = '1 m23e6'    
    w(5)%words = '1meg23e-3'  
    w(6)%words = '1.23e3'

    print '( a , *( a12) )', 'input words:  ', (w(i)%words, i=1,siz)

    do i=1,siz  
        nums(i) = numeric(w(i)%words)
    enddo
    
    print '( a, *(f11.1,1x) )', 'output numbers:', nums

end program main