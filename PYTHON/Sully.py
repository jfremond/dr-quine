import	os

i = 5
if i <= 0:
	exit(0)
path = __file__
filename = path.split('/')[-1]
child_path = "Sully_x.py"

res = filename.find("_")
if res != -1:
	i = i - 1
s_format	= "import	os{1}{1}i = {3}{1}if i <= 0:{1}	exit(0){1}path = __file__{1}filename = path.split('/')[-1]{1}child_path = {2}Sully_x.py{2}{1}{1}res = filename.find({2}_{2}){1}if res != -1:{1}	i = i - 1{1}s_format	= {2}{0}{2}{1}s	= s_format.format(s_format, chr(10), chr(34), i){1}child_path = child_path.replace({2}x{2}, str(i)){1}with open(child_path, 'w+') as file:{1}	file.write(s){1}{1}os.system({2}python {2} + child_path){1}"
s	= s_format.format(s_format, chr(10), chr(34), i)
child_path = child_path.replace("x", str(i))
with open(child_path, 'w+') as file:
	file.write(s)

os.system("python " + child_path)
