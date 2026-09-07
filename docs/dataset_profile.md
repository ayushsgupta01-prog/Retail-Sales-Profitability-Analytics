# Dataset Profile

## Dataset Name

Sample Superstore

## File Name

superstore.csv

## File Format

CSV

## Dataset Size

- Total Rows: 9,994
- Total Columns: 21

## Date Coverage

- Earliest Order Date: January 3, 2014
- Latest Order Date: December 30, 2017

## Categories

- Furniture
- Office Supplies
- Technology

## Sub-Categories

- Accessories
- Appliances
- Art
- Binders
- Bookcases
- Chairs
- Copiers
- Envelopes
- Fasteners
- Furnishings
- Labels
- Machines
- Paper
- Phones
- Storage
- Supplies
- Tables

## Regions

- Central
- East
- South
- West

## Customer Segments

- Consumer
- Corporate
- Home Office

## Ship Modes

- First Class
- Same Day
- Second Class
- Standard Class

## Initial Observations

- The dataset contains 9,994 transaction records.
- The dataset contains 21 columns.
- The dataset covers orders from January 2014 through December 2017.
- Multiple rows can belong to the same Order ID.
- The dataset contains sales, quantity, discount, and profit information.
- Product, customer, geographic, shipping, and time-related information are available.
- No blanks were identified during the initial inspection of the key analytical columns.

## Data Quality Notes

The raw CSV has not been manually cleaned or modified.

Date fields will be validated and assigned the appropriate data type
during PostgreSQL ingestion.

Further validation will be performed for:

- Missing values
- Duplicate records
- Invalid dates
- Invalid quantities
- Sales values
- Discount values
- Profit values
- Date consistency