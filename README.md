# robotFramework-mobile

## Setup
* Clone the repo
* Install dependencies  `pip install robotframework`  &&  `pip install --upgrade robotframework-seleniumlibrary`
* `pip install robotframework-pabot` -> This is for parallelization 
* For Appium, `pip install robotframework-appiumlibrary` .For more information refer https://github.com/serhatbolsu/robotframework-appiumlibrary
* **Note: This is w.r.t Python3**


## Running tests

### Automate
* To run local test, run
  - `robot mobile/mobileSauce.robot`
* To run with BrowserStack tests
  - run `robot mobile/mobileBstack.robot`
* To run parallel tests, navigate to 'parallel' folder, run `cd parallel`
  1. Test Suite level
    - Run `pabot --processes <count_of_parallels> *.robot`
    - Alternate method: `pabot --processes <count_of_parallels> <name_of_suites_to_run>` Eg: `pabot --processes 2 Suite1.robot       Suite2.robot`
  2. Test case level
    - Run `pabot --testlevelsplit <file_name>` Eg:  `pabot --testlevelsplit Suite1.robot`
  3. Run Test cases and Test suites together in parallel
    - Run `pabot --testlevelsplit --processes <count_of_parallels> *.robot`
    - **Note: If the process count exceeds the parallel thread limit, it will automatically get queued. No changes required in the scripts.**
  
