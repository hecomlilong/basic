<?php
/**
 * Created by PhpStorm.
 * User: bruce
 * Date: 16/8/20
 * Time: 07:08
 */

class PythonBase{
	const PYTHONPATH = "../python/";
	public static function yell()
	{
		echo "I am FREE!";
	}
	public static function get_hist_data($stockCode){
		// This is the data you want to pass to Python
		$param = array($stockCode);

		// Execute the python script with the JSON data
//		$result = exec('python '.self::PYTHONPATH.'get_hist_data.py ' . escapeshellarg(json_encode($param)));
		exec('python '.self::PYTHONPATH.'get_hist_data.py',$result);

//		system('python '.self::PYTHONPATH.'get_hist_data.py',$result);
var_dump($result);
		// Decode the result
//		$resultData = json_decode($result, true);

		// This will contain: array('status' => 'Yes!')
//		var_dump($resultData);
	}
}