char seg[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int i,j,k;
void main(){
    trisb=0x00;
    portb=0x00;
    trisc=0x00;
    portc=0x00;
    while(1){
       for(i=2123;i<=2134;i++){
         for(j=1;j<=25;j++){
            portc.f0=0;
            portb=seg[i/1000];
            delay_ms(10);
            portc.f0=1;

            portc.f1=0;
            portb=seg[i/100%10];
            delay_ms(10);
            portc.f1=1;

            portc.f2=0;
            portb=seg[i/10%10];
            delay_ms(10);
            portc.f2=1;

            portc.f3=0;
            portb=seg[i%10];
            delay_ms(10);
            portc.f3=1;
         }
       }
    }


}