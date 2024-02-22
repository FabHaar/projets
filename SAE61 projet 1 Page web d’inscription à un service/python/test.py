import pytest
import fonctions as f

def test_regex_password() :
	assert f.validate_password("a") == [False,False,True,False,False]
	assert f.validate_password("aA#123azs") == [True,True,True,True,True]

def test_regex_username() :
	assert f.validate_username("fabien") == [True,True,True]
	assert f.validate_username("Fabien") == [True,False,True]

def test_regex_email() :
	assert f.validate_email("fabienhaar@gmail.com") == True
	assert f.validate_email("faaaaaaaaa") == False
