package "git"
package "zsh"
package "cmigemo"
package "graphviz"
package "fonts-ricty-diminished"
package "w3m"
package "peco"
package "source-highlight"
package "wget"
package "jq"
package "redis"
package "mysql-client-5.7"
package "autojump"

# for rails(maybe)
package "libsqlite3-dev"
package "libmysqld-dev"

include_recipe "docker::install"
