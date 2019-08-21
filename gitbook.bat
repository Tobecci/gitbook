@echo OFF
:menu
echo choose an option
echo [0] initialize a repo
echo [1]  git status
echo [2]  add all files
echo [3]  commit
echo [4]  push to repo
echo [5]  synchronize repository
echo [6]  show remotes
echo [7]  add remote
echo [8]  show branches
echo [9]  add a branch
echo [10] checkout a branch
echo [11] delete a branch 
echo [12] rename a remote
echo [13] remove a remote
echo [14] clone a repo
echo [x] exit the program
set /P choice=make your choice:

IF %choice%==0 (goto option0)
IF %choice%==1 (goto option1)
IF %choice%==2 (goto option2)
IF %choice%==3 (goto option3)
IF %choice%==4 (goto option4)
IF %choice%==5 (goto option5)
IF %choice%==6 (goto option6)
IF %choice%==7 (goto option7)
IF %choice%==8 (goto option8)
IF %choice%==9 (goto option9)
IF %choice%==10 (goto option10)
IF %choice%==11 (goto option11)
IF %choice%==12 (goto option12)
IF %choice%==13 (goto option13)
IF %choice%==14 (goto option13)
IF %choice%==x (goto x)

goto wrongInput

:option0
cls
git init
pause
goto menu

:option1
cls
git status
pause
goto menu

:option2
cls
git add --all
git status
pause
goto menu

:option3
cls
set /P msg=enter commit message:
git commit -m "%msg%"
git status
pause
goto menu

:option4
cls
set /p remote=remote name:
set /p branch=branch on the remote:
git push %remote% %branch%
pause
goto menu

:option5
cls
echo MAKE SURE YOU ARE ON THE BRANCH THAT IS TO BE SYNCHRONIZED
git branch
set /p upstream=Upstream remote name:
set /p branch=branch to be synchronized with:
git fetch %upstream%
git pull %upstream% %branch%
pause
goto menu

:option6
cls
git remote -v
pause
goto menu

:option7
cls
set /p name=Enter remote name:
set /p url=Enter remote url:
git remote add %name% %url%
pause
goto menu

:option8
cls
echo EXISTING BRANCHES
git branch
pause
goto menu

:option9
cls
echo EXISTING BRANCHES
git branch
set /p name=Enter branch name to create:
git branch %name%
echo EXISTING BRANCHES
git branch
pause
goto menu

:option10
cls
echo EXISTING BRANCHES
git branch
set /p name=which branch above do you want to checkout:
git checkout %name%
echo EXISTING BRANCHES
git branch
pause
goto menu

:option11
cls
echo EXISTING BRANCHES
git branch
set /p name=which branch above do you want to delete:
git branch -D %name%
echo EXISTING BRANCHES
git branch
pause
goto menu

:option12
cls
echo EXISTING REMOTES
git remote -v
set /p old=old name:
set /p new=new name:
git remote rename %old% %new%
echo EXISTING REMOTES
git remote -v
pause
goto menu

:option13
cls
echo EXISTING REMOTES
git remote -v
set /p name=name of remote to remove:
git remote remove %name%
echo EXISTING REMOTES
git remote -v
pause
goto menu

:option14
cls
set /p url=enter git url:
git clone %url%
pause
goto menu

:wrongInput
cls
echo your input is invalid
pause
goto menu

:x
cls
echo goodbye