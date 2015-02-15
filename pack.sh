
cd ..
rm -rf Linux_Env.tar.Z

tar cvzf Linux_Env.tar.Z --exclude=.git --exclude=vim/bundle/YouCompleteMe ./Linux_Env/ > /dev/null 2>&1
#tar cvzf Linux_Env.tar.Z --exclude=.git --exclude *.so --exclude *.exe --exclude *.dll --exclude *.pdb ./Linux_Env/ > /dev/null 2>&1

#rm -rf Linux_Env.7z
#7z a Linux_Env.7z ./Linux_Env -xr\!.git -xr\!*.so > /dev/null 2>&1
cd -
