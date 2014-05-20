#include <stdlib.h>

int find_option( int argc, char **argv, const char *option ) 
{ 
    for( int i = 1; i < argc; i++ ) 
        if( strcmp( argv[i], option ) == 0 ) 
            return i; 
    return -1; 
}

void gnuplot_setup() 
{

  /* GNUPLOT setup */
  printf("set yrange [-128:128]\n");
  printf("set xrange [0:128]\n");
  printf("set style data lines\n");
  printf("set grid\n");
  
  printf("plot \"-\" notitle\n");
  printf("1\n 2\n 3\n e\n");

}  


