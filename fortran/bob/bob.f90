module bob
  implicit none
contains

  logical function all_upper(stmt)
    character(len=*), intent(in) :: stmt
    integer :: i, ord
    logical :: upper, lower
    all_upper = .false.
    do i = 1, len(stmt)
      ord = iachar(stmt(i:i))
      upper = (ord.ge.65 .and. ord.le.90)
      lower = (ord.ge.97 .and. ord.le.122)
      if (upper.or.lower) then
          if (.not.(ord.ge.65 .and. ord.le.90)) then
            all_upper = .false.
            return
          else
            all_upper = .true.
          endif
      endif
    end do
  end function

  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    integer :: n
    n = len(trim(statement))
    if (n == 0) then
      hey = "Fine. Be that way!"
    else if (statement(n:n).eq."?") then
      if (all_upper(statement)) then
        hey = "Calm down, I know what I'm doing!"
      else
        hey = "Sure."
      endif
    else if (all_upper(statement)) then
      hey = "Whoa, chill out!"
    else
      hey = "Whatever."
    endif
  end function hey

end module bob
