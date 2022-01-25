#include <iostream>     // std::cout
#include <algorithm>    // std::count
#include <unordered_map>//unordered_map
#include <vector>       // std::vector
#include <string>       // std::string, std::to_string
#include <iostream>     // std::cout
#include <random>       // std::random_device std::default_random_engine std::uniform_int_distribution std::normal_distribution
#include <numeric>      // std::inner_product
#include <chrono>       // std::chrono:
#include <boost/math/distributions/normal.hpp> //boost::math::normal 
#include <math.h>  //std::sqrt


constexpr size_t n = 4;
int p = 101;
int s[n] = { 1, 2, 3, 4}; //{ 0, 0, 0 }; //{ 1, 2, 3 };

// Declare EQUATION struct type
struct EQUATION {   
    int a[n];
    int b;
    int e;

};

// mappings
std::unordered_map<std::string, std::vector<EQUATION>> equationMemo;
std::unordered_map<int, std::unordered_map<int, long>> guessCount;  // {position, {guess, count}

// error distributions
/// rounded gaussian
float mu = 0;
float sigma = 2;

std::random_device rd;
std::default_random_engine generator(rd());
std::uniform_int_distribution<int> uniform_int(0, p-1);  //min, max
std::normal_distribution<float> gaussian(mu, sigma);  // mean, std

/// centered binomial
constexpr size_t upper = 2;  // has to be odd
std::binomial_distribution<int> binomial(upper, 0.5);  //upper bound, probability of success



// oracle
void oracleLWE(EQUATION& equation){

    for (int i = 0; i < n; i++) {
        equation.a[i] = uniform_int(generator);
    }

    // discrete gaussian
    //equation.e = round(gaussian(generator));

    // centered binomial (used in NewHope reference implementation)
    equation.e = binomial(generator) - upper/2;

    equation.b = std::inner_product(s, s+n, equation.a, 0.0) + equation.e;
    equation.b %= p;
}
    

void encodePosOfZeros(std::string& key, int(&coeffs)[n]) {
    for (const auto& coeff : coeffs)
        if (coeff == 0)
            key.push_back('0');
        else
            key.push_back('1');
}
void initializeEquationMemo(int n, int arr[], int i) {
    if (i == n) {
        std::string key;
        for (int j=0; j < n; j++) {
            key += std::to_string(arr[j]);
        }
        std::vector<EQUATION> equations;
        equationMemo.insert({ key, equations });
        //std::cout << key << std::endl;
        return;
    }

    // First assign "0" at ith position
    // and try for all other permutations
    // for remaining positions
    arr[i] = 0;
    initializeEquationMemo(n, arr, i + 1);

    // And then assign "1" at ith position
    // and try for all other permutations
    // for remaining positions
    arr[i] = 1;
    initializeEquationMemo(n, arr, i + 1);
}

// fast pow for integer using square and multiply algo
int integerPow(int a, int ex, int mod) {
    if (a == 1) return 1;

    long r = 1;
    while (ex) {
        if (ex & 1)r = (r * a) % mod;
        ex = ex >> 1;
        a = (a * a) % mod;
    }
    return r;
}

void compareEquationsSub(std::string& key, EQUATION& prevEquation, EQUATION& equation) {
    for (int i = 0; i < n; ++i) {
        if ((prevEquation.a[i] - equation.a[i]) % p == 0)
            key.push_back('0');
        else
            key.push_back('1');
    }
}

void compareEquationsAdd(std::string& key, EQUATION& prevEquation, EQUATION& equation) {
    for (int i = 0; i < n; ++i) {
        if ((prevEquation.a[i] + equation.a[i]) % p == 0)
            key.push_back('0');
        else
            key.push_back('1');
    }
}


void furtherElimination(std::string& prevKey, EQUATION& prevEquation) {
    auto equations = equationMemo.at(prevKey);

    std::string key;
    for (auto& equation : equations) {
        EQUATION newEquation;

        // compare for subtraction
        key.clear();
        compareEquationsSub(key, prevEquation, equation);


        if (std::count(key.begin(), key.end(), '1') == 1) {
            for (int i = 0; i < n; ++i)
                newEquation.a[i] = (prevEquation.a[i] - equation.a[i]) % p;
            newEquation.b = (prevEquation.b - equation.b) % p;
            int pos = key.find('1');
            int coeff = newEquation.a[pos];
            int s = newEquation.b*integerPow(coeff, p-2, p)%p;  // solving linear congruence fast by using little fermat
            if (s < 0)
                s += p;

            guessCount.at(pos).at(s) += 1;
        }
        else {
            if (std::count(key.begin(), key.end(), '1') < std::count(prevKey.begin(), prevKey.end(), '1')) {
                for (int i = 0; i < n; ++i)
                    newEquation.a[i] = (prevEquation.a[i] - equation.a[i]) % p;
                newEquation.b = (prevEquation.b - equation.b) % p;
                
                furtherElimination(key, newEquation);

                equationMemo.at(key).push_back(equation);
            }
        }

        // compare for addition
        key.clear();
        compareEquationsAdd(key, prevEquation, equation);

        if (std::count(key.begin(), key.end(), '1') == 1) {
            for (int i = 0; i < n; ++i)
                newEquation.a[i] = (prevEquation.a[i] + equation.a[i]) % p;
            newEquation.b = (prevEquation.b + equation.b) % p;
            int pos = key.find('1');
            int coeff = newEquation.a[pos];
            int s = newEquation.b * integerPow(coeff, p - 2, p) % p;  // solving linear congruence fast by using little fermat
            if (s < 0)
                s += p;

            guessCount.at(pos).at(s) += 1;
        }
        else {
            if (std::count(key.begin(), key.end(), '1') < std::count(prevKey.begin(), prevKey.end(), '1')) {
                for (int i = 0; i < n; ++i)
                    newEquation.a[i] = (prevEquation.a[i] + equation.a[i]) % p;
                newEquation.b = (prevEquation.b + equation.b) % p;

                furtherElimination(key, newEquation);

                equationMemo.at(key).push_back(equation);
            }
        }
    }  
}

