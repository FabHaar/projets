import mysql.connector
import re
import hashlib

def validate_password(password):
	regex1 = r"^.{6,15}$" #entre 6 et 15 caractères
	regex2 = r".*\d.*" #au moins un chiffre
	regex3 = r".*[a-z].*" #au moins une minuscule
	regex4 = r".*[A-Z].*" #au moins une majuscule
	regex5 = r".*[#%{}@].*" #au moins un de ces caractères
	
	tab_validation = [bool(re.match(regex1, password)), bool(re.match(regex2, password)), bool(re.match(regex3, password)), bool(re.match(regex4, password)), bool(re.match(regex5, password))]
	return tab_validation

def validate_username(username):
	regex1 = r"^.{6,10}$" #entre 6 et 10 caractères
	regex2 = r"^[^A-Z]*$" #Pas de majuscule
	regex3 = r"^[a-zA-Z0-9]*$" #Seulement les caractères alphanumrique ascii à revoir pour celle là
	
	tab_validation = [bool(re.match(regex1, username)), bool(re.match(regex2, username)), bool(re.match(regex3, username))]
	return tab_validation

def validate_email(email):
	regex = r"[A-Za-z0-9_\-\.]+@[A-Za-z0-9\-\.]+"
	
	return bool(re.match(regex, email))

#info de connexion pour la base de donnees
db_config = {
	'host': 'serveur-mysql',
	'user': 'python',
	'password': 'python',
	'database': 'sae61',
	'port': '3306'
}

#fonction pour faire un insert dans la bdd
def sql_insert(query):
	# Connexion à la bdd
	conn = mysql.connector.connect(**db_config)
	cursor = conn.cursor()
	
	#Execution de la requete
	cursor.execute(query)
	conn.commit()
    
	#fin de connexion
	cursor.close()
	conn.close()

#fonction pour faire un select dans la bdd
def sql_select(query):
	# Connexion à la bdd
	conn = mysql.connector.connect(**db_config)
	cursor = conn.cursor()
	
	#Execution de la requete
	cursor.execute(query)
	#Recuperation du select
	data = cursor.fetchall()
	
	#fin de connexion
	cursor.close()
	conn.close()
	return data

#fonction pour crypter un mdp
def hash_password(password):
	password_bytes = password.encode('utf-8')
	sha256_hash = hashlib.sha256()
	sha256_hash.update(password_bytes)
	hashed_password = sha256_hash.hexdigest()
	
	return hashed_password
	
#fonction pour vérifier si un email ou un username existe dans la bdd
#fonctionne un peu différement de la focntion sql_select
def check_username_email(query):
	# Connexion à la bdd
	conn = mysql.connector.connect(**db_config)
	cursor = conn.cursor()
	
	#Execution de la requete
	cursor.execute(query)
	#Recuperation du select
	data = cursor.fetchone()
	
	#fin de connexion
	cursor.close()
	conn.close()
	
	#retourne True si le username ou email existe dans la bdd False s'il existe pas
	return data[0] > 0

