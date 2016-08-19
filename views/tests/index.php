<?php
/* @var $this yii\web\View */
?>
<h1>tests/index</h1>

<p>
    You may change the content of this page by modifying
    the file <code><?= __FILE__; ?></code>.
</p>

<p>
    <?php var_dump($test);?>
</p>
<!doctype html>
<html ng-app>

<head>
    <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
</head>

<body>
<div>
    <label>Name:</label>
    <input type = "text" ng-model = "yourName" placeholder = "Enter a name here">
    <hr />

    <h1>Hello {{yourName}}!</h1>
</div>

</body>
</html>