<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>

<?php include_http_metas() ?>
<?php include_metas() ?>

<title><?php echo __('%sns% Administration', array('%sns%' => $op_config['sns_name'])) ?></title>


    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>
</head>
<body id="<?php echo $sf_request->getParameter('module').'_'.$sf_request->getParameter('action') ?>"<?php if (!$sf_user->isAuthenticated()) : ?> class="insecure"<?php endif; ?>>
<div id="wrap">
<div id="contents" class="clearfix">

<div id="header">
<h1><?php echo __('%sns% Administration', array('%sns%' => $op_config['sns_name'])) ?></h1>
<span id="visit-site"><a href="<?php echo app_url_for('pc_frontend', '@homepage', true) ?>" target="_blank"><?php echo __('Visit Site') ?></a></span>
</div>

<?php if ($sf_user->isAuthenticated()) : ?>
<div id="menu">
<ul>
<li><?php echo link_to(__('Top page'), '@homepage') ?></li>
<?php include_component('default', 'sideMenu') ?>
<li><?php echo link_to(__('Logout'), 'default/logout') ?></li>
</ul>
</div>
<?php endif; ?>

<div id="body">
<?php if (has_slot('submenu')): ?>
<ul id="submenu">
<?php include_slot('submenu') ?>
</ul>
<?php endif; ?>
<?php if (has_slot('title')): ?>
<h2><?php include_slot('title') ?></h2>
<?php endif; ?>

<?php if ($sf_user->hasFlash('error')): ?>
<p id="flashError" class="flash"><?php echo __($sf_user->getFlash('error')) ?></p>
<?php endif; ?>
<?php if ($sf_user->hasFlash('notice')): ?>
<p id="flashNotice" class="flash"><?php echo __($sf_user->getFlash('notice')) ?></p>
<?php endif; ?>


<?php echo $sf_content ?>
</div>
</div>

</div>

<?php if ($sf_user->isAuthenticated()) : ?>
<div id="footer" style="width: 100%; background: #FFFFFF;">
<p id="openpne_version">Powered by OpenPNE <?php echo OPENPNE_VERSION ?></p>
</div>
<?php endif; ?>
</body>
</html>
