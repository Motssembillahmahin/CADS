#line 1 "D:/Lab_xm/1_seven_segment/MyProject.c"
unsigned char hexvalue[10] = {
 0x3F,
 0x06,
 0x5B,
 0x4F,
 0x66,
 0x6D,
 0x7D,
 0x07,
 0x7F,
 0x6F
};
int i=2123;
void main() {
 TRISB=0x00;
 TRISC=0x00;
 while(1){
 portb=hexvalue[(((i/10)/10)/10)%10];
 portc.f0=0;
 delay_ms(1);
 portc.f0=1;

 portb=hexvalue[((i/10)/10)%10];
 portc.f1=0;
 delay_ms(1);
 portc.f1=1;

 portb=hexvalue[(i/10)%10];
 portc.f2=0;
 delay_ms(1);
 portc.f2=1;

 portb=hexvalue[i%10];
 portc.f3=0;
 delay_ms(1);
 portc.f3=1;


 }
}
