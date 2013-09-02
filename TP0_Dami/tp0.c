#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define BUFFERSIZE 128
typedef struct {
		int tamanio;
		char* cadena;
	}buffer;
	
buffer* crearBuffer(){
	buffer* unBuffer = malloc(sizeof(buffer));
	unBuffer->cadena = malloc((sizeof(char)*BUFFERSIZE));
	unBuffer->tamanio = 0;
	return unBuffer;
}	
void reiniciarBuffer(buffer* unBuffer){
		unBuffer->tamanio = 0;
		
		free(unBuffer->cadena);
		unBuffer->cadena = malloc((sizeof(char)*BUFFERSIZE));
		strcpy(unBuffer->cadena,"\0");
	}
	
int main(int argc,char** argv){
	
	char* miArchivo = argv[0];
	miArchivo = "archivoPrueba";
	FILE* archivo = fopen(miArchivo,"r");
	
	buffer* myBuffer = crearBuffer();
	char letra[2];
	letra[0] = fgetc(archivo);
	letra[1] ='\0';
	while(letra[0]!=EOF){
		
			if(letra[0]!='\n'){
					//printf("%s  -- ",&(letra[0]));
					if(myBuffer->tamanio>=BUFFERSIZE)
						{
							//Realocar
						}
					strcat(myBuffer->cadena,letra);
					myBuffer->tamanio++;
					//printf("%s\n",myBuffer->cadena);
					
				}
			else{
				int i;
				//printf("va a imprimir e tamanio ");
				//printf("tamanio %i \n",myBuffer->tamanio);
				
				int tamanioGeneral = myBuffer->tamanio;
				char aImprimir[tamanioGeneral-1];
				strncpy(aImprimir, myBuffer->cadena, tamanioGeneral);
				for(i=myBuffer->tamanio-1; i>=0;i--){
					printf("%c",aImprimir[i]);
				} 
				printf("\n");
				reiniciarBuffer(myBuffer);
				
				//printf("tamanio %i \n",myBuffer->tamanio);
			}
			letra[0] = fgetc(archivo);
		}
		free(myBuffer->cadena);
		free(myBuffer);
	fclose(archivo);
	return 0;
}
