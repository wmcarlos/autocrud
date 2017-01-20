<?php
	class model_db{
		private $con,
				$result;

		private function connect(){
			include(config() . "db.php");
			$this->con = mysql_connect($db['server'],$db['user'],$db['password']) or die ("Error from Connect to Server" . mysql_error());
			mysql_select_db($db['database'], $this->con) or die ("Error from Select to Database " . mysql_error());
		}

		protected function execute($sql){
			$this->connect();
			$this->result = mysql_query($sql, $this->con) or die ("Error to execute query " . mysql_error());
			return mysql_affected_rows();
		}

		protected function getdata(){
			return mysql_fetch_array($this->result);
		}

		protected function transaction($t = "begin"){
			$t = strtoupper($t);
			$sql = "";
			switch ($t) {
				case 'BEGIN':
					$sql = "BEGIN";
				break;
				case 'COMMIT':
					$sql = "COMMIT";
				break;
				case 'ROLLBACK':
					$sql = "ROLLBACK";
				break;
			}
			return $this->execute($sql);
		}

		protected function free_result(){
			mysql_free_result($this->result);
		}

		protected function close(){
			mysql_close($this->con);
		}
	}
?>