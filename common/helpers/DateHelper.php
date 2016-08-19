<?php
/**
 * Created by PhpStorm.
 * User: bruce
 * Date: 16/8/10
 * Time: 17:08
 */

namespace common\helpers;

class DateHelper
{
	public static function timeSpan($start,$to_time){
		return round(abs($to_time - $start) / 60,2). " minute";
	}
}