<?php
if ($_SERVER["REQUEST_URI"] == '/') {
  header('Location: http://' . $_SERVER['HTTP_HOST'] . '/?pgsql=' . getenv('POSTGRES_HOST') . '&username=' . getenv('POSTGRES_USER') . '&db=' . getenv('APP'));
  die();
}

function adminer_object() {

  include_once "./plugins/plugin.php";

  foreach (glob("plugins/*.php") as $filename) {
    include_once "./$filename";
  }

  $plugins = array(
    new AdminerJsonPreview
  );

  class AdminerCustomization extends AdminerPlugin {
    function name() {
      return getenv('APP');
    }
    function credentials() {
      return array(
        getenv('POSTGRES_HOST') . ':' . getenv('POSTGRES_PORT'), getenv('POSTGRES_USER'), getenv('POSTGRES_PASSWORD')
      );
    }
    function database() {
      return getenv('APP');
    }
  }
  return new AdminerCustomization($plugins);
}

include "./adminer.php";

?>
