call dirs.bat

@echo Installing vim config to %VIMDIR%
copy .vimrc "%HOME%\_vimrc"
xcopy /E /Y .vim "%VIMDIR%"
