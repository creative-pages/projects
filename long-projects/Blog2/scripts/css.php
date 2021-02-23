<link rel="stylesheet" href="font-awesome-4.5.0/css/font-awesome.css">	
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="style.css">
<?php 
$theme = new Theme();
$selectTheme = $theme->selectTheme();
$select_theme = $selectTheme->fetch_assoc();
?>
<link rel="stylesheet" href="theme/<?= $select_theme['theme']; ?>.css">