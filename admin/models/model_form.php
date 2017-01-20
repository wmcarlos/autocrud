<?php 
	require_once(models() . "model_db.php");
	class model_form extends model_db{
		private $item_id
				$window_id;

		public function __construct(){
			$this->item_id = null;
		}

		public function getwindow(){
			$sql = "select * from item where item_id = ".$this->item_id;
		}
	}
?>