%define next_word 0

%macro native 3
    section .data
        w_%2:
            dq next_word
            db %1, 0
            db %3
        xt_%2:
            dq %2_impl
    section .text
        %2_impl:
    
    %define next_word w_%2
%endmacro 

%macro native 2
    native %1, %2, 0
%endmacro