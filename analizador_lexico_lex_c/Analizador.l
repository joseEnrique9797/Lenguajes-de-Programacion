%{
#include <stdio.h>     
#include <stdlib.h>
int num = 0;
void definirTipoVAriableEntera();
void definirTipoVAriableDecimal();
void definirTipoVAriableCadena();
void variableDefinida();
void cicloRepetir();
void ciclo2();
void ciclo3();
%}
Definir ("Definir")|"definir"
repetir "Repetir"|"repetir"
ciclo2Palabras "Mientras"|"mientras"|"Repetir"|"repetir"
Variable [A-Z]{1}([a-zA-Z0-9]+)
Tipo_Datos "entero"|"cadena"|"decimal"
espacio [" "]*
operadoresigual "="
operadorComparacion "=="|">="|"<="|"<"|">"
numero [0-9]*
decimal [0-9]*"."[0-9]*
comillas "'"
cadena [a-zA-Z0-9]*
aperturaCorchetes "("
cerradurasCorchetes ")"
seleccion "Seleccion:"|"seleccion:"
ciclo3PalabrasReservadas "Si"|"si"|"Hacer"|"hacer"|"finsi"|"Finsi"|"Sino"|"sino"
/*Selección: si (condicion) hacer ... finsi*/
%%
^{Definir}+{espacio}+{Variable}+{espacio}+{Tipo_Datos}$	{
    variableDefinida();
}


^{Variable}+{espacio}+{operadoresigual}+{espacio}{numero}* { 
        definirTipoVAriableEntera();
    }
^{Variable}+{espacio}+{operadoresigual}+{espacio}{decimal}* { 
        definirTipoVAriableDecimal();
    }
^{Variable}+{espacio}+{operadoresigual}+{espacio}+{comillas}+{cadena}+{comillas}|{Variable}+{espacio}+{operadoresigual}+{comillas}+{cadena}+{comillas} { 
        definirTipoVAriableCadena();
    }

^{repetir}+{espacio}+{aperturaCorchetes}+{({cadena}|{Variable})+{operadorComparacion}+(({cadena}|{Variable})|({comillas}+{cadena}+{comillas})|{numero}|{decimal})+{cerradurasCorchetes} {
    cicloRepetir();
}


^{ciclo2Palabras}+{espacio}+{aperturaCorchetes}+({cadena}|{Variable})+{operadorComparacion}+(({cadena}|{Variable})|({comillas}+{cadena}+{comillas})|{numero}|{decimal})+{cerradurasCorchetes}+{espacio}+{ciclo2Palabras}+{espacio}+{numero} {
    ciclo2();
}
^{seleccion}+{espacio}+{ciclo3PalabrasReservadas}+{aperturaCorchetes}+({cadena}|{Variable})+{operadorComparacion}+(({cadena}|{Variable})|({comillas}+{cadena}+{comillas})|{numero}|{decimal})+{cerradurasCorchetes}+{ciclo3PalabrasReservadas}+{espacio}+{cadena}+{espacio}+({ciclo3PalabrasReservadas}|({ciclo3PalabrasReservadas}+{cadena}+{ciclo3PalabrasReservadas})) {
        ciclo3();
}
.	;

%%

int main(){
	yylex();
	return 0;
}
void definirTipoVAriableEntera(){
    printf("variable entera\n");
    printf("%s", yytext);
}
void definirTipoVAriableDecimal(){
    printf("variable decimal");
}
void definirTipoVAriableCadena(){
    printf("cadena\n");
}
void variableDefinida(){
    printf("Variable definida");
}
void cicloRepetir(){
    printf("Ciclo Repetir");
}
void ciclo2(){
    printf("Ciclo mientras");
}
void ciclo3(){
    printf("Ciclo Selección");
}
/*
 
*/
