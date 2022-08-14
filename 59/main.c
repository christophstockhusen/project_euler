#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char frequency_analysis(int s[], int length) {
  int frequencies[128];
  int i;
  for (i = 0; i < 128; i++) {
    frequencies[i] = 0;
  }
  for (i = 0; i < length; i++) {
    frequencies[s[i]]++;
  }
  int max_idx = 0;
  int max_val = 0;
  for (i = 0; i < 128; i++) {
    if (frequencies[i] > max_val) {
      max_idx = i;
      max_val = frequencies[i];
    }
  }
  return max_idx;
}

int main ()
{

  int i, j, tmp;
  
  // read input file

  FILE *fp = fopen("cipher1.txt", "r");
  char line[3203];
  fgets(line, sizeof(line), fp);
  fclose(fp);

  // count number of input symbols
  
  int symbols_cnt = 1;
  for (i = 0; i < sizeof(line); i++) {
    if (line[i] == ',') {
      symbols_cnt++;
    }
  }

  // translate input string into a string of characters and count
  // frequencies of the characters

  int symbols[symbols_cnt];
  int frequencies[128];
  memset(frequencies, 0, 128);
  char *delim = ",";
  char *word = strtok(line, delim);
  i = 0;
  while (word) {
    tmp = strtol(word, NULL, 10);
    symbols[i++] = tmp;
    word = strtok(NULL, delim);
  }

  // derive key

  int key[3];

  for (i = 0; i < 3; i++) {
    int subsequence[symbols_cnt/3+1];
    for (j = 0; j*3+i < symbols_cnt; j++) {
      subsequence[j] = symbols[j*3+i];
    }
    // xor with the most common "letter": space.
    key[i] = ' '^frequency_analysis(subsequence, j);
  }

  printf("--- Key ---\n\n%c%c%c\n\n", key[0], key[1], key[2]);
  
  // decode input string

  int decoded_symbols[symbols_cnt];

  int sum = 0;

  printf("--- Decrypted Text --- \n\n");

  for (i = 0; i < symbols_cnt; i++) {
    decoded_symbols[i] = key[i%3]^symbols[i];
    printf("%c", decoded_symbols[i]);
    sum += decoded_symbols[i];
  }

  printf("\n\n--- Sum ---\n\n%i\n", sum);
  return 0;
}
