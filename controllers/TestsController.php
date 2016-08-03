<?php

namespace app\controllers;

use yii\base\ErrorException;
use yii\base\Exception;

class TestsController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $filePath = "../yii-basic-app-2.0.9.tgz";
        try {
            $p = new \PharData($filePath);
            $path = $p->getPath();
            $dir = substr($path,0,strrpos($path,"."));
            if(!file_exists($dir)) {
                $p->extractTo($dir, null, true);
            }
            var_dump($dir);
            $files = $this->getAllFiles($dir);
            var_dump($files);
exit;

        }catch( ErrorException $e){
            echo $e->getMessage();
        }
        return $this->render('index');
    }

    public static function deleteDir($dirPath) {
        if (! is_dir($dirPath)) {
            throw new \InvalidArgumentException("$dirPath must be a directory");
        }
        if (substr($dirPath, strlen($dirPath) - 1, 1) != '/') {
            $dirPath .= '/';
        }
        $files = glob($dirPath . '*', GLOB_MARK);
        foreach ($files as $file) {
            if (is_dir($file)) {
                self::deleteDir($file);
            } else {
                unlink($file);
            }
        }
        rmdir($dirPath);
    }
    public function getAllFiles($dir){
        $result = array();
        if(is_dir($dir)){
            $items = array_diff(scandir($dir),array(".",".."));
            foreach($items as $item){
                $tmpPath = $dir."/".$item;
                if(is_dir($tmpPath)){
                    $result = array_merge($result,$this->getAllFiles($tmpPath));
                }else{
                    $result [] = $tmpPath;
                }
            }
        }else{
            $result [] = $dir;
        }
        return $result;
    }
}
