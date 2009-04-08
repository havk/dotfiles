call dirs.bat

:: Import vim config
@echo Importing vim config to %VIMDIR%
copy "%HOME%\_vimrc" ".vimrc"
xcopy /E /Y "%VIMDIR%" ".vim"

:: Import zsh config
copy "%HOME%\.zshrc" .zshrc
