
cd ..
rm -rf Linux_Env.tar.Z
#tar cvzf Linux_Env.tar.Z --exclude=.git ./Linux_Env/ 
tar cvzf Linux_Env.tar.Z --exclude=.git --exclude=vim/bundle/YouCompleteMe ./Linux_Env/ 
cd -
