#define <stdio>


main(){
	c = getchar();
	while(c != '\0'){
		if(c == ' '){
			putchar('\t');
		}
		else{
			putchar(c);
		}

}
