define archive::tar_gz($source, $target) {
  exec {"$name unpack":
    path    => "/usr/bin:/usr/sbin:/bin",
    command => "curl ${source} | tar -xzf - -C ${target} && touch ${name}",
    creates => $name,
    require => Package[curl],
  }
}
