import os

def findstrings():
    fileswstrings = []
    for dirName, subdirList, fileList in os.walk("./src"):
        print(dirName)
        for fname in fileList:
            filename = "%s/%s"%(dirName, fname)
            fin = open(filename, "r")
            readin = fin.read()
            fin.close()
            if "_OBF" in readin:
                fileswstrings.append(filename)
    print(fileswstrings)

if __name__ == "__main__":
    findstrings()
