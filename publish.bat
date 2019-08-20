@ECHO OFF 

SET /P VERSION=<src\VERSION

RD /S /Q "dist" "venv" "build" "__pycache__" "lightnovel_crawler.egg-info" &

python -m venv venv
CALL venv\Scripts\activate.bat

python -m pip install --upgrade pip

python -m pip install wheel 
python -m pip install PyInstaller
python -m pip install -r requirements.txt 

python setup.py package bdist_wheel sdist 

CALL venv\Scripts\deactivate.bat
RD /S /Q "venv" "build" "__pycache__" "lightnovel_crawler.egg-info" &

python -m pip install twine 
twine upload "dist\lightnovel_crawler-%VERSION%-py3-none-any.whl" 

ECHO ON
