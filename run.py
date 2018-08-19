import os
import shutil
import subprocess

def editFile(file,target,replace):
    newlines = []
    with open(file) as f:
        lines = f.readlines()
        for l in lines:
            #print(l)
            if l.startswith(target):
                newlines.append(replace)
            else:
                newlines.append(l)
    with open(file,'w') as f:
        f.writelines(newlines)


def numinput(num):
    if int(num) > 20:
        print("Number too high!")
    return "type Input = N"+num

def stringinput(string):
    code = "type Input = "
    src = ''.join(input).upper()
    for a in src:
        if a == " ":
            a = "Space"
        code += "(Cons " + a + " "
    code += "Nil" + ")"*len(src)
    return code

def output():
    s = str(subprocess.check_output(["./interact_noargs.sh"]))
    print("\nOutput:")
    #print(s)
    for l in s.split("\\r\\n")[9:-3]:
        print(l)
    #os.system("./interact.sh")
    #os.system("rm running.hs")

if __name__ == '__main__':
    file = "Main.hs"
    input = input(">>>")
    shutil.copyfile(file,"running.hs")
    code = numinput(input)
    print(code)
    editFile("running.hs","type Input = Nil",code)
    output()