int main(int argc, char** argv) {
    // initialize equation memory
    int arr[n];
    initializeEquationMemo(n, arr, 0);

    // initialize map to track the count of guesses for a possible solution
    for (int pos = 0; pos < n; pos++) {
        std::unordered_map<int, long> tmp;
        for (int guess = 0; guess < p; guess++)
            tmp.insert(std::make_pair(guess, 0));

        guessCount.insert(std::make_pair(pos, tmp));
    }

    std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
    
    long i = 1;
    while (1) {
        EQUATION equation;
        oracleLWE(equation);

        std::string key;
        encodePosOfZeros(key, equation.a);

        furtherElimination(key, equation);

        equationMemo.at(key).push_back(equation);


        // early stopping
        if (i % 10 == 0) {
            bool ready = true;
            for (auto const& pos : guessCount) {
                float mean = 0;
                for (auto const& guess : pos.second)
                    mean += guess.second;
                if (mean < 20) {
                    std::cout << "mean: " << mean << std::endl;
                    goto endOfLoop;
                }
                mean /= p;

                float var = 0;
                for (auto const& guess : pos.second)
                    var += (guess.second - mean) * (guess.second - mean); // fast pow
                var /= p - 1;
                float sigma = std::sqrt(var);

                int guessCount = 0;
                for (auto const& guess : pos.second) {
                    if (mean + sigma < guess.second) {
                        guessCount += 1;
                        std::cout << "Pos: " << pos.first << "\t\tGuess: " << guess.first << "\t\tCount: " << 
                            guess.second << "\t\tRight solution: " << s[pos.first] << std::endl;
                    }
                }
                std::cout << std::endl;
                if (guessCount != 1) {
                    ready = false;
                }
            }
            if (ready) {
                std::cout << "Count of equations: " << i << std::endl << std::endl;
                break;
            }
        }
    endOfLoop: {}
        std::cout << "Actual equations: " << i << "\t\tProcessing Time = " << 
            std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now() - begin).count() / 1000 << 
            "[s]" << std::endl;
        i += 1;
    }

    std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
    

    std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count()/1000 << "[s]" << std::endl;
    //return 0;


    // p-value empirical distribution
    for (auto const& pos : guessCount) {
        float mean = 0;
        for (auto const& guess : pos.second)
            mean += guess.second;
        mean /= p;

        float var = 0;
        for (auto const& guess : pos.second)
            var += (guess.second - mean)*(guess.second - mean); // fast pow
        var /= p-1;  // empirical variance
        float sigma = std::sqrt(var);
        std::cout << "mean + sigma " << mean+sigma << std::endl;
    }
    std::cout << std::endl;

    // p-value gaussian approximation of binomial
    /*for (auto const& pos : guessCount) {
        long sum = 0;
        for (auto const& guess : pos.second)
            sum += guess.second;
        float mean = sum/p;
        float sigma = std::sqrt(mean * (1 - 1 / p));
        boost::math::normal dist(mean, sigma);
        double q = quantile(dist, 0.99);
        std::cout << "quantile = " << q << std::endl;
    }*/

    // determine guess

    // debug
    for (auto const& pos : guessCount) {
        float mean = 0;
        for (auto const& guess : pos.second)
            mean += guess.second;
        mean /= p;

        float var = 0;
        for (auto const& guess : pos.second)
            var += (guess.second - mean) * (guess.second - mean); // fast pow
        var /= p-1;
        float sigma = std::sqrt(var);

        for (auto const& guess : pos.second) {
            if (mean + sigma < guess.second) {
                std::cout << "Pos: " << pos.first << "\t\tguess: " << guess.first << "\t\tcount: " << guess.second << "\t\tright: " << s[pos.first] << '\n';
            }
            //if (guess.second != 0)
            //    std::cout << "guess: " << guess.first << "    count: " << guess.second <<'\n';
        }
    }
    return 0;

    // debug
    for (auto const& pos : guessCount) {
        int trackGuess=0, trackMax=0;
        for (auto const& guess : pos.second) {
            if (trackMax < guess.second) {
                trackGuess = guess.first;
                trackMax = guess.second;
            }
            //if (guess.second != 0)
            //    std::cout << "guess: " << guess.first << "    count: " << guess.second <<'\n';
        }
        std::cout << "Pos: " << pos.first << "\t\t\tguess: " << trackGuess << "\t\t\count: " << trackMax << "\t\t\tright: " << s[pos.first] << '\n';
    }
    return 0;

    for (auto const& tmp : equationMemo) {
        std::cout << "Key: " << tmp.first << '\n';
        std::cout << "tmp contains " << tmp.second.size() << " elements.\n";
        continue;
        for (auto const& equation : tmp.second) {
            for (int i = 0; i < n; i++) 
                std::cout << "a[" << i << "]: " << equation.a[i] << '\n';
    
            std::cout << "b: " << equation.b << '\n';
            std::cout << "e: " << equation.e << '\n' << '\n';
        }

    }

    return 0;
}