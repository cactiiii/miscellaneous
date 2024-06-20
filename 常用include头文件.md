* min max : `include <algorithm>`
* swap : `include <algorithm>`
* abs(int): `include <stdlib.h>`
* abs(double): `include <math.h>`
* random
```
include <random>
std::default_random_engine generator;
std::uniform_int_distribution<int> distribution(0,9);
int number = distribution(generator);
std::uniform_real_distribution<double> distribution(0.0,1.0);
double number = distribution(generator);
```
* to_string: `include <string>`
* stoi: `include <string>`
