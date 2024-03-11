%define lw 0

%macro native 3
    section .data
        w_%2:
            dq lw
            db %1, 0
            db %3
        xt_%2:
            dq %2_impl
    section .text
        %2_impl:
    
    %define lw w_%2
%endmacro

%macro native 2
    native %1, %2, 0
%endmacro

%macro colon 3
    section .data
        w_%2:
            dq lw
            db %1, 0
            db %3
        xt_%2:
            dq docol_impl
    
    %define lw w_%2
%endmacro

%macro colon 2
    colon %1, %2, 0
%endmacro