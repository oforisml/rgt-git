def main(bigstr,smallstr):
	list_of_equality = [smallstr.count(letter)==bigstr.count(letter) for letter in smallstr]

	# Returning `True` when the list <list_of_equality> contains `False` 
	is_true = (any(bool == False for bool in list_of_equality))

	# Converting the Value above to the right value, `True` becomes `False` and vice versa
	is_contained = not is_true

	return is_contained
#main("Samuelofori","Ofori")
