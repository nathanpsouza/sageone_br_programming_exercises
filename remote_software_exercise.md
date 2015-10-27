# SageOne Brasil Remote Software Exercises.

The following questions can be answered using any development language, please note the need for comments; variable and error checking together with correctly formatted output.

### Guidance

  * Please send answers, code, tests and output for the above.
  * You can fork this GitHub repository and answer back as a **Pull Request** if it is for your convenience.


### Exercises

1. Write a function accepting two floating-point numbers, returning the multiplication of the numbers together taking into account the following rules.

  - Each of the numbers provided to the function must be between 1500.0 and 6700.0.
  - Verify each of the received parameters is a floating-point number.
  - On return of the answer should be formatted to 5 decimal places.
  - Provide a number of test examples and the output.

  ---

2. Write a function accepting two string parameters returning true if the first parameter is a substring of the second.

  - `Parameter1 = “steven”, Parameter2 = “stevenbrown’, Output = true`
  - `Parameter1 = “Steven”, Parameter2 = “stevenbrown’, Output = false`
  - `Parameter1 = “steven”, Parameter2 = “st3v3nbrown’, Output = false`
  - `Parameter1 = “steven”, Parameter2 = “brownsteven’, Output = true`
  - Check that both Parameters have been provided.
  - Check that both Parameters are Strings.
  - Check that the length of the second Parameter is equal or larger than the first.
  - After writing the function we have decided that case sensitivity is not important, write another function that does not take Case Sensitivity into account.

  ---

3. Write a function to check if a provided numeric parameter is a power of 2 returning `true` or `false`.
