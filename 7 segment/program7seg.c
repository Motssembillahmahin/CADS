char array[10]={ 0xC0, 0xF9,0xA4,0xB0 ,0x99, 0x92, 0x82 ,0xF8 ,0x80,0x90};
void main() 
{    int i=0 ;
     TRISB=0x00;
     PortB=0xff;
     while(1)
     {
        portb=array[i];
        delay_ms(1000);
        i=i+1;
        if(i==10)
           i=0;
        
     }
}