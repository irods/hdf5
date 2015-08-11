!****p* Program/H5test_kind
!
! NAME
!  Executable: H5test_kind
!
! FILE
!  fortran/src/H5test_kind.f90
!
! PURPOSE
!  This stand alone program is used at build time to generate the program
!  H5fortran_detect.f90. It cycles through all the available KIND parameters for
!  integers and reals. The appropriate program and subroutines are then generated
!  depending on which of the KIND values are found.
!
! NOTES
!  This program is depreciated in favor of H5test_kind_SIZEOF.f90 and is only
!  used when the Fortran intrinsic function SIZEOF is not available. It generates
!  code that does not make use of SIZEOF in H5fortran_detect.f90 which is less
!  portable in comparison to using SIZEOF.
!
!  The availability of SIZEOF is checked at configure time and the TRUE/FALSE
!  condition is set in the configure variable "FORTRAN_HAVE_SIZEOF".
!
! COPYRIGHT
!  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
!  Copyright by The HDF Group.                                                 *
!  Copyright by the Board of Trustees of the University of Illinois.           *
!  All rights reserved.                                                        *
!                                                                              *
!  This file is part of HDF5.  The full HDF5 copyright notice, including       *
!  terms governing use, modification, and redistribution, is contained in      *
!  the files COPYING and Copyright.html.  COPYING can be found at the root     *
!  of the source code distribution tree; Copyright.html can be found at the    *
!  root level of an installed copy of the electronic HDF5 document set and     *
!  is linked from the top-level documents page.  It can also be found at       *
!  http://hdfgroup.org/HDF5/doc/Copyright.html.  If you do not have            *
!  access to either file, you may request a copy from help@hdfgroup.org.       *
!  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
!
! AUTHOR
!  Elena Pourma
!
!*****

PROGRAM test_kind
  IMPLICIT NONE
  INTEGER :: i, j, ii, ir, last, ikind_numbers(10), rkind_numbers(10)
  INTEGER :: ji, jr, jd
  last = -1
  ii = 0
  j = SELECTED_INT_KIND(18)
  DO i = 1,100
     j = SELECTED_INT_KIND(i)
     IF(j .NE. last) THEN
        IF(last .NE. -1) THEN
           ii = ii + 1
           ikind_numbers(ii) = last
        ENDIF
        last = j
        IF(j .EQ. -1) EXIT
     ENDIF
  ENDDO

  last = -1
  ir = 0
  DO i = 1,100
     j = SELECTED_REAL_KIND(i)
     IF(j .NE. last) THEN
        IF(last .NE. -1) THEN
           ir = ir + 1
           rkind_numbers(ir) = last
        ENDIF
        last = j
        IF(j .EQ. -1) EXIT
     ENDIF
  ENDDO

!  Generate program information:

WRITE(*,'(40(A,/))') &
'!****h* ROBODoc/H5fortran_detect.f90',&
'!',&
'! NAME',&
'!  H5fortran_detect',&
'! ',&
'! PURPOSE',&
'!  This stand alone program is used at build time to generate the header file',&
'!  H5fort_type_defines.h. The source code itself was automatically generated by',&
'!  the program H5test_kind.f90',&
'!',&
'! NOTES',&
'!  This source code does not make use of the Fortran intrinsic function SIZEOF because',&
'!  the availability of the intrinsic function was determined to be not available at',&
'!  configure time',&
'!',&
'! * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *',&
'!   Copyright by The HDF Group.                                               *',&
'!   Copyright by the Board of Trustees of the University of Illinois.         *',&
'!   All rights reserved.                                                      *',&
'!                                                                             *',&
'!   This file is part of HDF5.  The full HDF5 copyright notice, including     *',&
'!   terms governing use, modification, and redistribution, is contained in    *',&
'!   the files COPYING and Copyright.html.  COPYING can be found at the root   *',&
'!   of the source code distribution tree; Copyright.html can be found at the  *',&
'!   root level of an installed copy of the electronic HDF5 document set and   *',&
'!   is linked from the top-level documents page.  It can also be found at     *',&
'!   http://hdfgroup.org/HDF5/doc/Copyright.html.  If you do not have          *',&
'!   access to either file, you may request a copy from help@hdfgroup.org.     *',&
'! * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *',&
'!',&
'! AUTHOR',&
'!  H5test_kind.f90',&
'!',&
'!*****'

