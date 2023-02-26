void main() 

{
      TRISB=0x00;
      TRISD=0xff;
      portb.f0=0;
      while(1)
      {
       if(portd.f0=1)
        {  
           portb.f0=1;
        
       }
       else
       {
       
          portb.f0=0;
       }
      
      }
}