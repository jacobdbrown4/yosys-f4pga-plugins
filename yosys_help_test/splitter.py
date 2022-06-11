f = open("delete_later.txt")
f_out = open("delete_later_2.txt", "w")

for line in f.readlines():
    for word in line.split(","):
        f_out.write(word+"\n")
