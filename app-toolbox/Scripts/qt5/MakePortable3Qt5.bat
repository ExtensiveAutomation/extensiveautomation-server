:: -------------------------------------------------------------------
:: Copyright (c) 2010-2017 Denis Machard
:: This file is part of the extensive testing project
::
:: This library is free software; you can redistribute it and/or
:: modify it under the terms of the GNU Lesser General Public
:: License as published by the Free Software Foundation; either
:: version 2.1 of the License, or (at your option) any later version.
::
:: This library is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
:: Lesser General Public License for more details.
::
:: You should have received a copy of the GNU Lesser General Public
:: License along with this library; if not, write to the Free Software
:: Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
:: MA 02110-1301 USA
:: -------------------------------------------------------------------

@echo off

set Project=%~dp0..\..\

set PythonPath=C:\Python36-32
set Python=%PythonPath%\python.exe

:: make resources
%PythonPath%\python.exe -m PyQt5.pyrcc_main -o "%Project%\Resources\Resources.py" "%Project%\Resources\__resources.qrc"

:: build the project
echo Build the project...
cd "%Project%"
%Python% "%Project%\ConfigureExe.py" portable
%Python% "%Project%\BuildWinCx.py" build_exe -b __build__ -O2 --zip-include-packages * --zip-exclude-packages none

pause