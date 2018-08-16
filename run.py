import sys
import os
import shutil


if __name__ == '__main__':
    file = sys.argv[1]
    input = sys.argv[2:]
    print(file)
    print("\n\n")
    print(input)
    shutil.copyfile(file,"running.hs")
    code = "type Input = "
    src = ''.join(input).upper()
    for a in src:
        code += "(Cons " + a + " "
    code += "Nil" + ")"*len(src)
    print(code)
    #search for type Test =
    newlines = "error"
    with open("running.hs",'r') as f:
        lines = f.readlines()
        newlines = [code if line.startswith("type Input = ") else line for line in lines]
    with open("running.hs",'w') as f:
        f.writelines(newlines)
    os.system("./interact.sh")
    os.system("rm running.hs")
