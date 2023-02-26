int i,j;
void delay(int n){
     for(j=1;j<=n;j++){
         delay_ms(1000);
     }
}

void main(){
    trisb=0x00;
    portb=0x00;
    while(1){
        for(i=1;i<=5;i++){
            portb.f0=1;
            delay(i);
            portb.f0=0;
            delay(6-i);
        }
    }
}