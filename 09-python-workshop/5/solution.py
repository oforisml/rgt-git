def main(seconds):
	neg = False
	if seconds < 0:
		neg=True
		seconds*=-1

	#initializing hrs, mins, and secs
	hrs, mins, secs = 0,0,0
	hrs = seconds//3600
	mins= (seconds % 3600) // 60
	secs = (seconds % 3600) % 60
	#hrs = str(hrs).rjust(2,'0')
	mins = str(mins).rjust(2,'0')
	secs= str(secs).rjust(2,'0')
	if neg :
		return f"-{hrs}:{mins}:{secs}"
	return f"{hrs}:{mins}:{secs}"

#print(main(-3))
