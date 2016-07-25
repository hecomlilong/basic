<?php echo $this->context->renderPartial('_copyright'); ?>
<table> <tr>

		<th>Title</th>
		<th>Date</th> </tr>
	<?php foreach($newsList as $item) { ?> <tr>
		<td><a href="<?php echo Yii::$app->urlManager->createUrl(['news/item-detail' , 'id' => $item['id']]) ?>"><?php echo $item['title'] ?></a></td>
		<td><?php echo Yii::$app->formatter->asDatetime($item['date'], "php:d/m/Y"); ?></td> </tr>
	<?php } ?> </table>