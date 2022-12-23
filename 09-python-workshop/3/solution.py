import string,re
def main(sentence):
	seps = " , . ; : )( { } \"'"
	bank =[]

	word=""

	print("MAIN SENTENCE",sentence)
	if len(sentence) !=0:
		for i in sentence+" ":
			if i in seps and len(word)!=0:
				bank.append(word.strip())
				word=""
			else:
				word+=i.strip()
		print(bank)
		return max(bank, key=len)
	return ""



print(main(" a bb ccc dddd"))
