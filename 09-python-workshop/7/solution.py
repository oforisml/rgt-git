def main(word,parts):
	parts_list = parts.split(",")
	for i in range(0, len(parts_list)):
		for j in  range(0, len(parts_list)):
			if i!=j:
				if (parts_list[i]+parts_list[j]==word):
					return [parts_list[i], parts_list[j]]
				elif (parts_list[j]+parts_list[i] ==word):
					return [parts_list[j], parts_list[i]]
	return []




print(main("cathello", "apple,bat,cat,goodbye,hello"))
