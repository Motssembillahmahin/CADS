void main() {
   TRISB = 0x00;
   PORTB = 0x00;
   
   while(1)
   {
    portb.f0 = 0xff;
    delay_ms(100);
    portb.f0 = 0x00;
    portb.f1 = 0xff;
    delay_ms(100);
    portb.f1 = 0x00;
    portb.f2 = 0xff;
    delay_ms(100);
    portb.f2 = 0x00;
    
   
   }

}