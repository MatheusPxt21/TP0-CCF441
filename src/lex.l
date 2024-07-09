%{ 
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/ 
%} 

/* This tells flex to read only one input file */ 
%option noyywrap 

/* definicoes regulares */ 

letras [a-z]
upper [A-Z]
digito   [0-9]
inteiro {digito}+
negativo [-]{inteiro}
decimal   {inteiro}[.]{inteiro}
decimalnegativo {negativo}[.]{inteiro}
placa {upper}{3}[-]{inteiro}[4]
palavra ({letras}|{upper})+
telefone     {digito}{4}[-]{digito}{4}
nomeproprio    {upper}({letras})+[ ]{upper}({letras})+[ ]{upper}({letras})+([ ]{upper}({letras})+)?
%% 

{inteiro}         {printf("\nFoi encontrado um numero inteiro positivo. LEXEMA: %s", yytext);}
{negativo}         {printf("\nFoi encontrado um numero inteiro negativo. LEXEMA: %s", yytext);}
{decimal}         {printf("\nFoi encontrado um numero decimal. LEXEMA: %s", yytext);}
{decimalnegativo}         {printf("\nFoi encontrado um numero decimal negativo. LEXEMA: %s", yytext);}
{placa}     {printf("\nFoi encontrado uma placa. LEXEMA: %s", yytext);}
{palavra}    {printf("\nFoi encontrada uma palavra. LEXEMA: %s", yytext);}
{telefone}     {printf("\nFoi encontrado uma telefone. LEXEMA: %s", yytext);}
{nomeproprio}     {printf("\nFoi encontrado um nome próprio. LEXEMA: %s", yytext);}
[ \t\n]+    {/*nenhuma acao e nenhum retorno quando encontrar espacos em branco*/} 

%% 

int main(void) 
{ 
    yylex(); 
    printf("\n");
    return 0; 
}