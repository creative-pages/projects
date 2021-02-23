<?php 
	if (isset($_GET['pageId'])) {
		$pageId = $_GET['pageId'];
		$pageTitle = $forpage->selectSinglePage($pageId);
		if ($pageTitle) {
			while ($page_title = $pageTitle->fetch_assoc()) {
	?>
	<title><?php echo $page_title['name']; ?> || <?php echo TITLE; ?></title>
	<?php
			}
		}
	} elseif (isset($_GET['postId'])) {
		$postId = $_GET['postId'];
		$postTitle = $post->singlePost($postId);
		if ($postTitle) {
			$post_title = $postTitle->fetch_assoc();
	?>
	<title><?php echo $post_title['title']; ?> || <?php echo TITLE; ?></title>
	<?php
		}
	} else {
	?>
	<title><?php echo $format->title(); ?> || <?php echo TITLE; ?></title>
	<?php
		}
	?>
	<meta name="language" content="English">
	<meta name="description" content="It is a website about education">
	<?php 
	if (isset($_GET['postId'])) {
		$id = $_GET['postId'];
		$postTags = $post->singlePost($postId);
		if ($postTags) {
			$post_tags = $postTags->fetch_assoc();
		?>
		<meta name="keywords" content="<?php echo $post_tags['tags']; ?>">
		<?php
		}
	} else {
	?>
	<meta name="keywords" content="<?php echo $format->title(); ?> || <?php echo KEYWORDS; ?>">
	<?php
	}
	?>
	<meta name="author" content="Delowar">