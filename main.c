#include <stdlib.h>
#include <stdio.h>

int main() {
	int start_index;
	int end_index;
	char in_string[100];
	char *out_string;
	printf("Enter a string: ");
	scanf("%s", &in_string);
	printf("Enter the start index: ");
	scanf("%d", &start_index);
	printf("Enter the end index: ");
	scanf("%d", &end_index);	
	out_string = (char*)sub_string(in_string, start_index, end_index);
	printf("The substring of the given string is '%s'\n", out_string);
	return 0;
}
