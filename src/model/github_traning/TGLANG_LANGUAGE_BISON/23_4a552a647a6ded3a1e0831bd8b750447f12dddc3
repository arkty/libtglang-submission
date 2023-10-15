%{

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <list.h>
#include <util.h>
#include <ensemble.h>
    
    int yylex(void);
    int yyvalue;
    
    void yyerror(char const * message){
        error("%s",message);}

    typedef union {
        int element;
        list_t* elements;
        ENSEMBLE* set;
    } my_synthetic;

    ENSEMBLE* parsed_set;
    
#define YYSTYPE my_synthetic
    
// #define DEBUG(e) do{e}while(0)
#define DEBUG(e) do{}while(0)

%}

/* %define set.value.type {ELEMENT*} */
/* %define elements.value.type {list_t*} */
/* %define element.value.type {int} */

%token INTEGER 
%token COMMA   
%token OPEN    
%token CLOSE   

%%

set : OPEN elements CLOSE
      {
          ENSEMBLE* e=ensemble_from_list($2.elements);
          $$.set=parsed_set=e;
          
      } ;    

elements : { $$.elements=NIL; }
     | element { $$.elements=cons($1.element,NIL); }
     | elements COMMA element
       { DEBUG(printf("elements ");list_print($1.elements);printf("element %d\n",yyvalue);fflush(stdout););
         list_t* list=$1.elements; push($3.element,&list); $$.elements=list; }
     ;

element : INTEGER
          { DEBUG(printf("element %d\n",yyvalue);fflush(stdout);); $$.element=yyvalue; } ;