!  Generate a program

  WRITE(*,*) "PROGRAM int_kind"
  WRITE(*,*) "WRITE(*,*) "" /*generating header file*/ """
  ji = 0
  WRITE(*, "("" CALL i"", i2.2,""()"")") ji
  jr = 0
  WRITE(*, "("" CALL r"", i2.2,""()"")") jr
  jd = 0
  WRITE(*, "("" CALL d"", i2.2,""()"")") jd
  DO i = 1, ii
     j = ikind_numbers(i)
     WRITE(*, "("" CALL i"", i2.2,""()"")") j
  ENDDO
  DO i = 1, ir
     j = rkind_numbers(i)
     WRITE(*, "("" CALL r"", i2.2,""()"")") j
  ENDDO
  WRITE(*,*) "END PROGRAM int_kind"
  j = 0
  ji = KIND(1)
  WRITE(*, "("" SUBROUTINE i"", i2.2,""()"")") j
  WRITE(*,*)"   IMPLICIT NONE"
  WRITE(*,*)"   INTEGER :: a = 0"
  WRITE(*,*)"   INTEGER :: a_size"
  WRITE(*,*)"   CHARACTER(LEN=2) :: jchr2"
  WRITE(*,*)"   a_size = BIT_SIZE(a)"
  WRITE(*,*)"   IF (a_size .EQ. 8) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",ji
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_NATIVE_1_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   endif"
  WRITE(*,*)"   IF (a_size .EQ. 16) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",ji
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_NATIVE_2_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   endif"
  WRITE(*,*)"   IF (a_size .EQ. 32) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",ji
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_NATIVE_4_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   IF (a_size .EQ. 64) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",ji
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_NATIVE_8_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   IF (a_size .EQ. 128) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",ji
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_NATIVE_16_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   RETURN"
  WRITE(*,*)"END SUBROUTINE"
  jr = KIND(1.0)
  WRITE(*, "("" SUBROUTINE r"", i2.2,""()"")") j
  WRITE(*,*)"   IMPLICIT NONE"
  WRITE(*,*)"   REAL :: b(32)"
  WRITE(*,*)"   INTEGER :: a(1)"
  WRITE(*,*)"   INTEGER :: a_size"
  WRITE(*,*)"   INTEGER :: real_size"
  WRITE(*,*)"   CHARACTER(LEN=2) :: jchr2"
  WRITE(*,*)"   a_size = BIT_SIZE(a(1)) ! Size in bits for integer"
  WRITE(*,*)"   real_size = (SIZE(TRANSFER(b,a))*a_size)/SIZE(b)"
  WRITE(*,*)"   IF (real_size .EQ. 32) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",jr
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_REAL_NATIVE_4_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   IF (real_size .EQ. 64) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",jr
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_REAL_NATIVE_8_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   IF (real_size .EQ. 128) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",jr
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_REAL_NATIVE_16_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   RETURN"
  WRITE(*,*)"END SUBROUTINE"
  jd = KIND(1.d0)
  WRITE(*, "("" SUBROUTINE d"", i2.2,""()"")") j
  WRITE(*,*)"   IMPLICIT NONE"
  WRITE(*,*)"   DOUBLE PRECISION :: b=0"
  WRITE(*,*)"   INTEGER :: a(8)=0"
  WRITE(*,*)"   INTEGER :: a_size"
  WRITE(*,*)"   INTEGER :: b_size"
  WRITE(*,*)"   CHARACTER(LEN=2) :: jchr2"
  WRITE(*,*)"   a_size = BIT_SIZE(a(1))"
  WRITE(*,*)"   b_size = SIZE(transfer(b,a))*a_size"
  WRITE(*,*)"   IF (b_size .EQ. 64) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",jd
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_DOUBLE_NATIVE_8_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   IF (b_size .EQ. 128) THEN"
  WRITE(*,*)"       WRITE(jchr2,'(I2)')",jd
  WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_DOUBLE_NATIVE_16_KIND "'//"//ADJUSTL(jchr2)"
  WRITE(*,*)"   ENDIF"
  WRITE(*,*)"   RETURN"
  WRITE(*,*)"END SUBROUTINE"
  DO i = 1, ii
     j = ikind_numbers(i)
     WRITE(*, "("" SUBROUTINE i"", i2.2,""()"")") j
     WRITE(*,*)"   IMPLICIT NONE"
     WRITE(*,*)"   INTEGER(",j,") :: a = 0"
     WRITE(*,*)"   INTEGER :: a_size"
     WRITE(*,*)"   CHARACTER(LEN=2) :: jchr2"
     WRITE(*,*)"   a_size = BIT_SIZE(a)"
     WRITE(*,*)"   IF (a_size .EQ. 8) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_INTEGER_1_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   IF (a_size .EQ. 16) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_INTEGER_2_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   IF (a_size .EQ. 32) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_INTEGER_4_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   IF (a_size .EQ. 64) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_INTEGER_8_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   IF (a_size .EQ. 128) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_INTEGER_16_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   RETURN"
     WRITE(*,*)"   END SUBROUTINE"
  ENDDO
  DO i = 1, ir
     j = rkind_numbers(i)
     WRITE(*, "("" SUBROUTINE r"", i2.2,""()"")") j
     WRITE(*,*)"   IMPLICIT NONE"
     WRITE(*,*)"   REAL(KIND=",j,") :: b(32)"
     WRITE(*,*)"   INTEGER :: a(1)"
     WRITE(*,*)"   INTEGER :: a_size"
     WRITE(*,*)"   INTEGER :: real_size"
     WRITE(*,*)"   CHARACTER(LEN=2) :: jchr2"
     WRITE(*,*)"   a_size = BIT_SIZE(a(1)) ! Size in bits for integer"
     WRITE(*,*)"   real_size = (SIZE(TRANSFER(b,a))*a_size)/SIZE(b)"
     WRITE(*,*)"   IF (real_size .EQ. 32) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_REAL_4_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   IF (real_size .EQ. 64) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,*)'       WRITE(*,*) "#define H5_FORTRAN_HAS_REAL_8_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   endif"
     WRITE(*,*)"   IF (real_size .EQ. 128) THEN"
     WRITE(*,*)"       WRITE(jchr2,'(I2)')",j
     WRITE(*,'(A)')'       WRITE(*,*) "#define H5_FORTRAN_HAS_REAL_16_KIND "'//"//ADJUSTL(jchr2)"
     WRITE(*,*)"   ENDIF"
     WRITE(*,*)"   RETURN"
     WRITE(*,*)"   END SUBROUTINE"
  ENDDO
END PROGRAM test_kind



