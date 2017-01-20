<?php 
	require_once(models() . "model_db.php");

	class model_user extends model_db{
		private $user_id,
				$role_id,
				$created,
				$updated,
				$first_name,
				$last_name,
				$sex,
				$birthday,
				$email,
				$phone,
				$username,
				$password,
				$avatar,
				$isactive;

		public function __construct(){
			$this->user_id = "";
			$this->role_id = "";
			$this->created = "";
			$this->updated = "";
			$this->first_name = "";
			$this->last_name = "";
			$this->sex = '';
			$this->birthday = "";
			$this->email = "";
			$this->phone = "";
			$this->username = "";
			$this->password = "";
			$this->avatar = "";
			$this->isactive = '';	
		}

		public function __set($atr, $val){
			$this->$atr = $val;
		}

		public function __get($atr){
			return $this->$atr;
		}

		public function get($type = "all"){
			$type = strtolower($type);
			$sql = "";

			switch ($type) {
				case "all":
					$sql = "select * from user order by first_name, last_name asc";
				break;
				case "single":
					$sql = "select * from user where user_id = ".$this->user_id;
				break;
				case "login":
					$sql = "select 
							u.role_id,
							u.username, 
							p.strpassword
						from user as u 
							inner join password as p on (u.user_id = p.user_id and p.isactive = 'Y')
							where u.username = UCASE('$this->username') and p.strpassword = MD5('$this->password')";
				break;
			}

			$this->execute($sql);
			while($row = $this->getdata()){
				$arr[] = $row;
			}

			return $arr;
		}
	}	
?>