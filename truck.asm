start:
      
        ld b, d_file low        //load d_file addr into bc
        ld c, d_file high
        add bc, print offset    //add hand computed offset 1 + #rows * (22 char per row ) + #rows (carriage returns)
        ld pr_pos, bc           //store print location


draw truck:
    

loop:
        //flip wheel flag
        wheel_flag = !wheel_flag
        
        //draw the wheels
        cp wheel_flag, 0
        jz wheels2
        poke 0s
        jp wheel_finished;
wheels2:
        poke Os
        
wheels_finished:
        
        //copy from index to end of screen
        
        //copy from 0 to index
        
        //increment index, resetting to 0 if needed
        inc [index];      //increment index
        cp [index], 23    //compare to screen width
        jnz loop;         //is it equal? if so, repeat loop
        ld [index], 0;    //reset index to 0
        jump loop;        //repeat loop
    
data:
    index        //one byte for the index
    pr_pos       //d_file (two bytes)
    offset       //one byte for offset
    wheel_flag   //one byte
    bg[23]       //21 bytes that make up the background
