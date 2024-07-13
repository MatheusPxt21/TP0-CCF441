%{ 
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/ 
%} 

/* This tells flex to read only one input file */ 
%option noyywrap 

/* definicoes regulares */ 

letras [a-z]
upper [A-Z]
digit   [0-9]
string ({letras}|{upper}|{digit})+

cpf {digit}{3}\.{digit}{3}\.{digit}{3}\-{digit}{2}
data (([0-2]{digit})|(3[0-1]))\/((1[0-2]|0[1-9]))\/{digit}{4}
comentario [\/\*]+(.*)+[\*\/]
op (\<|\>|<\=|>\=|=\=|!\=)
condicional if\s*\(\s*{string}\s*{op}\s*{string}\s*\)

%% 

{cpf}          {printf("\nFoi encontrado um cpf. LEXEMA: %s", yytext);}
{data}         {printf("\nFoi encontrada uma data. LEXEMA: %s", yytext);}
{comentario}   {printf("\nFoi encontrado um comentario. LEXEMA: %s", yytext);}
{condicional}  {printf("\nFoi encontrada uma condicional simples. LEXEMA: %s", yytext);}


[ \t\n]+    {/*nenhuma acao e nenhum retorno quando encontrar espacos em branco*/} 



%% 

int main(void) 
{ 
    yylex(); 
    printf("\n");
    return 0; 
}