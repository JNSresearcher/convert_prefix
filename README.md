Converting a string to a number using decimal prefixes.  
(Spice-like format used in electrical circuit simulation programs).

Accepted decimal prefixes formats in this program :  
 
| Symbol | &emsp; Prefix &emsp; | Exponential equivalent |
|:-      | :-                   | :-           |
| 'f'    | &emsp; _femto_       | &emsp; 1e-15 |
| 'p'    | &emsp; _pico_        | &emsp; 1e-12 |
| 'n'    | &emsp; _nano_        | &emsp; 1e-9  |
| 'u'    | &emsp; _micro_       | &emsp; 1e-6  |
| 'm'    | &emsp; _milli_       | &emsp; 1e-3  |
| 'c'    | &emsp; _centi_       | &emsp; 1e-2  |
| 'h'    | &emsp; _hecto_       | &emsp; 1e+2  |
| 'k'    | &emsp; _kilo_        | &emsp; 1e+3  |
| 'meg'  | &emsp; _mega_        | &emsp; 1e+6  |
| 'g'    | &emsp; _giga_        | &emsp; 1e+9  |
| 't'    | &emsp; _tera_        | &emsp; 1e+12 |
| 'pet'  | &emsp; _peta_        | &emsp; 1e+15 |

 Some features:  
 - instead of a decimal point, you can use a prefix: 1.3k = 1k3  
 - can put exponential format at the end  
 - spaces inside are ignored  
 - prefixes are automatically converted to uppercase during conversion  

Example:  

```
program main

implicit none
integer,parameter :: siz=6
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
```

Result:  
```
input words:         1.23k       1,23k        1k23     1 m23e6   1meg23e-3      1.23e3
output numbers:     1230.0      1230.0      1230.0      1230.0      1230.0      1230.0
```


&emsp;For testing on used _gfortran_ version 13.1 for _Windows_. The directory contains a _Makefile_ for building using the _make_ command.