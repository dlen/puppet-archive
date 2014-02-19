define archive::zip($source, $target) {
  exec {"$name unpack":
    path    => "/usr/bin:/usr/sbin:/bin",
    command => "TMPFILE=\$(mktemp); curl -o \${TMPFILE}.zip ${source} && unzip \${TMPFILE}.zip -d ${target} && rm \$TMPFILE && rm \${TMPFILE}.zip && touch ${name}",
    creates => $name,
    require => Package['unzip'],
  }
}
