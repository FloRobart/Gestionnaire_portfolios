<?php

require_once("User.inc.php");
require_once("Token.inc.php");
require_once("Portfolio.inc.php");
require_once("Projet.inc.php");
require_once("Competence.inc.php");

class DB {
	private static $singleton = null; 
	private $connexion=null; 
	
	/* Constructor */
	private function __construct() {
		$connStr = 'pgsql:host=localhost port=5432 dbname=mitsu'; 
		try {
			//Connecting to DB
			$this->connexion = new PDO($connStr, 'mitsu', 'amogus');  //TODO : A MODIFIERRRR
			$this->connexion->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER); 
			$this->connexion->setAttribute(PDO::ATTR_ERRMODE , PDO::ERRMODE_EXCEPTION); 
		} catch (PDOException $e) {
	  		echo "probleme de connexion :".$e->getMessage();  
			return null; 
		}
	}

	  //Singleton Pattern
	public static function getInstance() {
		self::$singleton = (self::$singleton == null ? new DB() : self::$singleton);

		//Connection error
		if (self::$singleton->connexion == null) {
			self::$singleton=null;
		}

		return self::$singleton;
	}

	public function close() {
		$this->connexion = null;
	}

	//General purpose query executing method
	private function execQuery($query,$parameterArray,$returnClass) {

		$stmt = $this->connexion->prepare($query);
		$stmt->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, $returnClass); 

		if ($parameterArray != null) {
			$stmt->execute($parameterArray);
		}
		else {
		 	$stmt->execute();
		}
		 
		$tab = array();
		$record = $stmt->fetch();
		while ($record != false) {
			$tab[] = $record;
			$record = $stmt->fetch();
		}
		
		return $tab;    
	}

	public function checkUsername($username) {
		$user = $this->execQuery("SELECT nom FROM Users WHERE nom = ?", array($username), "User");

		return empty($user);
	}

	public function createUser($username, $password) {
		$hash = password_hash($password, PASSWORD_BCRYPT);

		$this->execQuery("INSERT INTO Users VALUES (?,?)", array($username, $hash), "User");
	}

	public function checkAccount($username, $password) {
		$account = $this->execQuery("SELECT * FROM Users WHERE nom = ?", array($username), "User");	
		
		if (empty($account)) {return false;}

		return password_verify($password, $account[0]->hashmdp);
	}

	private function removeOutdatedTokens() {
		$this->execQuery("DELETE FROM Tokens WHERE expiration_date < ?", array(date("Y-m-d H:i:s" , time())), "");	
	}

	public function createToken($username, $token) {
		$this->removeOutdatedTokens();
		
		$expiration = time() + 86400; //24 hours duration

		$this->execQuery("INSERT INTO Tokens VALUES (?,?,?)", array($token, $username, date("Y-m-d H:i:s" , $expiration)), "");	
	}

	public function getUsernameFromToken($tokenid) {
		$this->removeOutdatedTokens();

		$result = $this->execQuery("SELECT * FROM Tokens WHERE tokenid = ?", array($tokenid), "Token");
		
		return $result[0]->username;
	}

	public function getPortfolio($username) {
		$result = $this->execQuery("SELECT * FROM Portfolio WHERE username = ?", array($username), "Portfolio");

		if (empty($result)) return null;
		
		return $result[0];
	}

	public function getLatestPortfolios() {
		$result = $this->execQuery("SELECT * FROM Portfolio ORDER BY id DESC LIMIT 6", array(), "Portfolio");

		if (empty($result)) return null;
		
		return $result;
	}

	public function getProjets($idFolio) {
		$result = $this->execQuery("SELECT DISTINCT p.* FROM Projet p NATURAL JOIN ProjetsPortfolio pp WHERE pp.idFolio = ?", array($idFolio), "Projet");

		if (empty($result)) return null;
		
		return $result;
	}

	public function getCompetences($idFolio) {
		$result = $this->execQuery("SELECT DISTINCT c.* FROM Competence c NATURAL JOIN CompetencesPortfolio p WHERE p.idFolio = ?", array($idFolio), "Competence");

		if (empty($result)) return null;
		
		return $result;
	}

	
}

?>
