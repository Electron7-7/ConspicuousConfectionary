#include <iostream>
#include <filesystem> // Yes, the devil hath been evoked...
#define PRINT(x) (std::cout << std::string(x) << std::endl);

int main(int argc, char *argv[])
{
	if(argc < 1)
	{
		PRINT("No arguments!")
		return -1;
	}

	if(!std::filesystem::is_regular_file(argv[1]))
	{
		PRINT("Not a regular file!")
		return -1;
	}

	

	return 0;
}