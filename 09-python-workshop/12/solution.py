def main(logfile_path):
	file = ""
	_set = set()
	_stats = []
	with open(logfile_path, "r") as file:
		for line in file:
			print(line)
			s = line.split()
			_stats.append(s[8])
			_set.add(s[8])

		ret = [(int(item), _stats.count(item)) for item in sorted(_set)]
	return ret



print(main("example.log"))
