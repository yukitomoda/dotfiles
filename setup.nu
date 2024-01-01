#!/usr/bin/env nu

def is-executable [$app: string] {
  (which $app | length) > 0
}

def is-symlink [$path: string] {
  let path = ($path | path expand -n)
  ($path | path type) == "symlink"
}

def rm-dir-symlink [$path: string] {
  let path = ($path | path expand -n)
  if (is-windows) {
    # Windows版nushellのバグ（ディレクトリのシンボリックリンクを削除できない）
    # のため、cmdの呼び出しで代替する
    let command = $"rmdir ($path)"
    cmd /C $command
  } else {
    rm $path
  }
}

def get-host-name [] {
  (sys).host.name
}

def is-windows [] {
  (get-host-name) == "Windows"
}

def is-ubuntu [] {
  (get-host-name) == "Ubuntu"
}

def create-dir-symlink [$target: string, $dest: string] {
  let target = ($target | path expand -n)
  let dest = ($dest | path expand -n)
  if (is-executable ln) {
    run-external "ln" "-s" $target $dest
  } else if ((is-windows) or (is-executable mklink)) {
    mklink "/D" $dest $target
  } else {
    error make {
      msg: "シンボリックリンクを作成する ln、mklink が利用できません。"
    }
  }
}

def confirm-overwrite [$path: string, $action: closure] {
  let path = ($path | path expand -n)

  if ($path | path exists) {
    let answer = (["上書き", "キャンセル"] | input list $"($path) はすでに存在します。上書きしますか？")

    if $answer != "上書き" {
      error make {
        msg: "セットアップはキャンセルされました。"
      }
    }

  }

  if (is-symlink $path) {
    rm-dir-symlink $path
  } else {
    rm -rf $path
  }

  $path | do $action
}

def config-path [$subpath: string] {
  ($env.FILE_PWD) | path join "files" $subpath
}

# ----
# main setup
# --- 

let isUbuntu = (is-ubuntu)
let isWindows = (is-windows)
let isSupported = [$isUbuntu $isWindows] | any {|| $in};

if not ($isSupported) {
  let hostName = (get-host-name)
  error make {
    msg: $"($hostName) は対象外です。"
  }
}

# nushell
do {
  let configDir = if $isUbuntu {
    "~" | path join ".config" "nushell"
  } else if $isWindows {
    "~" | path join "AppData" "Roaming" "nushell"
  }

  confirm-overwrite $configDir {||
    create-dir-symlink (config-path nushell) $in
  }
}

# wezterm
do {
  let configDir = $env.HOMEPATH | path join ".config" "wezterm"

  confirm-overwrite $configDir {||
    create-dir-symlink (config-path wezterm) $in
  }
}

# nvim
do {
  let configDir = if $isUbuntu {
    "~" | path join ".config" "nvim"
  } else if $isWindows {
    "~" | path join "AppData" "Local" "nvim"
  }

  confirm-overwrite $configDir {||
    create-dir-symlink (config-path nvim) $in
  }
}
