import string, re
def main(_str):
	sep = " ,;."
	ret = ""
	first_letter = True
	for i in _str: 
		if first_letter: ret +=i.upper()
		else: ret +=i.lower()
		first_letter = i in sep
	return ret

print(main("I  .   don't   .     like   .    @moon:   ,:@#$%dances"))
