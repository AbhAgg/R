import subprocess as cmd

cp = cmd.run("git add .", check=True, shell=True)
date = input("Date\n")
#month = input("Month\n")
cp = cmd.run(f"git commit --amend --no-edit --date=\"Jun {date} 20:00:00 2020 -0600\" -m \"add file\" ", check=True, shell=True)
cp = cmd.run("git pull", check=True, shell=True)
cp = cmd.run("git push", check=True, shell=True)
pawse = input("Done!")





'''
time.sleep(2)
CREATE_NO_WINDOW = 0x08000000
subprocess.call('taskkill /F /IM Notepad++.exe', creationflags=CREATE_NO_WINDOW)
#subprocess.call(["taskkill","/K","/IM", "Notepad++.exe"])
cp = cmd.run("git push", check=True, shell=True)
#import os as cmd
#import time as cmd
#print(cp)
if response.startswith('n'):
    message = input("What message you want?\n")
arr = ["Sat" , "Sun" , "Mon" , "Tue" , "Wed" , "Thu" , "Fri"]
#cp = cmd.run("git pull")
#cp = cmd.run("git pull")
'''

