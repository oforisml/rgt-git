#!/usr/bin/python3

#Importing sys, and csv to read the csv file
import sys, csv

# Variables to store the command line arguments
file_name = sys.argv[1]
column    = sys.argv[2]

# Function to read the csv
def read_file(file_name, num):
	summation = 0  	#Initialization the summation varible which would hold the entire sum

	# Opening the csv file
	with open(file_name, 'r') as file:
		csv_reader = csv.reader(file, delimiter=',')
		next(csv_reader, None) # skips the header
		for row in csv_reader:
			summation+=int(row[num-1]) # summing the values in the specified column
		print("The total amount is",summation)


try:
	row = int(column)
	if(row >= 1):
		read_file(file_name, row)
	else:
		print("Row number should be greater than 0")
except ValueError:
	print("Usage: \n\tsum-columns.py <file_path> <column_num>\n")
	sys.exit(1)

