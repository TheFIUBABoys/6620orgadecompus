#include <stdio.h>
#include <sys/types.h>
#include <mymalloc.h>

int
main(int argc, char * const argv[])
{
	size_t i;
	size_t j;
	char *p;

	for (i = 1; i; ++i) {
		fprintf(stdout, "malloc(%ld) ...", (long) i);
		fflush(stdout);
		p = (char *) mymalloc(i);
		fprintf(stdout, " %p.", p);

		printf(" Writing ...");
		fflush(stdout);
		for (j = 0; j < i; ++j)
			p[j] = 0xff;
		printf(" Ok.");

		printf(" Freeing memory ...");
		fflush(stdout);
		myfree(p);
		printf(" Ok.\n");
		fflush(stdout);
	}

	return 0;
}
