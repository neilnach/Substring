#include <stdio.h>
#include <stdlib.h>

char * sub_string(char *in_string, int start_index, int end_index) {
	char *out_string;
	int c;
	int length = end_index - start_index;
	out_string = malloc(length + 1);
	int i = 0;
	for (c = start_index - 1; c < end_index; c++) {
		out_string[i] = in_string[c];
		i++;
	} 		
	return out_string;
}
