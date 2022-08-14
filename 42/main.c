#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// returns the ith triangle number
int triangle(i) {
  return i*(i+1)/2;
}

// encodes a word
int encode(char *s) {
  int code = 0;
  int i;
  for (i = 0; i < strlen(s); i++) {
    code += s[i]-64;
  }
  return code;
}

int main()
{
  int i;

  int triangle_words = 0;


  // Get line from file
  char line[16*1024];
  FILE *fp = fopen("words.txt", "r");
  char *words[2000];
  fgets(line, sizeof(line), fp);
  fclose(fp);

  int max_word_length = 0;

  // Split words into array of words
  char *delim = ",";
  char *word;
  word = strtok(line, delim);
  int word_count = 0;
  i = 0;
  while (word) {
    words[i] = malloc(strlen(word)+1-2);
    strncpy(words[i], word+1, strlen(word)-2);
    words[i][strlen(word)-2] = '\0';
    if (max_word_length < strlen(words[i])) {
      max_word_length = strlen(word);
    }
    i++;
    word_count++;
    word = strtok(NULL, delim);
  }

  // compute maximum triangle number
  int supremum_of_triangle_numbers = ('Z'-64)*max_word_length;

  // setup lookup table for triangle numbers
  int triangle_numbers[supremum_of_triangle_numbers];
  for (i = 0; i < supremum_of_triangle_numbers; i++) {
    triangle_numbers[i] = 0;
  }
  i = 0;
  while (triangle(i) <= supremum_of_triangle_numbers) {
    triangle_numbers[triangle(i)] = 1;
    i++;
  }
  

  // check words
  for (i = 0; i < word_count; i++) {
    if (triangle_numbers[encode(words[i])]) {
      triangle_words++;
    }
  }

  printf("There are %i triangle words.\n", triangle_words);

  return 0;
}
