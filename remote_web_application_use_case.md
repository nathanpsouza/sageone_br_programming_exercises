# SageOne Brasil Remote Web Application Use Case

The following exercise is a real use case where you should understand the problem and build a complete solution.

### Guidance

* You can choose any language you like. Also, you are free to use any existing libraries/frameworks that you think it will help you solve the problem.
* The solution **must** be a fully web-based application including a database solution.
* You can fork this GitHub repository and answer back as a **Pull Request** if it is for your convenience.

### The Problem

You work for a online invoice software company. The software is called SageOne :smile:

You are being requested to build a new feature aimed to easily migrate customers from two of our main competitors to our software. The two biggest competitors are named *BlueBill* and *YouDoInvoice*

The main concern for any customer to switch between invoice software is the existing **Products** database. We know that the two competitors can export the entire customer's **Products** database in text files but, *BlueBill* and *YouDoInvoice* export the data in different formats.

With this new feature, the customer will be able to upload files fill SageOne database with **Products**. This way, a customer can easily move from these competitors and start using **SageOne**.

So first, the application need a complete **Product** CRUDs.

Once **Products** CRUDs is created, the application must have a single page where the user uploads a file. The application must accept files from both *BlueBill* and *YouDoInvoice* softwares. The application must parse each file and import **Products** with as many information from each file is possible.

Here are the details about each file:

#### BlueBill Files:

* Text CSV file with values separated by semicolon.
* The first line contains column headers
* Here is an example: [bluebill_product_file.csv](remote_web_application_assets/bluebill_product_file.csv)

#### YouDoInvoice Files:

* The format of YouDoInvoice File is a bit more complicated :sweat:
* It's plain text files with an self-created format.
* The first line of each file contains 2 values separated by `|` *(or pipe)*. The first value says what resource contains in the file and then it have how many resources have in this file so:
  * A file with 15 products inside will have: `PRODUTO|15` in the first line
* The next line can split the product data in several lines.
* You can consider just the lines starting with `I`
* The lines starting with `I` contains columns separated by `|` *(or pipe)*.
* As there is no column headers. Here are the information presented in each column (following the sequence):
  1. fixed letter `I`
  2. Code
  3. Description
  4. Barcode
  5. NCM Code
  6. IPI
  7. Gender
  8. Unity
  9. Value
  10. Barcode *(yes, again...)*
  11. Unity *(yes, again...)*
  12. Value *(yes, again...)*
  13. Quantity
* As you can see, there are some duplicated columns, you need to see each one has any value. If both has value, choose the last ones.
* Here is an example: [youdoinvoice_product_file.txt](remote_web_application_assets/youdoinvoice_product_file.txt)

### Acceptance Criteria

1. A user should be able to access the web application and Create, Retrieve, Update and Delete Products
2. This web application should have a single page where the user can upload a single file.
3. A single file must be accepted each time.
4. If the application do understand the uploaded file (Its a valid format for *BlueBill* or *YouDoInvoice* products file), all products in the file must then be imported
  * The produts list must now display the products presented inside the file imported.
  * Each imported product atrtibute must match the values presented inside the file.
5. If the application does not understan the uploaded file, an error message should be displayed.
6. If there was any error while import one product, the hole file cant be imported and the error message should be displayed.