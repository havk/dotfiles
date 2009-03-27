call dirs.bat

@echo Installing vim config to %VIMDIR%
copy .vimrc "%HOME%\_vimrc"
copy .gvimrc "%HOME%\_gvimrc"
xcopy /E /Y .vim "%VIMDIR%"
