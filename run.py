import os
import shutil
import subprocess


if __name__ == '__main__':
    file = "Main.hs"
    input = input(">>>")
    shutil.copyfile(file,"running.hs")
    code = "type Input = "
    src = ''.join(input).upper()
    for a in src:
        if a == " ":
            a = "Space"
        code += "(Cons " + a + " "
    code += "Nil" + ")"*len(src)
    #print(code)
    #search for type Test =
    newlines = "error"
    with open("running.hs",'r') as f:
        lines = f.readlines()
        newlines = [code if line.startswith("type Input = ") else line for line in lines]
    with open("running.hs",'w') as f:
        f.writelines(newlines)
    s = subprocess.check_output(["./interact.sh"]).split()[-5]
    print("\nOutput:")
    #print(s)
    print(str(s).count(")")+1)
    #os.system("./interact.sh")
    os.system("rm running.hs")
