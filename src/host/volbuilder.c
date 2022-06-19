#include <stdio.h>

int main(int argc, char **argv) {
    FILE *content, *volume;
    int size;

    volume = fopen(argv[1], "w"); if(!volume) { fprintf(stderr, "unable to open output file\n"); return 1; }
    content = fopen(argv[2], "r"); if(!content) { fprintf(stderr, "unable to open data file\n"); return 1; }
    fseek(content, 0, SEEK_END);
    size = ftell(content);
    fprintf(volume,"#!/bin/sh\necho name:%s size:%d\n", argv[2], size);
    fclose(volume);
    fclose(content);
    return 0;
}