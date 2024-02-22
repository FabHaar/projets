import fonctions
from flask import Flask, render_template, request

app = Flask(__name__, static_url_path='/static')

# Route pour la page d'accueil
@app.route('/')
def index():
	return render_template('index.html')
	 # pas de traitement, seulement index.html est renvoyé

# Route pour la page de création de nouveau compte
@app.route('/newuser', methods=['GET', 'POST'])
def new_user():
	message_mdp = ''
	message_email = ''
	message_username = ''
	message_succes = ''
	
	if request.method == 'POST':             # En attente d'une requête de type POST
		username = request.form['username']  # Récupère l'identifiant saisi dans le formulaire HTML
		email = request.form['email']        # Récupère l'email saisi dans le formulaire HTML
		password = request.form['password']  # Récupère le mot de passe saisi dans le formulaire HTML
		
		validation_mdp = fonctions.validate_password(password)                   #rempli la variable validation avec tout ce qu'il faut pour le traitement de chaque critère selon password
		
		check_p = True	#initilaisation d'un compteur qui servira à valider si toutes les regex sont respectées
		message_mdp ="Le mot de passe ne respecte pas les criteres suivants : "			
		if not validation_mdp[0]:                                   #Si ce le critère correspondant à cette case du tableau n'est pas respecté
			check_p = False                                         #Valeur de verif du mdp mis à false
			message_mdp = message_mdp + "Entre 6 et 15 caracteres " #Ajout du critère non, respecté au message du mdp
		if not validation_mdp[1]:
			check_p = False
			message_mdp = message_mdp + "Au moins un chiffre "
		if not validation_mdp[2]:
			check_p = False
			message_mdp = message_mdp + "Au moins une minuscule"
		if not validation_mdp[3]:
			check_p = False
			message_mdp = message_mdp + "Au moins une majuscule "
		if not validation_mdp[4]:
			check_p = False
			message_mdp = message_mdp + "Au moins un de ces caractères : #%{}@"
		
		if check_p:
			message_mdp = "Mot de passe valide"
		
		validation_username = fonctions.validate_username(username)
		check_u = True
		
		message_username = "Le username respecte pas les criteres suivants : "
		if not validation_username[0] :                                       #Si ce crière n'est pas respecté
			message_username = message_username + "Entre 6 et 10 caractères " #Ajout du critère non, respecté au message du username
			check_u = False                                                   #Valeur de verif du username mis à false
		if not validation_username[1] :
			message_username = message_username + "Pas de majuscule "
			check_u = False
		if not validation_username[2] :
			message_username = message_username + "Doit conbtenir seulement des caractères alphanumérique ascii"
			check_u = False
		
		if check_u:
			message_username = "Username valide"

		check_e = fonctions.validate_email(email)
		message_email = "email valide"
		
		if not check_e :
			message_email = "email non valide"
		
		if check_u and check_p and check_e: #On effectue le traitement suivant seulement si toutes les regex on été validés, sinon pas la peine de le faire
			#Requete qui vérifie si le username existe deja dans la bdd
			query = "SELECT COUNT(*) AS count FROM utilisateurs WHERE identifiant = '{}'" 
			query = query.format(username)
			
			insert = True
			
			if fonctions.check_username_email(query): #Execution de la requete
				insert = False                        #Si le username existe, on le rejette             
				message_username = message_username + " mais deja utilisé"
				
			#Requete qui vérifie si l'email existe deja dans la bdd
			query = "SELECT COUNT(*) AS count FROM utilisateurs WHERE email = '{}'"
			query = query.format(email)
				
			if fonctions.check_username_email(query): #Execution de la requete
				insert = False                        #Si l'email existe, on la rejette 
				message_email = message_email + " mais deja utilisé"
			
			if insert: #On fais le traitement suivant seulement si l'email et le username ne sont pas utilisé
				#Hachage du password pour ne pas le stocké en clair
				hashed_password = fonctions.hash_password(password)
				#Requete d'insertion
				query = "INSERT INTO utilisateurs (identifiant, email, password) VALUES ('{}', '{}', '{}')"
				query = query.format(username, email, hashed_password)
				
				#Execution de la requete
				fonctions.sql_insert(query)
				
				message_succes = "Compte créé avec succès"

	return render_template('newuser.html', message_mdp=message_mdp, message_email=message_email, message_username=message_username, message_succes=message_succes)# Renvoie la page HTML 'newuser.html' avec les messages à afficher


	
@app.route('/liste')
def liste():
	#Execution d'une requete pour connaitre tous les username dans la bdd
	data = fonctions.sql_select("SELECT identifiant FROM utilisateurs")
	return render_template('liste.html', data=data) #On retourne la page + le resultat de la requete pour l'afficher

@app.route('/connect', methods=['GET', 'POST'])
def connect():
	message_mdp = ''
	message_username = ''
	
	if request.method == 'POST':
		username = request.form['username']                
		password = request.form['password']
		
		#Requete qui verifie qu'un utilisateur existe
		query = "SELECT COUNT(*) AS count FROM utilisateurs WHERE identifiant = '{}'"
		query = query.format(username)
		
		if fonctions.check_username_email(query): #Si l'utilisateur existe
			#Requete pour vérifier qu'il met le bon mdp
			query = "SELECT password FROM utilisateurs WHERE identifiant = '{}'"
			query = query.format(username)
			
			#On execute la requete et on recupere le resultat en format str pour faciliter son traitement par la suite
			resultat = str(fonctions.sql_select(query))
			#On hache le password fourni sur la page, ce sera la même chose que dans la bdd s'il est correct
			password_hash = fonctions.hash_password(password)
			if resultat[3:-4] == password_hash: #On compare le resultat de la requete sans les caractères parasites du resultat de la requete avec le password fourni haché
				message_mdp = "Connexion Réussie"
			else: #cas mdp incorrect
				message_mdp = "Mot de passe incorrect"
		else: #cas username incorrect
			message_username = "Identifiant incorrect"
		
	return render_template('connect.html', message_mdp=message_mdp, message_username=message_username)



# Point d'entrée pour l'exécution de l'application Flask
if __name__ == '__main__':
	app.run(debug=True)
