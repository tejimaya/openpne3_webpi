<?php use_helper('opActivity') ?>

<li class="activity">
<div class="box_memberImage">
<p><?php echo link_to(op_image_tag_sf_image($activity->getMember()->getImageFileName(), array('alt' => sprintf('[%s]', $activity->getMember()), 'size' => '48x48')), '@obj_member_profile?id='.$activity->getMemberId()) ?></p>
</div>
<div class="box_body">
<p>
<span class="content">
<?php if ($activity->getImages()->count()): ?>
<?php $images = $activity->getImages() ?>
<?php for ($i = 0; $i < $images->count() && $i < 3;$i++): ?>
<?php if ($images[$i]->getFileId()): ?>
<?php echo op_image_tag_sf_image($images[$i]->getFile(), array('size' => '48x48')) ?>
<?php else: ?>
<?php echo op_image_tag($images[$i]->getUri(), array('width' => 48, 'height' => 48)) ?>
<?php endif; ?>
<?php endfor; ?>
<br />
<?php endif; ?>
<strong class="name"><?php echo op_link_to_member($activity->getMember()) ?></strong>
<span class="bodyText"><?php echo op_activity_body_filter($activity) ?></span>
</span>
<span class="info">
<span class="time"><?php echo $time = op_format_activity_time(strtotime($activity->getCreatedAt())) ?>
<?php if ($activity->getSource()): ?>
 from <?php echo link_to_if($activity->getSourceUri(), $activity->getSource(), $activity->getSourceUri()) ?>
<?php endif; ?>
</span>
<?php if ($activity->getPublicFlag() != ActivityDataTable::PUBLIC_FLAG_SNS): ?>
<span class="public_flag"><?php echo __('Public flag') ?> : <?php echo $activity->getPublicFlagCaption() ?></span>
<?php endif; ?>
</span>
</p>
<?php
$operationItems = array();
if (!isset($isOperation) || $isOperation)
{
  if ($activity->getMemberId() == $sf_user->getMemberId())
  {
    $operationItems[] = array(
      'class' => 'delete',
      'body'  => link_to(__('Delete'), 'member/deleteActivity?id='.$activity->getId(), array('title' => __('Delete this activity of %time%', array('%time%' => $time)))),
    );
  }
}
?>
<?php if (0 < count($operationItems)): ?>
<ul class="operation">
<?php
foreach ($operationItems as $item)
{
  if (is_array($item) && isset($item['body']))
  {
    printf("<li%s>%s</li>\n", isset($item['class']) ? sprintf(' class="%s"', $item['class']) : '', $item['body']);
  }
}
?>
</ul>
<?php endif; ?>
</div>
</li>
